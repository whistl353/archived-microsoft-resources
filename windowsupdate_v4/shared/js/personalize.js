var g_oUserData, g_bSavedSettings = true;

function fnInitPersonalization(iPage, iSubPage){
	var sCatalogLinkEnabled;

	if(!parent.g_bControlInitialized) return false;

	g_oUserData = parent.eTOC.g_oUserData;

	sCatalogLinkEnabled = g_oUserData.getAttribute("bCatalogLink");
	eCatalogLink.checked = (sCatalogLinkEnabled == "1" || (sCatalogLinkEnabled == null && parent.g_bOSIsServer));

	parent.g_bPosted = false;

	fnInit(iPage, iSubPage);
}

function fnUnloadPersonalization(){
	if(!g_bSavedSettings && window.confirm(parent.L_PersonalizationSaveSettingsPrompt_Text)) fnSaveSettings();
	g_bSavedSettings = true;
}

// modifies the userdata  based on new personalization and also updates the catalog xml\\

function fnSaveSettings(){
	var oCatalogXML, oLink, vCheckboxes, iCheckboxesLen, oCheckbox, bPersonalized, iLevel, sID, oNode, i;
	var sPersonalizedIDs, bCurrentlyPersonalized, aLevelPatterns, aUserDataNames, aPersonalizedIDs;
	var vItems,iItemLen,aItemidFields,sPartialItemid,j,sItemid,sItemName;

	g_bSavedSettings = true;
	eSaveSettings.disabled = true;

	if("object" == typeof(ePersonalizeCatalog)){
		oCatalogXML = parent.g_oCatalogXML;

		aLevelPatterns = ["product", "product/group", "product/group/item"];
		aUserDataNames = ["aPersonalizedProducts", "aPersonalizedGroups", "aPersonalizedItems"];
		aPersonalizedIDs = [[], [], []];

		for(i = 0; i < 3; i++){
			aPersonalizedIDs[i] = g_oUserData.getAttribute(aUserDataNames[i]);

			if(aPersonalizedIDs[i] == null || aPersonalizedIDs[i] == ""){
				aPersonalizedIDs[i] = "|@|";
			}else{
				aPersonalizedIDs[i] = "|@|" + aPersonalizedIDs[i].replace(/,/g, "|@|") + "|@|";
			}
		}

		vItems=oCatalogXML.selectNodes("provider/" + aLevelPatterns[2] + "[identity]");
		iItemLen=vItems.length;

		vCheckboxes = ePersonalizeCatalog.getElementsByTagName("input");
		iCheckboxesLen = vCheckboxes.length;
		for(i = 0; i < iCheckboxesLen; i++){
			oCheckbox = vCheckboxes[i];
			iLevel = oCheckbox.level;
			if(iLevel == null) continue;
			iLevel = parseInt(iLevel);
			sID = oCheckbox.id;
			bPersonalized = !oCheckbox.checked;
			if(iLevel == 2){ // this code was added to accomodate change of WUPM data format where product id may change for the same item
				aItemidFields = sID.split(".");
				sPartialItemid=aItemidFields[12] + "." + aItemidFields[13];  // pubname.name
				bCurrentlyPersonalized = (aPersonalizedIDs[iLevel].indexOf(sPartialItemid) != -1); // to check for item level if any other id with same partialitemid is present already
				for(j=0;j<iItemLen;j++){
					sItemid=vItems[j].selectSingleNode("identity/@itemID").text ;
					sItemName=vItems[j].selectSingleNode("identity/@name").text.toLowerCase() ;
					if (sItemid.indexOf(sPartialItemid)!= -1 && sItemName == aItemidFields[13].toLowerCase()){ //item found in catalogxml to set the personalized attribute
						oNode=vItems[j];
						break;
					}
				}
			}
			else {
				bCurrentlyPersonalized = (aPersonalizedIDs[iLevel].indexOf("|@|" + sID + "|@|") != -1);
				oNode = oCatalogXML.selectSingleNode("provider/" + aLevelPatterns[iLevel] + "[identity/@itemID = '" + sID + "']")
			}

			if(iLevel == 0){
				oLink = parent.eTOC.document.all[sID];
				if("object" == typeof(oLink)){
					if(bPersonalized){
						oLink.parentElement.removeChild(oLink.nextSibling, true);
						oLink.parentElement.removeChild(oLink, true);
					}
				}else{
					parent.fnAddTOCLink(sID, oNode.selectSingleNode("title").text, oNode.selectNodes("group/item[not(hidden)][not(personalized)]").length);
				}
			}else if(iLevel == 2){
				if(bPersonalized && oNode.getAttribute("basket") == "1"){ // if the item which is personalized is already in the basket , remove it frm basket
					parent.g_iConsumerBasketCount--; // decrease the count in basket
					parent.g_iConsumerBasketSize -= parseInt(oNode.selectSingleNode("size").text);
					oNode.removeAttribute("basket");
					if(oNode.selectSingleNode("exclusive") != null) parent.g_sExclusiveUpdateTitle = null;
				}
			}

			if(bPersonalized){ // if the checkbox is unchecked
				oNode.setAttribute("personalized", "1");
				if(!bCurrentlyPersonalized) aPersonalizedIDs[iLevel] += sID + "|@|";
			}else{
				oNode.removeAttribute("personalized");
				if(bCurrentlyPersonalized){
					if(iLevel == 2){
						aPersonalizedIDs[iLevel]=fnRemoveSimilarItemid(aPersonalizedIDs[iLevel],sPartialItemid);
					}
					else {
						 aPersonalizedIDs[iLevel] = aPersonalizedIDs[iLevel].replace("|@|" + sID + "|@|", "|@|");
					}
				}
			}
		}// end of for loop


		for(iLevel in aPersonalizedIDs){
			sPersonalizedIDs = aPersonalizedIDs[iLevel];
			sPersonalizedIDs = sPersonalizedIDs.replace(/\|@\|/g, ",");
			sPersonalizedIDs = sPersonalizedIDs.replace(/(^,)|(,$)/g, "");
			g_oUserData.setAttribute(aUserDataNames[iLevel], sPersonalizedIDs);
		}

		parent.fnUpdateTOCNumbers();
	}

	(eCatalogLink.checked) ? g_oUserData.setAttribute("bCatalogLink", "1") : g_oUserData.setAttribute("bCatalogLink", "0");

	g_oUserData.save("oWindowsUpdate")
	parent.eTOC.fnEnableCatalogLink();
}

