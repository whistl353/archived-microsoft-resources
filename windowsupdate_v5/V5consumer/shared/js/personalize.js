//Copyright (c) Microsoft Corporation.  All rights reserved.
var g_oUserData, g_bSavedSettings = true;
var LanRadioIndex = 0;
var LanIndexChanged = false;

function fnInitPersonalization(iPage, iSubPage){ 
	var sBetaLinkEnabled, sNewsLinkEnabled;
	g_oUserData = parent.eTOC.g_oUserData;
	sBetaLinkEnabled = g_oUserData.getAttribute("bBetaLink");
	eBetaLink.checked = (sBetaLinkEnabled == "1");
	parent.g_bPosted = false; 
	fnInit(iPage, iSubPage);
	fnWriteLanguages();
} 
function fnGetLanID(sLanID){
	var sAllSupported = "ar,cs,da,de,el,en,es,fi,fr,he,hu,it,ja,ko,nl,no,pl,ru,sv,tr,";
	switch(sLanID)
	{
		case "en":
		case "en-us":
			return "en" ;
		case "be":
		case "uk":
			return "ru" ;
		case "el_ms":
		case "el":
			return "el" 
		case "eu":
		case "ca":
			return "es" ;
		case "zh-sg":
			return "zh-cn" ;
		case "fo":
			return "da" ;
		case "sz":
			return "no" ;
		case "sk":
			return "cs" ;
		case "sb":
			return "de" ;
		case "nb-no":
		case "nn-no":
			return "no" ;
		case "iw-il":
			return "he" ; 
		case "pt":
			return "pt-pt";	
	}
	if((sLanID == "zh-tw") || (sLanID == "zh-cn") || (sLanID == "pt-br") || (sLanID == "zh-hk") || (sLanID == "pt-pt")) return sLanID;	
	sLanID = sLanID.substr(0,2);	
	if(sAllSupported.search(sLanID + ",") < 0 ) sLanID = "en";
	return sLanID;
}
function fnWriteLanguages(){
	var aSetLan = sLan.split("@|");
	if(aSetLan.length == 1){
		 aSetLan = sLan.split(",");
	}
	var sLanID ="ar,zh-cn,zh-tw,zh-hk,cs,da,nl,en,fi,fr,de,el,he,hu,it,ja,ko,no,pl,pt-br,pt-pt,ru,es,sv,tr";
	var aLanID = sLanID.split(",");
	var sStr = "<table ><tr><td>";
	var sChecked="";
	var sDisplayRecomended, aCurrentLan, sCurrentLanID, sCurrentLan ;
	var sRecLN = fnGetLanID(navigator.browserLanguage);
	sLN = fnGetLanID(sLN);
	var aSortLan = new Array(aSetLan.length - 1);
	for(i = 0; i < aSetLan.length; i++) {
		aSortLan[i] = aSetLan[i] + "//" + aLanID[i]
	}
	aSortLan.sort();
	for(i = 0; i < aSortLan.length; i++) {
	if( i %9 == 0 && i != 0){
		sStr += "</td><td valign=top>"
	}
	sChecked = "";
	sDisplayRecomended = "";
	aCurrentLan = aSortLan[i].split("//")
	sCurrentLanID = aCurrentLan[1]
	sCurrentLan = aCurrentLan[0]
	if(sLN == sCurrentLanID){
		sChecked = "checked"
		LanRadioIndex = i;
	}
	if(sRecLN == sCurrentLanID) sDisplayRecomended = sRecommended
	sStr += "<input onclick = 'return LanSelection_onChange(" + i + ")' value = '" + sCurrentLanID +"'  align = 'absmiddle' id = 'LanSelection' name = 'LanSelection' type = 'radio'" + sChecked + " >" + sCurrentLan +" <b>" + sDisplayRecomended + "</b><br/>";
	}
	sStr += "</td></tr></table>"
	LanDiv.innerHTML = sStr;
}
function fnUnloadPersonalization(){
	if(!g_bSavedSettings && window.confirm(parent.L_PersonalizationSaveSettingsPrompt_Text)) fnSaveSettings();
	g_bSavedSettings = true;
}
function LanSelection_onChange(Index){
	if(LanRadioIndex != Index){
		eSaveSettings.disabled = false; 
		LanIndexChanged = true;
		LanRadioIndex = Index;
	}
	return true;
}
function fnSaveSettings(){
	var oCatalogXML, oLink, vCheckboxes, iCheckboxesLen, oCheckbox, bPersonalized, iLevel, sID, oNode, i;
	var sPersonalizedIDs, bCurrentlyPersonalized, aLevelPatterns, aUserDataNames, aPersonalizedIDs;
	g_bSavedSettings = true;
	eSaveSettings.disabled = true;
	(eBetaLink.checked) ? g_oUserData.setAttribute("bBetaLink", "1") : g_oUserData.setAttribute("bBetaLink", "0");
	g_oUserData.setAttribute("LanSelection",LanSelection[LanRadioIndex].value)	
	try{
		g_oUserData.save("oWindowsUpdate");
	}catch(e){
		alert(parent.L_NeedUserData_Text);
		return false;
	}
	//alert(parent.L_UserDataSaved_Text);	
	parent.eTOC.fnEnableBetaTree();
	if(LanIndexChanged && confirm(parent.L_PersonalizationReloadSite_Text)){		
		parent.location.href = "default.aspx?ln=" + LanSelection[LanRadioIndex].value;		
	}
	LanIndexChanged =false
}

function fnUpdatePersonalization(){
	var oCheckbox, oChildrenDiv;
	oCheckbox = window.event.srcElement;

	if(oCheckbox.type != "checkbox") return true;
	g_bSavedSettings = false;
	eSaveSettings.disabled = false;

}