function fnRemoveSimilarItemid(sPersonalizedIDs,sPartialItemid){

	var re = new RegExp("(\\|@\\|\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\.\\w*\\." + sPartialItemid + "\\.\\w*\\|@\\|)","i");
	var arr=re.exec(sPersonalizedIDs);
	return sPersonalizedIDs.replace(RegExp.$1, "|@|");

}

function fnUpdatePersonalization(){
	var oCheckbox, oChildrenDiv;

	oCheckbox = window.event.srcElement;

	if(oCheckbox.type != "checkbox") return true;

	g_bSavedSettings = false;
	eSaveSettings.disabled = false;

	if(oCheckbox.level != null){
		if(oCheckbox.checked) fnCheckParents(oCheckbox, true);
		oChildrenDiv = oCheckbox.nextSibling.nextSibling.nextSibling;
		if(oChildrenDiv != null && oChildrenDiv.tagName.toLowerCase() == "div") fnCheckChildren(oChildrenDiv, oCheckbox.checked);
	}
}

function fnCheckParents(oCheckbox, bCheck){
	if(bCheck == null) bCheck = true;

	var oParentCheckbox;

	oParentCheckbox = oCheckbox.parentElement.previousSibling.previousSibling.previousSibling;
	if(oParentCheckbox != null && oParentCheckbox.tagName.toLowerCase() == "input"){
		oParentCheckbox.checked = bCheck;
		fnCheckParents(oParentCheckbox, bCheck);
	}
}

function fnCheckChildren(oParent, bCheck){
	if(bCheck == null) bCheck = true;

	var vInputs, iInputsLen, i;

	vInputs = oParent.getElementsByTagName("input");
	iInputsLen = vInputs.length;
	for(i = 0; i < iInputsLen; i++) if(vInputs[i].type == "checkbox") vInputs[i].checked = bCheck;
}

function fnExpandNode(oBulletImage){
	var oChildDiv;

	oChildDiv = oBulletImage.nextSibling.nextSibling.nextSibling.nextSibling;

	if(oChildDiv.currentStyle.display == "none"){
		oChildDiv.style.display = "block";
		oBulletImage.src = oBulletImage.src.replace("_collapsed", "_expanded");
	}else{
		oChildDiv.style.display = "none";
		oBulletImage.src = oBulletImage.src.replace("_expanded", "_collapsed");
	}
}