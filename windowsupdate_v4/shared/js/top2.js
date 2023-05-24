var conProviderLevel = "Providers";
var conProductLevel = "Products";
var conItemLevel = "Items";
var conItemDetailsLevel = "ItemDetails";
var conDependencyLevel = "Dependencies";
var conInstallationLevel = "Installation";
var conDriverLevel = "DriverUpdates";
var conDriverDebugLevel = "DriverUpdatesDebug";
var conDriverInstallationLevel = "DriverInstallation";

var conRemovedUpdate = 0;
var conAddedUpdate = 1;
var conBasketPage = 2;

var conBadPid= "1" ;
var conCatalogDenied = "-1" ;

var conCategoryOS = "OS";
var conCategoryOSComponent = "OS_COMPONENT";
var conCategorySoftware = "SOFTWARE";
var conCategoryHardware = "HARDWARE";
var conCategoryOEM = "OEM";
var conCategoryISV = "ISV";
var conCategoryIHV = "IHV";

var conDetailsURL = "http://download.windowsupdate.com/msdownload/update/v3/static/rtf/";
var conClientInfoXML = "<clientInfo xmlns=\"x-schema:http://schemas.windowsupdate.com/iu/clientInfo.xml\" clientName=\"IU_Site\" />";
var conClientInfoXML_Corp = "<clientInfo xmlns=\"x-schema:http://schemas.windowsupdate.com/iu/clientInfo.xml\" clientName=\"IU_Corp_Site\" />";

var conByte = 8;
var conKB = 1024;
var conMB = 1048576;

function fnClearSite(){
	var iLen, i;

	g_iConsumerBasketCount = 0;
	g_iConsumerBasketSize = 0;
	eTOC.eCriticalUpdates.children[1].innerText = "";
	eTOC.eCriticalUpdates.style.fontWeight = "";
	eTOC.eWindowsUpdates.children[1].innerText = "";
	eTOC.eWindowsUpdates.style.fontWeight = "";
	eTOC.eDriverUpdates.children[1].innerText = "";
	eTOC.eDriverUpdates.style.fontWeight = "";
	eTOC.eBasketUpdates.children[1].innerText = "";
	eTOC.eBasketUpdates.style.fontWeight = "";
	iLen = eTOC.eAvailableUpdatesDiv.children.length - 2;
	for(i = 4; i < iLen; i++) eTOC.eAvailableUpdatesDiv.removeChild(eTOC.eAvailableUpdatesDiv.children[4]);
}

function fnInitDetect(){
	var conDetectAtTime = 1;
	var sOSID, vOSComponentIDs, vOEMIDs, vOthers, aOthers, iOEMIDsLen, iOSComponentIDsLen, iOthersLen, iProductIDsLen, aProductIDs, i, j;

	g_sRegionalSettings = fnGetRegionalSettings().join("|@|");
	g_iConnectionSpeed = control_GetHistory("", "", "GetHistoricalSpeed", "");
	if(g_iConnectionSpeed == false) g_iConnectionSpeed = 0;
	g_iConnectionSpeed = parseInt(g_iConnectionSpeed);

	if (!fnGetManifest(conProviderLevel)){
		fnEndTOCDetectUpdates(0, 0);
		return false ;	
	}
	fnGetManifest(conProductLevel);

	if(g_oCatalogXML.selectSingleNode("provider/product[category = '" + conCategoryOS + "']") == null || g_oCatalogXML.selectSingleNode("provider/product/group") == null){
		window.setTimeout("fnEndDetectUpdates(false);", 0);
		return false;
	}

	if(eTOC.g_oUserData != null){
		fnSetProductPersonalization(); // we set attribute "personalized" =1 on product if it is already personalized
		fnSetGroupPersonalization(); // we set attribute "personalized" =1 on group if it is already personalized
	}

	// get product IDs \\
	sOSID = g_oCatalogXML.selectSingleNode("provider/product[category = '" + conCategoryOS + "']/identity/@itemID").text;
	vOSComponentIDs = g_oCatalogXML.selectNodes("provider/product[group and category = '" + conCategoryOSComponent + "']/identity/@itemID");
	vOEMIDs = g_oCatalogXML.selectNodes("provider/product[group and category = '" + conCategoryOEM + "']/identity/@itemID");
	vOthers = g_oCatalogXML.selectNodes("provider/product[group and category = '" + conCategorySoftware + "' || category = '" + conCategoryHardware + "' || category = '" + conCategoryISV + "' || category = '" + conCategoryIHV + "']");
	iOSComponentIDsLen = vOSComponentIDs.length;
	iOEMIDsLen = vOEMIDs.length;
	iOthersLen = vOthers.length;
	iProductIDsLen = 1 + iOSComponentIDsLen + iOEMIDsLen + iOthersLen;
	aProductIDs = new Array(iProductIDsLen);

	j = 0;

	// put them in the right order (OS Components, OS, OEM, Others A-Z) \\
	for(i = 0; i < iOSComponentIDsLen; i++) aProductIDs[j++] = vOSComponentIDs[i].text;
	aProductIDs[j++] = sOSID;

	for(i = 0; i < iOEMIDsLen; i++) aProductIDs[j++] = vOEMIDs[i].text;
	aOthers = new Array(iOthersLen);
	for(i = 0; i < iOthersLen; i++) aOthers[i] = [vOthers[i].selectSingleNode("title").text, vOthers[i].selectSingleNode("identity/@itemID").text];

	aOthers.sort();
	for(i = 0; i < iOthersLen; i++) aProductIDs[j++] = aOthers[i][1];

	g_aProductIDs = aProductIDs;
	iProductIDsLen++; // (+ 1 for drivers)

	fnDetectUpdates(0, conDetectAtTime, iProductIDsLen);
}

function fnDetectUpdates(iProductCnt, iProductInc, iProductMax){
	var oQueryXML, oOSProduct, aProductIDs, sProductID, oProduct, iUpdatesLen, sProductCategory, vGroups, oGroup, sGroupTitle, oNewGroupNode, oGroupItems;
	var iGroupItemsLen, oProviderNode, sProductLabel, iPercentComplete, bOver, bGoingToBeOver, i, j, k;

	k = 0;

	aProductIDs = new Array(iProductInc);
	for(i = 0; i < iProductInc; i++) aProductIDs[i] = g_aProductIDs[i + iProductCnt];

	fnGetManifest(conItemLevel, aProductIDs); // this function is called for each product to get items
	if (g_bBannedVLK){
		fnDisplayErrorPage(conErrorBannedVLK, true);
		eTOC.eAvailableUpdates.children[1].innerText = L_ScanForAvailableUpdates_Text ;
		eTOC.eAvailableUpdates.children[0].src = "/shared/images/toc_endnode.gif";
		eTOC.eAvailableUpdatesDiv.style.display = "none";
		return false ;
	}
	else{
		if(g_bCatalogDenied){
			fnDisplayErrorPage(conErrorOther, true);
			eTOC.eAvailableUpdates.children[1].innerText = L_ScanForAvailableUpdates_Text ;
			eTOC.eAvailableUpdates.children[0].src = "/shared/images/toc_endnode.gif";
			eTOC.eAvailableUpdatesDiv.style.display = "none";
			return false ;
		}
	}
	if(eTOC.g_oUserData != null) fnSetItemPersonalization();// we set attribute "personalized" =1 on item if it is already personalized

	oOSProduct = g_oCatalogXML.selectSingleNode("provider/product[category = '" + conCategoryOS + "']");

	for(i = 0; i < iProductInc; i++){
		sProductID = aProductIDs[i];
		oProduct = g_oCatalogXML.selectSingleNode("provider/product[identity/@itemID = '" + sProductID + "']");
		if(oProduct == null) continue;

		sProductCategory = oProduct.selectSingleNode("category").text;
		if(sProductCategory == conCategoryOSComponent){
			vGroups = oProduct.selectNodes("group");

			for(j = 0; j < vGroups.length; j++){
				oGroup = vGroups[j];
				sGroupTitle = oGroup.selectSingleNode("title").text;
				sGroupTitle = sGroupTitle.replace(/'/g, "\\'");
				oNewGroupNode = oOSProduct.selectSingleNode("group[title = '" + sGroupTitle + "']");

				if(oNewGroupNode == null){ // copy group + items from OS component node to OS
					xmlCopyNode(oGroup, oOSProduct);
				}else{ // copy group's items
					oGroupItems = oGroup.selectNodes("item");
					iGroupItemsLen = oGroupItems.length;
					for(k = 0; k < iGroupItemsLen; k++) xmlCopyNode(oGroupItems[k], oNewGroupNode);
				}
			}

			oProviderNode = oProduct.parentNode;

			if(oProviderNode.selectNodes("product").length == 1){
				oProviderNode.parentNode.removeChild(oProviderNode);
			}else{
				oProviderNode.removeChild(oProduct); // remove the OS component product from catalog xml
			}
		}else if(oProduct.getAttribute("personalized") != "1"){ // if the OS product is not personalized , display it in toc
			sProductID = oProduct.selectSingleNode("identity/@itemID").text;
			sProductLabel = oProduct.selectSingleNode("title").text;
			iUpdatesLen = oProduct.selectNodes("group[not(@personalized)]/item[not(@hidden)][not(@personalized)][priority > '3']").length;
			fnAddTOCLink(sProductID, sProductLabel, sProductCategory, iUpdatesLen);
		}

		iPercentComplete = parseInt((iProductCnt + 1)/iProductMax*100);

		eTOC.eAvailableUpdates.children[1].innerText = L_ScanForAvailableUpdates_Text + " ... " + iPercentComplete + "% "// + L_Complete_Text;
		if("object" == typeof(eContent.ePercentComplete)) eContent.ePercentComplete.innerText = iPercentComplete + "% " + L_Complete_Text;
	}

	iProductCnt += iProductInc;
	bOver = (iProductCnt + 1 >= iProductMax);

	if(bOver){
		window.setTimeout("fnEndDetectUpdates(true);", 0);
	}else{
		bGoingToBeOver = iProductCnt + iProductInc > iProductMax;
		if(bGoingToBeOver) iProductInc = iProductMax - iProductCnt;
		window.setTimeout("fnDetectUpdates(" + iProductCnt + ", " + iProductInc + ", " + iProductMax + ");", 0);
	}
}

function fnEndDetectUpdates(successfulDetect){
	var iPercentComplete, iCriticalUpdatesLen, iDriverUpdatesLen;

	if(!conCriticalUpdatesMode) fnDetectDriverUpdates();

	xmlRemoveNodes(g_oCatalogXML, ["provider/product/group/item/exclusive[. = '0']", "provider/product/group[not(item)]", "provider[identity/@itemID != 'devices']/product/group/title"]);

	g_bDetectedItems = true;

	iPercentComplete = 100;
	eTOC.eAvailableUpdates.children[1].innerText = L_ScanForAvailableUpdates_Text + " ... " + iPercentComplete + "%"
	if("object" == typeof(eContent.ePercentComplete)) eContent.ePercentComplete.innerText = iPercentComplete + "% " + L_Complete_Text;

	if(g_oCatalogXML.selectSingleNode("provider/product/group/item") == null){
		fnEndTOCDetectUpdates(0, 0);
	}else{
		iCriticalUpdatesLen = g_oCatalogXML.selectNodes("provider/product/group/item[priority <= '3']").length;
		iDriverUpdatesLen = g_oCatalogXML.selectNodes("provider[identity/@itemID = 'devices']/product/group/item[priority > '3'][not(@hidden)]").length;
		fnEndTOCDetectUpdates(iCriticalUpdatesLen, iDriverUpdatesLen);

		if(iCriticalUpdatesLen > 0) fnAddCriticalUpdatesToBasket();
	}

	if(g_bPersonalizing){ // if the scan was started from personalization page , display the personalization page
		if(successfulDetect) fnDisplayPersonalization();
		g_bPersonalizing = false;
	}else if(conCriticalUpdatesMode){
		if(successfulDetect) fnDisplayBasketUpdates();
	}else{
		if(successfulDetect) fnDisplayAvailableUpdates();
	}

	g_bScanning = false;
}

function fnAddCriticalUpdatesToBasket(){ //if there are critical updates , set the basket attribute to 1
	var oCriticalUpdate, vCriticalUpdates, iCriticalUpdatesLen, oCriticalUpdate, iSize, i;

	vCriticalUpdates = g_oCatalogXML.selectNodes("provider/product/group/item[priority <= '3']");
	iCriticalUpdatesLen = vCriticalUpdates.length;

	for(i = 0; i < iCriticalUpdatesLen; i++){
		oCriticalUpdate = vCriticalUpdates[i];
		iSize = parseInt(oCriticalUpdate.selectSingleNode("size").text);
		oCriticalUpdate.setAttribute("basket", "1");
 		g_iConsumerBasketCount++;
		g_iConsumerBasketSize += iSize; // calculate the total size of critical updates
	}

	fnUpdateTOCBasket();
}

function fnDetectDriverUpdates(){
	var sQueryXML, oXML, oSystemSpec, oOSLocaleNode, oUserLocaleNode, sSystemSpecXML, sClientInfoXML, vDrivers, iDriversLen, oDriver, oRoot, i;
	var sDriverID, vDuplicateDrivers, iDuplicateDriversLen, oDuplicateDriver, oIdentity, oDependencies;

	sSystemSpecXML = control_GetSystemSpec("<classes><computerSystem /><devices /><platform /><locale /></classes>");
	if(!sSystemSpecXML) return false;
	oXML = xmlNewXML();
	oXML.loadXML(sSystemSpecXML);
	oXML.selectSingleNode("systemInfo/locale[@context = 'USER']/language").text = conLangCode;

	sSystemSpecXML = oXML.documentElement.xml;
	if(g_bSaveXML && g_bSall){
		sQueryXML = fnGetQueryXML(conDriverDebugLevel, null, true);
	}else{
		sQueryXML = fnGetQueryXML(conDriverLevel, null, true);
	}

	if(g_bSaveXML) top.fnSaveXML(sSystemSpecXML, "Drivers (1-Query)");

	sXML = control_GetManifest(conClientInfoXML, sSystemSpecXML, sQueryXML);

	if(g_bSaveXML) top.fnSaveXML(sXML, "Drivers (2-Response)");

	if(!sXML) return false;

	oXML.loadXML(sXML);
	oRoot = oXML.selectSingleNode("catalog/provider");
	vDrivers = oRoot.selectNodes("product/group/item");
	iDriversLen = vDrivers.length;
	if(iDriversLen == 0) return false;

	for(i = 0; i < iDriversLen; i++){
		oDriver = vDrivers[i];
		oDriver.setAttribute("driver", "1");

		sDriverID = oDriver.selectSingleNode("identity/@itemID").text;
		vDuplicateDrivers = oRoot.selectNodes("product/group/item[not(@driver)][identity/@itemID = '" + sDriverID + "']");
		iDuplicateDriversLen = vDuplicateDrivers.length;
		if(iDuplicateDriversLen > 0){ //if duplicate drivers are found , then add them as dependencies
			oDependencies = oDriver.selectSingleNode("dependencies");

			if(oDependencies == null){
				oDependencies = CatalogXML.createElement("dependencies");
				oDriver.appendChild(oDependencies);
			}

			for(j = 0; j < iDuplicateDriversLen; j++){
				oDuplicateDriver = vDuplicateDrivers[j];
				oDuplicateDriver.setAttribute("driver", "1");
				oDuplicateDriver.setAttribute("hidden", "1");
				oDuplicateDriver.selectSingleNode("identity").setAttribute("itemID", sDriverID + "--" + j);
				oDuplicateDriver.selectSingleNode("title").text += " (" + (j + 2) + "/" + (iDuplicateDriversLen + 1) + ")";
				oIdentity = CatalogXML.createElement("identity");
				oDependencies.appendChild(oIdentity);
				oIdentity.setAttribute("itemID", sDriverID + "--" + j);
				oIdentity.setAttribute("name", "");
			}
		}
	}

	xmlRemoveNodes(oRoot, ["identity/publisherName", "product/identity/publisherName", "product/group/item/hwid", "product/group/item/installation"]);
	xmlCopyNode(oRoot, g_oCatalogXML);

	if(g_bSaveXML) top.fnSaveXML(CatalogXML.xml, "Drivers (3-Catalog)");
}

function fnGetManifest(iLevel, aProductIDs, bOnlyGetManifest){
	if(bOnlyGetManifest == null) bOnlyGetManifest = false;

	var oXML,oSystemInfo, oRoot,oResponseXML, sResponseXML, sQueryXML, oDetectXML, sDebugDetails;
	var sCatalogStatus;

	bDriver = false;
	sDebugDetails = "";

	if(iLevel == conItemLevel){
		sDebugDetails = "(" + aProductIDs + ") ";
	}else if(iLevel == conDriverInstallationLevel){
		bDriver = true;
	}

	sQueryXML = fnGetQueryXML(iLevel, aProductIDs, bDriver);
	if(g_bSaveXML) top.fnSaveXML(sQueryXML, iLevel + " " + sDebugDetails + "(1-Query)");
	sResponseXML = control_GetManifest(conClientInfoXML, g_oCatalogXML.selectSingleNode("systemInfo").xml, sQueryXML);
	if(g_bSaveXML) top.fnSaveXML(sResponseXML, iLevel + " " + sDebugDetails + "(2-Response)");
	if(!sResponseXML) return false;
	oResponseXML = xmlNewXML(null, null, true);
	oResponseXML.loadXML(sResponseXML);
	sCatalogStatus = oResponseXML.selectSingleNode("catalog").getAttribute("catalogStatus")
	if (sCatalogStatus == conBadPid){ // the client pid is banned
		g_bBannedVLK = true ;
		return false;
	}
	else{
		if (sCatalogStatus == conCatalogDenied){
			g_bCatalogDenied = true ;
			return false;
		}

	}
	if(oResponseXML.selectNodes("catalog/provider/item").length == 0) return false;
	if(bOnlyGetManifest) return oResponseXML;

	if(iLevel == conItemLevel && g_bSaveXML && g_bSall) xmlRemoveNodes(oResponseXML, ["catalog/provider/item/detection/installed/expression"]);

	oDetectXML = xmlNewXML(null, null, true);
	oDetectXML.loadXML(oResponseXML.xml);
	xmlRemoveNodes(oDetectXML, ["catalog/provider/item/group", "catalog/provider/item/owners", "catalog/provider/item/category"]);
	oDetectXML.loadXML(control_Detect(oDetectXML.xml));
	if(g_bSaveXML) top.fnSaveXML(oDetectXML.xml, iLevel + " " + sDebugDetails + "(3-Detected)");
	if(!oDetectXML) return false;

	fnUpdateCatalogXML(oResponseXML, oDetectXML, iLevel); // updates the catalog xml with the detected providers/products/items
	if(g_bSaveXML) top.fnSaveXML(CatalogXML.xml, iLevel + " " + sDebugDetails + "(4-Catalog)");
	return true;
}

function fnUpdateCatalogXML(oResponseXML, oDetectXML, iLevel){
	var vNodes, iNodesLen, sNodeID, bExcluded, bForce, bInstalled, bUpToDate, bShow, bDebugForce, oStatusNode, oExcludedNode, oNode, sNodeID, oCatalogParentNode, oCatalogProductNode, oCatalogNode, oIdentityNode, aChildrenToRemove, sParentID, iChildrenToRemoveLen, vChildNodes, iChildNodesLen, j;

	if(iLevel == conItemLevel || iLevel == conDependencyLevel){
		if(g_bSaveXML && (g_bSinst || g_bSall)) bDebugForce = true;
	}else{
		bDebugForce = false;
	}

	vNodes = oResponseXML.selectNodes("catalog/provider/item");
	iNodesLen = vNodes.length;
	for(i = 0; i < iNodesLen; i++){ //here we compare response xml and detect xml to update the catalog xml
		oNode = vNodes[i];
		sNodeID = oNode.selectSingleNode("identity/@itemID").text;

		oStatusNode = oDetectXML.selectSingleNode("items/itemStatus[identity/@itemID = '" + sNodeID + "']/detectResult");
		if(oStatusNode == null) continue; // if it is not detected then move to next provider/product/item

		bExcluded = (oStatusNode.getAttribute("excluded") == "1");
		bForce = (oStatusNode.getAttribute("force") == "1");
		bInstalled = (oStatusNode.getAttribute("installed") == "1" || oStatusNode.getAttribute("installed") == null);
		bUpToDate = (oStatusNode.getAttribute("upToDate") == "1" || oStatusNode.getAttribute("upToDate") == null);

		if(iLevel == conItemLevel || iLevel == conDependencyLevel){
			if(bExcluded){
				bShow = false;
			}else if(bForce){
				bShow = true;
			}else if(bInstalled && !bUpToDate){
				bShow = true;
			}else if(!bInstalled){
				bShow = true;
			}else{
				bShow = false;
			}
		}else{
			if(bExcluded){
				bShow = false;
			}else if(bForce){
				bShow = true;
			}else if(bInstalled){
				bShow = true;
			}else{
				bShow = false;
			}
		}

		if(!bShow && !bDebugForce) continue;

		if(iLevel == conProviderLevel){
			oCatalogParentNode = g_oCatalogXML;
			oCatalogNode = CatalogXML.createElement("provider");
			aChildrenToRemove = ["detection"];
		}else if(iLevel == conProductLevel){
			sParentID = oNode.selectSingleNode("owners/identity/@itemID").text;
			oCatalogParentNode = g_oCatalogXML.selectSingleNode("provider[identity/@itemID = '" + sParentID + "']");
			oCatalogNode = CatalogXML.createElement("product");
			aChildrenToRemove = ["detection", "owners"];
		}else if(iLevel == conItemLevel){
			sParentID = oNode.selectSingleNode("owners/identity/@itemID").text;
			oCatalogParentNode = g_oCatalogXML.selectSingleNode("provider/product/group[identity/@itemID = '" + sParentID + "']");
			oCatalogNode = CatalogXML.createElement("item");
			aChildrenToRemove = ["detection", "owners", "product"];
		}else if(iLevel == conDependencyLevel){
			oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sNodeID + "']");
			if(oCatalogNode != null){
				oCatalogNode.setAttribute("detected", "1");
				continue;
			}else{
				sParentID = oNode.selectSingleNode("owners/identity/@itemID").text;
				oCatalogParentNode = g_oCatalogXML.selectSingleNode("provider/product/group[identity/@itemID = '" + sParentID + "']");

				if(oCatalogParentNode == null){
					sProductID = oNode.selectSingleNode("product/identity/@itemID").text;
					oCatalogProductNode = g_oCatalogXML.selectSingleNode("provider/product[identity/@itemID = '" + sProductID + "']");

					if(oCatalogProductNode == null) oCatalogProductNode = g_oCatalogXML.selectSingleNode("provider/product[category = '" + conCategoryOS + "']");

					oCatalogParentNode = CatalogXML.createElement("group");
					oIdentityNode = CatalogXML.createElement("identity");
					oIdentityNode.setAttribute("itemID", sParentID);
					oIdentityNode.setAttribute("name", sParentID);

					oCatalogParentNode.appendChild(oIdentityNode);
					oCatalogProductNode.appendChild(oCatalogParentNode);
				}

				oCatalogNode = CatalogXML.createElement("item");
				oCatalogNode.setAttribute("detected", "1");
				oCatalogNode.setAttribute("hidden", "1");
				aChildrenToRemove = ["detection", "owners", "product"];
			}
		}

		iChildrenToRemoveLen = aChildrenToRemove.length;
		for(j = 0; j < iChildrenToRemoveLen; j++) oNode.removeChild(oNode.selectSingleNode(aChildrenToRemove[j]));

		vChildNodes = oNode.childNodes;
		iChildNodesLen = vChildNodes.length;
		for(j = 0; j < iChildNodesLen; j++) xmlCopyNode(vChildNodes[j], oCatalogNode);

		//if(iLevel == conItemLevel) alert(bDebugForce + "\n" + !bInstalled)
		if(iLevel == conItemLevel && bDebugForce && !bInstalled) oCatalogNode.setAttribute("detected", "1");

		oCatalogParentNode.appendChild(oCatalogNode);
	}
}

function fnGetQueryXML(vLevel, aParentIDs, bDrivers){
	if(bDrivers == null) bDrivers = false;

	var bIncludeParentIDs, sParentItemsXML;

	bIncludeParentIDs = true;

	if(vLevel == conProviderLevel || vLevel == conDriverLevel || vLevel == conDriverDebugLevel){
		bIncludeParentIDs = false;
	}else if(vLevel == conProductLevel){
		if(aParentIDs == null) aParentIDs = fnArrayFromNodesText(g_oCatalogXML.selectNodes("provider/identity/@itemID"));
	}else if(vLevel == conItemLevel){
		if(aParentIDs == null) aParentIDs = fnArrayFromNodesText(g_oCatalogXML.selectNodes("provider/product/identity/@itemID"));
	}

	sParentItemsXML = bIncludeParentIDs ? "<parentItems><item>" + aParentIDs.join("</item><item>") + "</item></parentItems>" : "";

	return "<query href=\"https://" + window.location.host + (bDrivers ? "/consumerdrivers" : "") + "/getmanifest.asp\"><dObjQueryV1 procedure=\"" + vLevel + "\">" + sParentItemsXML + "</dObjQueryV1></query>";
//	return "<query href=\"https://a248.e.akamai.net/v4.windowsupdate.microsoft.com" + (bDrivers ? "/consumerdrivers" : "") + "/getmanifest.asp\"><dObjQueryV1 procedure=\"" + vLevel + "\">" + sParentItemsXML + "</dObjQueryV1></query>";
}

function fnGetUpdateTitles(aUpdateIDs){
	var oResponseXML, vUpdatesDetails, iUpdatesDetailsLen, sUpdateID, sTitle, oTitleNode, i;

	oResponseXML = fnGetManifest(conItemDetailsLevel, aUpdateIDs, true);
	if(!oResponseXML) return false;

	vUpdatesDetails = oResponseXML.selectNodes("catalog/provider/item");
	iUpdatesDetailsLen = vUpdatesDetails.length;
	for(i = 0; i < iUpdatesDetailsLen; i++){
		sUpdateID = vUpdatesDetails[i].selectSingleNode("identity/@itemID").text;
		sTitle = vUpdatesDetails[i].selectSingleNode("title").text;

		oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
		iSize = fnFormatSize(parseInt(oCatalogNode.selectSingleNode("size").text));
		oTitleNode = CatalogXML.createElement("title");
		oTitleNode.text = sTitle;
		oCatalogNode.appendChild(oTitleNode);
	}
}

function fnFindAllDependencies(sUpdateID, sPattern, bReturnFound){
	var vDependencyIDs, iDependencyIDsLen, sDependencyID, oDependencyNode, i;

	vDependencyIDs = g_oCatalogXML.selectNodes("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']/dependencies/identity/@itemID");
	iDependencyIDsLen = vDependencyIDs.length;

	for(i = 0; i < iDependencyIDsLen; i++){
		sDependencyID = vDependencyIDs[i].text;
		oDependencyNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sDependencyID + "']" + sPattern);

		if(bReturnFound && oDependencyNode != null){
			g_aDependencies[g_aDependencies.length] = sDependencyID;
			fnFindAllDependencies(sDependencyID, sPattern, bReturnFound);
		}else if(!bReturnFound && oDependencyNode == null){
			g_aDependencies[g_aDependencies.length] = sDependencyID;
		}
	}
}

function fnSetProductPersonalization(){
	var sProductIDs, aProductIDs, iProductIDsLen, oProductNode, i;

	sProductIDs = eTOC.g_oUserData.getAttribute("aPersonalizedProducts");
	if(sProductIDs != null && sProductIDs != ""){
		aProductIDs = sProductIDs.split(",");
		iProductIDsLen = aProductIDs.length;
		for(i = 0; i < iProductIDsLen; i++){
			oProductNode = g_oCatalogXML.selectSingleNode("provider/product[identity/@itemID = '" + aProductIDs[i] + "']");
			if(oProductNode != null) oProductNode.setAttribute("personalized", "1");
		}
	}
}

function fnSetGroupPersonalization(){  // this function is called during scan to mark the group nodes present in catalog xml which are also present in userdata.
	var sGroupIDs, aGroupIDs, iGroupIDsLen, oGroupNode, i;

	sGroupIDs = eTOC.g_oUserData.getAttribute("aPersonalizedGroups");
	if(sGroupIDs != null && sGroupIDs != ""){
		aGroupIDs = sGroupIDs.split(",");
		iGroupIDsLen = aGroupIDs.length;
		for(i = 0; i < iGroupIDsLen; i++){
			oGroupNode = g_oCatalogXML.selectSingleNode("provider/product/group[identity/@itemID = '" + aGroupIDs[i] + "']");
			if(oGroupNode != null) oGroupNode.setAttribute("personalized", "1");
		}
	}
}

function fnSetItemPersonalization(){ // this function is called during scan to mark the item nodes present in catalog xml which are also present in userdata.
	var sItemIDs, aItemIDs, iItemIDsLen, oItemNode, i,j,aItemidFields,sPartialItemid,vItems,iItemLen;
	var sItemid,sItemName
	sItemIDs = eTOC.g_oUserData.getAttribute("aPersonalizedItems");
	if(sItemIDs != null && sItemIDs != ""){
		aItemIDs = sItemIDs.split(",");
		iItemIDsLen = aItemIDs.length;
		vItems=g_oCatalogXML.selectNodes("provider/product/group/item[identity]");
		iItemLen=vItems.length;

		for(i = 0; i < iItemIDsLen; i++){ //iterate through all the itemids in userdata.
			aItemidFields = aItemIDs[i].split(".");
			sPartialItemid=aItemidFields[12] + "." + aItemidFields[13];  // pubname.name, we use this to mark nodes in catalogxml due to WUPM change of data

			for(j=0;j<iItemLen;j++){
				sItemid=vItems[j].selectSingleNode("identity/@itemID").text ;
				sItemName=vItems[j].selectSingleNode("identity/@name").text.toLowerCase() ;
				if (sItemid.indexOf(sPartialItemid)!= -1 && sItemName == aItemidFields[13].toLowerCase()){ //item found in catalogxml to set the personalized attribute
					vItems[j].setAttribute("personalized", "1");
					break;
				}
			}

		}
	}
}

function fnPopulateTOC(){
	var vProducts, iProductsLen, oProduct, sProductCategory, sProductLabel, sProductID, vUpdates, iUpdatesLen, iCriticalUpdatesLen, iDriverUpdatesLen, i;

	// products \\
	vProducts = g_oCatalogXML.selectNodes("provider[identity/@itemID != 'devices']/product[not(@personalized)]");
	iProductsLen = vProducts.length;

	for(i = 0; i < iProductsLen; i++){
		oProduct = vProducts[i];
		sProductCategory = oProduct.selectSingleNode("category").text;
		sProductLabel = oProduct.selectSingleNode("title").text;
		sProductID = oProduct.selectSingleNode("identity/@itemID").text;
		iUpdatesLen = oProduct.selectNodes("group[not(@personalized)]/item[not(@hidden)][not(@personalized)][priority > '3']").length;

		fnAddTOCLink(sProductID, sProductLabel, sProductCategory, iUpdatesLen);
	}

	// basket \\
	g_iConsumerBasketCount = 0;
	g_iConsumerBasketSize = 0;

	vUpdates = g_oCatalogXML.selectNodes("provider/product/group/item[@basket]");
	iUpdatesLen = vUpdates.length;

	for(i = 0; i < iUpdatesLen; i++){
		g_iConsumerBasketCount++;
		g_iConsumerBasketSize += parseInt(vUpdates[i].selectSingleNode("size").text);
	}

	iCriticalUpdatesLen = g_oCatalogXML.selectNodes("provider/product/group/item[priority <= '3']").length;
	iDriverUpdatesLen = g_oCatalogXML.selectNodes("provider[identity/@itemID = 'devices']/product/group/item").length;
	if(iCriticalUpdatesLen == 0) eTOC.eCriticalUpdates.style.fontWeight = "normal";
	if(iDriverUpdatesLen == 0) eTOC.eDriverUpdates.style.fontWeight = "normal";
	eTOC.eAvailableUpdatesDiv.style.display = "block";
	eTOC.eAvailableUpdates.children[0].src = "/shared/images/toc_expanded.gif";
	fnEndTOCDetectUpdates(iCriticalUpdatesLen, iDriverUpdatesLen);
	eTOC.g_oSelectedLink == null;

	fnUpdateTOCNumbers();
}

/* detection */
/* dialogs */

function fnDisplayEULA(sURL){
	if(g_oPopup) g_oPopup.close();
	g_bEULAAccepted = false;
	g_oPopup = window.showModalDialog(conConsumerURL + "dialog_eula.asp?url=" + sURL + "&corporate=" + g_bCorporate + "&" + conQueryString, [window], "dialogWidth:380px;dialogHeight:400px;help:no;scroll:yes;status:no;");
	return g_bEULAAccepted;
}

function fnDisplayDownload(iTotalDownloadsLen, aUpdateTitles, bCorporate){
	if(bCorporate == null) bCorporate = false;

	g_bCorporate = bCorporate;
	g_oDownloadPopup = window.showModelessDialog(conConsumerURL + "dialog_download.asp?corporate=" + g_bCorporate + "&" + conQueryString, [window, iTotalDownloadsLen, aUpdateTitles], "dialogWidth:330px;dialogHeight:" + (g_bCorporate ? "205" : "240") + "px;help:no;scroll:no;status:no;");
}

/* dialogs */
/* content */

function fnDisplayAvailableUpdates(){
	var bCriticalUpdatesAvailable, bOtherUpdatesAvailable, iPage;

	if(g_bDetectedItems){
		bCriticalUpdatesAvailable = (g_oCatalogXML.selectNodes("provider/product/group/item[priority <= '3']").length > 0);
		bOtherUpdatesAvailable = (g_oCatalogXML.selectNodes("provider/product[not(@personalized)]/group[not(@personalized)]/item[not(@personalized)][priority > '3']").length > 0);

		if(bCriticalUpdatesAvailable && bOtherUpdatesAvailable){
			iPage = conSplashPickUpdatesCriticalAndOther;
		}else if(bCriticalUpdatesAvailable){
			iPage = conSplashPickUpdatesCritical;
		}else if(bOtherUpdatesAvailable){
			iPage = conSplashPickUpdatesOther;
		}else{
			iPage = conSplashPickUpdatesNone;
		}

		fnDisplaySplashPage(iPage);
	}else{
		fnScan();
	}
}

function fnDisplayPersonalization(){ // post a part of catalog xml to personalize.asp page which uses it to plot the html
	var sXML, vProducts, iProductsLen, oProduct, vGroups, iGroupsLen, oGroup, vItems, iItemsLen, oItem, i, j, k;

	if(g_bDetectedItems && g_oCatalogXML.selectNodes("provider").length == 0){
		fnPostData("", conConsumerURL + "personalize.asp?" + conQueryString);
		return false;
	}

	vProducts = g_oCatalogXML.selectNodes("provider[identity/@itemID != 'devices']/product");
	iProductsLen = vProducts.length;

	sXML = "<catalog>\n";
	for(i = 0; i < iProductsLen; i++){
		oProduct = vProducts[i];

		sXML += "<product id='" + oProduct.selectSingleNode("identity/@itemID").text + "'";
		if(oProduct.selectSingleNode("category[. = '" + conCategoryOS + "']") != null) sXML += " category='os'";
		if(oProduct.getAttribute("personalized") == "1") sXML += " personalized='1'";
		sXML += "><title>" + oProduct.selectSingleNode("title").text + "</title>";

		vGroups = oProduct.selectNodes("group[item/priority > '3']");
		iGroupsLen = vGroups.length;
		for(j = 0; j < iGroupsLen; j++){
			oGroup = vGroups[j];

			sXML += "<group id='" + oGroup.selectSingleNode("identity/@itemID").text + "'";
			if(oGroup.getAttribute("personalized") == "1") sXML += " personalized='1'";
			sXML += ">";

			vItems = oGroup.selectNodes("item[priority > '3'][not(@hidden)]");
			iItemsLen = vItems.length;
			for(k = 0; k < iItemsLen; k++){
				oItem = vItems[k];

				sXML += "<item id='" + oItem.selectSingleNode("identity/@itemID").text + "'";
				if(oItem.getAttribute("personalized") == "1") sXML += " personalized='1'";
				sXML += " />";
			}

			sXML += "</group>"
		}

		sXML += "</product>";
	}
	sXML += "</catalog>";

	fnPostData(sXML, conConsumerURL + "personalize.asp?" + conQueryString);
}

/* content */
/* results */

function fnDisplayCriticalUpdates(){
	var vUpdates, iUpdatesLen, sXML, i;

	if(!g_bDetectedItems) fnInitDetect();

	aAttributes = ["basket", "downloaded", "detected", "driver"];
	aElements = ["identity", "title", "size", "details", "exclusive"];
	vUpdates = g_oCatalogXML.selectNodes("provider/product/group/item[priority <= '3'][not(@hidden)]");

	sXML = "<catalog>\n";
	sXML += fnGetItemXML(vUpdates, aAttributes, aElements, true, false);
	sXML += "</catalog>";

	fnPostData(sXML, conConsumerURL + "results.asp?id=critical&localesettings=" + g_sRegionalSettings + "&speed=" + g_iConnectionSpeed + "&" + conQueryString);
}

function fnDisplayProductUpdates(sProductID){
	var vGroups, iGroupsLen, oGroup, vUpdates, sDependenciesAttribute, iUpdatesLen, sXML, i, j;

	if(eContent.g_iPage == conPersonalizationPage){
		if(!eContent.g_bSavedSettings && window.confirm(L_PersonalizationSaveSettingsPrompt_Text)) eContent.fnSaveSettings();
		eContent.g_bSavedSettings = true;
	}

	aAttributes = ["basket", "downloaded", "detected"];
	aElements = ["identity", "exclusive"];

	sXML = "<catalog>\n";
	sXML += "	<product>\n";
	sXML += "		<identity itemID='" + sProductID + "' />\n";

	vGroups = g_oCatalogXML.selectNodes("provider/product[identity/@itemID = '" + sProductID + "']/group[not(@personalized)][item[priority > '3'][not(@hidden)][not(@personalized)]]");
	iGroupsLen = vGroups.length;
	for(i = 0; i < iGroupsLen; i++){
		oGroup = vGroups[i];
		vUpdates = oGroup.selectNodes("item[priority > '3'][not(@hidden)][not(@personalized)]");
		sXML += "		<group>\n";
		sXML += oGroup.selectSingleNode("identity").xml;
		sXML += fnGetItemXML(vUpdates, aAttributes, aElements, true, false);
		sXML += "		</group>\n";
	}

	sXML += "	</product>\n";
	sXML += "</catalog>";

	fnPostData(sXML, conConsumerURL + "results.asp?id=" + sProductID + "&localesettings=" + g_sRegionalSettings + "&speed=" + g_iConnectionSpeed + "&" + conQueryString);
}

function fnDisplayDriverUpdates(){
	var vGroups, iGroupsLen, oGroup, vUpdates, sDependenciesAttribute, iUpdatesLen, sXML, i, j;

	if(!g_bDetectedItems) fnInitDetect();

	aAttributes = ["basket", "downloaded", "detected", "driver"];
	aElements = ["identity", "title", "size", "details", "exclusive"];

	vGroups = g_oCatalogXML.selectNodes("provider[identity/@itemID = 'devices']/product/group[item[priority > '3'][not(@hidden)]]");
	iGroupsLen = vGroups.length;
	sXML = "<catalog>\n";

	for(i = 0; i < iGroupsLen; i++){
		oGroup = vGroups[i];
		vUpdates = oGroup.selectNodes("item[priority > '3'][not(@hidden)]");

		sXML += "<group>\n";
		sXML += oGroup.selectSingleNode("identity").xml;
		sXML += oGroup.selectSingleNode("title").xml;
		sXML += fnGetItemXML(vUpdates, aAttributes, aElements, true, false);
		sXML += "</group>\n";
	}

	sXML += "</catalog>";

	fnPostData(sXML, conConsumerURL + "results.asp?id=drivers&localesettings=" + g_sRegionalSettings + "&speed=" + g_iConnectionSpeed + "&" + conQueryString);
}

function fnDisplayStatus(){
	var sXML, vUpdates, iUpdatesLen, sUpdateID, oCatalogNode, oRoot, bInstalled, sErrorCode, i;

	oRoot = g_oInstallationXML.selectSingleNode("catalog/provider");

	// copy status from failed download items to install result \\
	vUpdates = g_oInstallationResultXML.selectNodes("catalog/provider/item");
	iUpdatesLen = vUpdates.length;
	for(i = 0; i < iUpdatesLen; i++) xmlCopyNode(vUpdates[i], oRoot);

	vUpdates = oRoot.selectNodes("item[description/descriptionText/eula/@href]");
	iUpdatesLen = vUpdates.length;

	sXML = "<catalog>\n";
	for(i = 0; i < iUpdatesLen; i++){
		sUpdateID = vUpdates[i].selectSingleNode("identity/@itemID").text;
		oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
		bInstalled = (oCatalogNode.getAttribute("installed") != null);
		sErrorCode = oCatalogNode.getAttribute("errorCode");

		sXML += "<item";
		if(bInstalled) sXML += " installed='1'";
		if(sErrorCode != null) sXML += " errorCode='" + sErrorCode + "'";
		sXML += "><title>" + vUpdates[i].selectSingleNode("description/descriptionText/title").text + "</title></item>";
		if(bInstalled) oCatalogNode.parentNode.removeChild(oCatalogNode);
	}
	sXML += "</catalog>";

	fnUpdateTOCNumbers();

	fnPostData(sXML, conConsumerURL + "status.asp?" + conQueryString);
}

function fnGetItemXML(vItems, aAttributes, aElements, bDependenciesAttribute, bProductIDAttribute){
	var sXML, iItemsLen, oItem, iAttributesLen, iElementsLen, oNode, bCritical, bDriver, sProductID, i;

	sXML = "";
	iItemsLen = vItems.length;
	iAttributesLen = aAttributes.length;
	iElementsLen = aElements.length;

	for(i = 0; i < iItemsLen; i++){
		oItem = vItems[i];

		sXML += "<item";
		for(j = 0; j < iAttributesLen; j++){
			oNode = oItem.getAttribute(aAttributes[j]);
			if(oNode != null) sXML += " " + aAttributes[j] + "='" + oNode + "'";
		}

		if(bDependenciesAttribute){
			oNode = oItem.selectSingleNode("dependencies");
			if(oNode != null) sXML += " dependencies='1'";
		}

		if(bProductIDAttribute){
			bCritical = (oItem.selectSingleNode("priority").text <= "3");
			bDriver = (oItem.selectSingleNode("@driver") != null);

			if(bCritical){
				sProductID = "eCriticalUpdates";
			}else if(bDriver){
				sProductID = "eDriverUpdates";
			}else{
				sProductID = oItem.parentNode.parentNode.selectSingleNode("identity/@itemID").text;
			}

			sXML += " productid='" + sProductID + "'";
		}

		sXML += ">";

		for(j = 0; j < iElementsLen; j++){
			oNode = oItem.selectSingleNode(aElements[j]);
			if(oNode != null) sXML += oNode.xml;
		}

		sXML += "</item>\n";
	}

	return sXML;
}

/* results */
/* download/install */

function fnContentDisabled(){
	if(g_bInstalling || g_bDownloading){
		if(g_oDownloadPopup != null) g_oDownloadPopup.focus();
		return true;
	}else{
		return false;
	}
}

function fnInstall(){
	var oResponseXML, vUpdateIDs, aUpdateIDs, iUpdateIDsLen, sUpdateID, oExclusiveUpdate, sExclusiveID, sExclusiveTitle, vDeviceIDs, iDeviceIDsLen, i, j;
	var oRoot, oUpdate, bFound, j, vNodes, oNode, iNodesLen, InstallationXML, oDescription, vEULAs, aEULAs, iEULAsLen, oUpdateDiv, iTotalDownloadsLen

	if(fnContentDisabled()) return false;

	g_bDownloading = true;
	vUpdateIDs = g_oCatalogXML.selectNodes("provider[identity/@itemID != 'devices']/product/group/item[@basket]/identity/@itemID");
	iUpdateIDsLen = vUpdateIDs.length;
	vDeviceIDs = g_oCatalogXML.selectNodes("provider[identity/@itemID = 'devices']/product/group/item[@basket]/identity/@itemID");
	iDeviceIDsLen = vDeviceIDs.length;

	if(iUpdateIDsLen > 0){
		oExclusiveUpdate = g_oCatalogXML.selectSingleNode("provider/product/group/item[@basket][exclusive]");

		if(oExclusiveUpdate != null){
			sExclusiveID = oExclusiveUpdate.selectSingleNode("identity/@itemID").text;
			aUpdateIDs = [sExclusiveID];
			g_aDependencies = [sExclusiveID];
			fnFindAllDependencies(sExclusiveID, "", true);
			g_aDependencies = fnRemoveDuplicates(g_aDependencies);
		}else{
			aUpdateIDs = fnArrayFromNodesText(vUpdateIDs);
			g_aDependencies = fnCopyArray(aUpdateIDs);

			for(i = 0; i < iUpdateIDsLen; i++) fnFindAllDependencies(aUpdateIDs[i], "[not(@basket)]", true);
		}

		g_aDependencies = fnRemoveDuplicates(g_aDependencies);

		oResponseXML = fnGetManifest(conInstallationLevel, g_aDependencies, true);

		if(!oResponseXML){
			g_bDownloading = false;
			return false;
		}

		if(oExclusiveUpdate != null && (iUpdateIDsLen > 1 || iDeviceIDsLen > 0)){
			sExclusiveTitle = oResponseXML.selectSingleNode("catalog/provider/item[identity/@itemID = '" + sExclusiveID + "']/description/descriptionText/title").text;

			if(!window.confirm(L_ExclusiveCriticalText_Text.replace(/\|EXCLUSIVE\|/g, sExclusiveTitle))){
				g_bDownloading = false;
				return false;
			}
		}

		InstallationXML = oResponseXML;
		oRoot = InstallationXML.selectSingleNode("catalog/provider");

		// any items the site adds to the basket are deps and shouldn't have eulas \\
		for(i = 0; i < g_aDependencies.length; i++){
			sUpdateID = g_aDependencies[i];

			bFound = false;

			for(j = 0; j < aUpdateIDs.length; j++){
				if(sUpdateID == aUpdateIDs[j]){
					bFound = true;
					break;
				}
			}

			if(!bFound){
				oRoot.selectSingleNode("item[identity/@itemID = '" + sUpdateID + "']/description").setAttribute("hidden", "1");
				oNode = oRoot.selectSingleNode("item[identity/@itemID = '" + sUpdateID + "']/description/descriptionText/eula");
				if(oNode != null) oNode.parentNode.removeChild(oNode);
			}
		}
	}else{
		InstallationXML = xmlNewXML();
		InstallationXML.loadXML("<catalog><provider /></catalog>");
		oRoot = InstallationXML.selectSingleNode("catalog/provider");
	}

	// drivers \\
	if(iDeviceIDsLen > 0){
		aUpdateIDs = fnArrayFromNodesText(vDeviceIDs);

		g_aDependencies = fnCopyArray(aUpdateIDs);
		for(i = 0; i < iDeviceIDsLen; i++) fnFindAllDependencies(aUpdateIDs[i], "[not(@basket)]", true);

		g_aDependencies = fnRemoveDuplicates(g_aDependencies);

		oResponseXML = fnGetManifest(conDriverInstallationLevel, g_aDependencies, true);
		if(!oResponseXML){
			g_bDownloading = false;
			return false;
		}

		vNodes = oResponseXML.selectNodes("catalog/provider/item");
		iNodesLen = vNodes.length;
		for(i = 0; i < iNodesLen; i++){
			oUpdate = vNodes[i];
			sUpdateID = oUpdate.selectSingleNode("identity/@itemID").text;

			bFound = false;

			for(j = 0; j < aUpdateIDs.length; j++){
				if(sUpdateID == aUpdateIDs[j]){
					bFound = true;
					break;
				}
			}

			if(!bFound){
				oUpdate.selectSingleNode("description").setAttribute("hidden", "1");
				oNode = oUpdate.selectSingleNode("description/descriptionText/eula");
				if(oNode != null) oNode.parentNode.removeChild(oNode);
			}

			oDescription = g_oCatalogXML.selectSingleNode("provider[identity/@itemID = 'devices']/product/group/item[identity/@itemID = '" + sUpdateID + "']/detection/compatibleHardware");
			xmlCopyNode(oDescription, oUpdate.selectSingleNode("detection"));
			xmlCopyNode(oUpdate, oRoot);
		}
	}

	g_oInstallationXML = InstallationXML;
	g_oInstallationResultXML = xmlNewXML();
	g_oInstallationResultXML.loadXML("<catalog><provider /></catalog>");

	vEULAs = oRoot.selectNodes("item/description/descriptionText/eula");
	aEULAs = fnRemoveStaticEulas(vEULAs);
	aEULAs = fnRemoveDuplicates(aEULAs);
	iEULAsLen = aEULAs.length;

	for(i = 0; i < iEULAsLen; i++){
		if(!fnDisplayEULA(aEULAs[i])){
			g_bDownloading = false;
			eContent.ePageDesc.style.display = "none";
			eContent.ePageDescCanceledEULA.style.display = "inline";
			vUpdateIDs = oRoot.selectNodes("item[description/descriptionText/eula/@href = '" + aEULAs[i] + "']");
			for(j = 0; j < vUpdateIDs.length; j++){
				oUpdateDiv = eContent.document.all[vUpdateIDs[j].selectSingleNode("identity/@itemID").text].children[0];
				if(oUpdateDiv.innerHTML.indexOf(L_CanceledEULAText_Text) == -1) oUpdateDiv.innerHTML += "<br /><span style='font-weight: normal;' class='sys-color-body-alert'>" + L_CanceledEULAText_Text + "</span>";
			}
			return false;
		}
	}

	iTotalDownloadsLen = oRoot.selectNodes("item").length;
	fnDisplayDownload(iTotalDownloadsLen, eContent.g_iTotalBasketSize);
}

function fnRemoveStaticEulas(vEulaNodes){
	var aEULAs, iEULAsLen, k, i, sHref, sEULA;
	iEULAsLen = vEulaNodes.length;
	aEULAs = new Array();
	k = 0;
	for (i=0; i < iEULAsLen; i++ ){
		sHref = vEulaNodes[i].getAttribute("href");
		sEULA = sHref.substr(sHref.lastIndexOf("/")+1).toLowerCase();
		if (sEULA != "eula.htm"){
			aEULAs[k++]= sHref ;
		}
	}
	return aEULAs;
}

function fnStartDownload(){
	if(g_bCorporate){
		g_sUUIDOperation = control_DownloadAsync(conClientInfoXML_Corp, g_oInstallationXML.xml, g_sDownloadPath, UPDATE_CORPORATE_MODE, "window", "DownloadUUID", false);
	}else{
		g_sUUIDOperation = control_DownloadAsync(conClientInfoXML, g_oInstallationXML.xml, g_sDownloadPath, UPDATE_NOTIFICATION_ANYPROGRESS, "window", "DownloadUUID", false);
	}
	if(g_sUUIDOperation == false || g_sUUIDOperation == "") return false;
}

function fnStartInstall(){
	g_bDownloading = false;
	g_bInstalling = true;
	g_sUUIDOperation = control_InstallAsync(conClientInfoXML, g_oInstallationXML.xml, g_sOperationResultXML, UPDATE_NOTIFICATION_ANYPROGRESS, "window", "InstallationUUID");
	if(g_sUUIDOperation == "") return false;
}

function fnOnOperationComplete(){
	var oInstallationRoot, oInstallationNode, oXML, vUpdates, iUpdatesLen, oUpdate, oStatusNode, sUpdateID, bInstalled, i;
	var oCatalogNode, oUpdateSize, iErrorCode, aOSIDs, aDriverIDs, sUpdateID;

	if(g_bSaveXML) top.fnSaveXML(g_sOperationResultXML, "Method-" + (g_bDownloading ? "DownloadAsync()" : "InstallAsync()") + " Result");

	oXML = xmlNewXML();
	oXML.loadXML(g_sOperationResultXML);
	vUpdates = oXML.selectNodes("items/itemStatus");
	iUpdatesLen = vUpdates.length;

	if(g_bCorporate){
		if(oXML.selectSingleNode("items/itemStatus/downloadStatus[@errorCode = '" + WIN32_ERROR_DISK_FULL + "']") != null){
			window.setTimeout("if(g_oDownloadPopup != null) g_oDownloadPopup.fnClose();fnDisplayErrorPage(" + conErrorDiskFull + ", false);", 0);
			return false;
		}

		aOSIDs = eTOC.os_sBasket.split(",");
		aDriverIDs = eTOC.driver_sBasket.split(",");
		if(eTOC.driver_sBasket != ""){
			for(j = 0; j < aDriverIDs.length - 1; j++){
				for(i = 0; i < iUpdatesLen; i++){
					oUpdate = vUpdates[i];
					oStatusNode = oUpdate.selectSingleNode("downloadStatus");
					if(oStatusNode.getAttribute("value") == "COMPLETE"){
						sUpdateID = oUpdate.selectSingleNode("identity/@itemID").text;
						if(aDriverIDs[j].indexOf(sUpdateID) != -1){
							eTOC.driver_sBasket = eTOC.driver_sBasket.replace((aDriverIDs[j] + ","), "");
						}
					}
				}
			}
		}

		if(eTOC.os_sBasket != ""){
			for(j = 0; j < aOSIDs.length - 1; j++){
				for(i = 0; i < iUpdatesLen; i++){
					oUpdate = vUpdates[i];
					oStatusNode = oUpdate.selectSingleNode("downloadStatus");
					if(oStatusNode.getAttribute("value") == "COMPLETE"){
						sUpdateID = oUpdate.selectSingleNode("identity/@itemID").text;
						if(aOSIDs[j].indexOf(sUpdateID) != -1){
							eTOC.os_sBasket = eTOC.os_sBasket.replace((aOSIDs[j] + ","), "");
						}
					}
				}
			}
		}

		eTOC.sBasketString = eTOC.driver_sBasket + eTOC.os_sBasket;
		aBasketIDs = eTOC.sBasketString.split(",");
		g_iCatalogBasketCount = aBasketIDs.length - 1;
		fnUpdateTOCBasket();
	}else{
		g_bCancelInstall = false;
		oInstallationRoot = g_oInstallationXML.selectSingleNode("catalog/provider");

		for(i = 0; i < iUpdatesLen; i++){
			oUpdate = vUpdates[i];
			sUpdateID = oUpdate.selectSingleNode("identity/@itemID").text;

			if(g_bDownloading){
				oStatusNode = oUpdate.selectSingleNode("downloadStatus");

				if(oStatusNode.getAttribute("value") == "COMPLETE"){
					oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
					oCatalogNode.setAttribute("downloaded", "1");

					oUpdateSize = oCatalogNode.selectSingleNode("size");

					if(oCatalogNode.getAttribute("basket") == "1"){ // isn't a dep.
						g_iConsumerBasketSize -= parseInt(oUpdateSize.text);
					}

					oUpdateSize.text = "0";
				}else{
					iErrorCode = parseInt(oStatusNode.getAttribute("errorCode"));

					oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
					oCatalogNode.setAttribute("errorCode", iErrorCode);

					// move item installation info out of install queue & into installation status \\
					oInstallationNode = oInstallationRoot.selectSingleNode("item[identity/@itemID = '" + sUpdateID + "']");
					xmlCopyNode(oInstallationNode, g_oInstallationResultXML.selectSingleNode("catalog/provider"), true, true);
					fnPruneDependents(sUpdateID, iErrorCode);

					if(oInstallationRoot.selectNodes("item").length == 0 || iErrorCode == WIN32_ERROR_DISK_FULL || iErrorCode == ERROR_INTERNET_CONNECTION_RESET || iErrorCode == ERROR_OPERATION_ABORTED) g_bCancelInstall = true;
				}
			}else{
				bInstalled = (oUpdate.selectSingleNode("installStatus[@value = 'COMPLETE']") != null);
				if(!g_bNeedsReboot) g_bNeedsReboot = (oUpdate.selectSingleNode("installStatus[@needsReboot = '1']") != null);

				if(bInstalled){
					oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
					oCatalogNode.setAttribute("installed", "1");

					if(oCatalogNode.getAttribute("basket") == "1"){
						g_iConsumerBasketCount--;
					}

					if(g_sExclusiveUpdateTitle != null) g_sExclusiveUpdateTitle = null;
				}else{
					iErrorCode = parseInt(oUpdate.selectSingleNode("installStatus/@errorCode").text);

					oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
					oCatalogNode.setAttribute("errorCode", iErrorCode);
				}
			}
		}

		if(g_bDownloading){
			if(g_bCancelInstall){
				window.setTimeout("if(g_oDownloadPopup != null) g_oDownloadPopup.fnClose();fnEndInstallation(true);", 0);
				return false;
			}else{
				fnStartInstall();
			}
		}else{
			if(g_bNeedsReboot){
				if(g_oDownloadPopup != null){
					window.setTimeout("if(g_oDownloadPopup != null) g_oDownloadPopup.fnShowProgressComplete();", 0);
				}

				window.setTimeout("fnConfirmReboot()", 1000);
			}
		}
	}

	g_sOperationResultXML = null;
}

function fnPruneDependents(sDependencyID, iErrorCode){
	var vDependentsIDs, iDependentsIDsLen, sDependentID, oInstallationNode, oCatalogNode, i;

	// select all items dependent on passed item \\
	vDependentsIDs = g_oCatalogXML.selectNodes("provider/product/group/item[dependencies/identity/@itemID = '" + sDependencyID + "']/identity/@itemID");
	iDependentsIDsLen = vDependentsIDs.length;

	for(i = 0; i < iDependentsIDsLen; i++){
		sDependentID = vDependentsIDs[i].text;
		oInstallationNode = g_oInstallationXML.selectSingleNode("catalog/provider/item[identity/@itemID = '" + sDependentID + "']");

		// if dependent is in install queue \\
		if(oInstallationNode != null){
			oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sDependentID + "']");
			if(oInstallationNode.selectSingleNode("@errorCode") == null) oCatalogNode.setAttribute("errorCode", iErrorCode); // set the dependent item with same error code as passed item
			xmlCopyNode(oInstallationNode, g_oInstallationResultXML.selectSingleNode("catalog/provider"), true, true); // move item installation info out of install queue & into installation status
			fnPruneDependents(sDependentID, iErrorCode); // recurse
		}
	}
}

function fnConfirmReboot(){
	if(window.confirm(L_Reboot_Text)) window.setTimeout('control_RebootMachine();', 100);
}

function fnUpdateTOCNumbers(){
	var aIDs, aUpdatesLen, vProducts, iProductsLen, oProduct, sProductID, iUpdatesLen, eTOCEls, oLink, i;

	aIDs = ["eCriticalUpdates", "eDriverUpdates"];
	aUpdatesLen = [g_oCatalogXML.selectNodes("provider/product/group/item[not(@hidden)][priority <= '3']").length, g_oCatalogXML.selectNodes("provider[identity/@itemID = 'devices']/product/group/item[not(@hidden)][priority > '3']").length];

	vProducts = g_oCatalogXML.selectNodes("provider[identity/@itemID != 'devices']/product[not(@personalized)]");
	iProductsLen = vProducts.length;
	for(i = 0; i < vProducts.length; i++){
		oProduct = vProducts[i];
		sProductID = oProduct.selectSingleNode("identity/@itemID").text;
		iUpdatesLen = oProduct.selectNodes("group[not(@personalized)]/item[not(@hidden)][not(@personalized)][priority > '3']").length;

		aIDs[aIDs.length] = sProductID;
		aUpdatesLen[aUpdatesLen.length] = iUpdatesLen;
	}

	eTOCEls = eTOC.document.all;

	for(i = 0; i < aIDs.length; i++){
		oLink = eTOCEls[aIDs[i]];
		iUpdatesLen = aUpdatesLen[i];
		oLink.children[1].innerText = " (" + iUpdatesLen + ")";
		oLink.style.fontWeight = (iUpdatesLen > 0) ? "bold" : "";
	}

	fnUpdateTOCBasket();
}

function fnEndInstallation(bProperClose){
	if(bProperClose == null) bProperClose = true;

	if(!g_bDownloading && !g_bInstalling) return false; // already ran fnEndInstallation()

	g_oDownloadPopup = null;
	control_SetOperationMode("", UPDATE_COMMAND_CANCEL);

	if(g_bDownloading && g_sOperationResultXML == null){
		return false;
	}else if(g_bInstalling && !bProperClose){
		fnDisplaySplashPage(conSplashInstallingWait);
		return false;
	}

	if(!g_bCancelInstall) fnOnOperationComplete();

	g_bDownloading = false;
	g_bInstalling = false;

	if(g_bCorporate){
		fnDisplayHistory(true);
	}else{
		fnDisplayStatus();
	}
}

/* download/install */
/* basket */

function fnAddItem(sUpdateID){
	var oNode, iSize;

	oNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
	iSize = parseInt(oNode.selectSingleNode("size").text);
	oNode.setAttribute("basket", "1");
	g_iConsumerBasketCount++;
	g_iConsumerBasketSize += iSize;
	fnUpdateTOCBasket();
}

function fnRemoveItem(sUpdateID){
	var oNode, iSize;

	oNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
	iSize = parseInt(oNode.selectSingleNode("size").text);
	oNode.removeAttribute("basket");
	g_iConsumerBasketCount--;
	g_iConsumerBasketSize -= iSize;

	fnUpdateTOCBasket();
}

function fnDeleteItem(sUpdateID){
	var oNode, oParent, bInBasket, bOnlyChild, iSize;

	oNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + sUpdateID + "']");
	oParent = oNode.parentElement;
	bInBasket = (oNode.getAttribute("basket") == "1");
	bOnlyChild = (oParent.selectNodes("item").length > 1);

	if(bInBasket){
		iSize = parseInt(oNode.selectSingleNode("size").text);
		g_iConsumerBasketCount--;
		g_iConsumerBasketSize -= iSize;
		fnUpdateTOCBasket();
	}

	oParent.removeChild(oNode);
}

function fnUpdateTOCBasket(){
	var iBasketCount, oBasket, oBasketNumber;

	oBasket = g_bCorporate ? eTOC.eCatalogBasket : eTOC.eBasketUpdates;
	oBasketNumber = oBasket.children[1];
	if(oBasketNumber == null) return false;
	iBasketCount = g_bCorporate ? g_iCatalogBasketCount : g_iConsumerBasketCount;
	if(iBasketCount > 0){
		oBasketNumber.innerText = " (" + iBasketCount + ")";
		oBasket.style.fontWeight = "bold";
	}else{
		oBasketNumber.innerText = oBasketNumber.innerText.replace(/\ \(\d+\)/, "");
		oBasket.style.fontWeight = "";
	}
}

function fnEmptyBasket(){

	var vUpdates, iUpdatesLen, i;
	vUpdates = g_oCatalogXML.selectNodes("provider/product/group/item[@basket]");
	iUpdatesLen = vUpdates.length;
	for(i = 0; i < iUpdatesLen; i++) vUpdates[i].removeAttribute("basket");
	g_iConsumerBasketCount = 0;
	g_iConsumerBasketSize = 0;
}

/* basket */
/* iuctl methods */

function control_GetManifest(sXmlClientInfo, sXmlSystemSpec, sXmlQuery){
	sXmlSystemSpec = sXmlSystemSpec.replace(/\'/g, "tempquote");
	sXmlQuery = sXmlQuery.replace(/\'/g, "tempquote");
	return fnCallControlMethod("GetManifest('" + sXmlClientInfo + "','" + sXmlSystemSpec + "','" + sXmlQuery + "')");
}


function control_Detect(sXmlCatalog){
	sXmlCatalog = sXmlCatalog.replace(/\'/g, "tempquote");
	return fnCallControlMethod("Detect('" + sXmlCatalog + "')");
}

function control_BrowseForFolder(bstrStartFolder, lFlag){
	return fnCallControlMethod("BrowseForFolder('" + bstrStartFolder + "'," + lFlag + ")", false);
}

function control_DownloadAsync(sXmlClientInfo, sXmlCatalog, sDestinationFolder, iMode, uProgressListener, sUuidOperation){
	sXmlCatalog = sXmlCatalog.replace(/\'/g, "tempquote");
	sDestinationFolder = sDestinationFolder.replace(/\'/g, "tempquote");
	return fnCallControlMethod("DownloadAsync('" + sXmlClientInfo + "','" + sXmlCatalog + "','" + sDestinationFolder + "'," + iMode + "," + uProgressListener + ",'" + sUuidOperation + "')", false);
}

function control_InstallAsync(sXmlClientInfo, sXmlCatalog, bstrXmlDownloadedItems, lMode, uProgressListener, sUuidOperation){
	sXmlCatalog = sXmlCatalog.replace(/\'/g, "tempquote");
	bstrXmlDownloadedItems = bstrXmlDownloadedItems.replace(/\'/g, "tempquote");
	return fnCallControlMethod("InstallAsync('" + sXmlClientInfo + "','" + sXmlCatalog + "','" + bstrXmlDownloadedItems + "'," + lMode + "," + uProgressListener + ",'" + sUuidOperation + "')", false);
}

function control_OnProgress(sUuidOperation, fItemCompleted, sDownloadProgress, plCommandRequest){
	if(g_oDownloadPopup != null){
		window.clearTimeout(g_iOnProgressTimer);
		g_iOnProgressTimer = window.setTimeout("try{g_oDownloadPopup.fnOnProgress('" + sDownloadProgress + "');}catch(e){control_SetOperationMode('', " + UPDATE_COMMAND_CANCEL + ");}", 0);
	}else{
		control_SetOperationMode("", UPDATE_COMMAND_CANCEL);
	}
}

function control_OnItemStart(sOpType, sItemID){
	if(g_oDownloadPopup != null){
		window.setTimeout("try{g_oDownloadPopup.fnOnItemStart('" + sOpType + "','" + sItemID + "');}catch(e){control_SetOperationMode('', " + UPDATE_COMMAND_CANCEL + ");}", 0);
	}else{
		control_SetOperationMode("", UPDATE_COMMAND_CANCEL);
	}
}

function control_OnOperationComplete(sUuidOperation, sXmlItems){
	g_sOperationResultXML = sXmlItems;

	if(g_oDownloadPopup != null){
		window.setTimeout("try{g_oDownloadPopup.fnOnOperationComplete();}catch(e){fnEndInstallation(false);}", 0);
	}else{
		fnEndInstallation(true);
	}
}

function control_RebootMachine(){
	return fnCallControlMethod("RebootMachine()", false);
}


/* iuctl methods */
/* iu functions */

function fnGetRegionalSettings(){
	var s, v, a;

	s = vbsToLocaleNumber(1000); // returns "1,000.00"

	v = s.match(/1([^0]?)000(.?)(0*)/);

	a = new Array(3);
	a[0] = escape(v[1]); // ","
	a[1] = escape(v[2]); // "."
	a[2] = v[3].length; // 2
	return a;
}

function fnGetDownloadSizeText(iSize){
	var sSize, sDownloadSizeText, iMinutes, iHours, sHours, sMinutes, bLessThan, sLessThan;

	sSize = fnFormatSize(iSize);

	if(g_iConnectionSpeed > 0){
		iMinutes = (iSize/g_iConnectionSpeed)/60;
		iHours = 0;

		if(iMinutes >= 60){
			iHours = Math.floor(iMinutes/60);
			iMinutes = Math.round(iMinutes%60);
			sHours = (iHours == 1) ? L_Hour_Text : L_Hours_Text;
		}else{
			bLessThan = (iMinutes > 0 && iMinutes < 1);
			iMinutes = bLessThan ? 1 : Math.round(iMinutes);
		}

		sMinutes = (iMinutes > 0 && iMinutes < 1.5) ? L_Minute_Text : L_Minutes_Text;

		if(conRTL){
			if(iHours > 0){
				sDownloadSizeText = "&lrm;" + iHours + " ," + sSize + "&lrm; " + sHours + " " + iMinutes;
			}else{
				sLessThan = bLessThan ? " &gt; " : "";
				sDownloadSizeText = "&lrm;" + iMinutes + sLessThan + " ," + sSize + "&lrm;";
			}
		}else{
			if(iHours > 0){
				sDownloadSizeText = sSize + ", " + iHours + " " + sHours + " " + iMinutes;
			}else{
				sLessThan = bLessThan ? "&lt; " : "";
				sDownloadSizeText = sSize + ", " + sLessThan + iMinutes;
			}
		}

		sDownloadSizeText += " " + sMinutes;
	}else{
		if(conRTL){
			sDownloadSizeText = "&lrm;" + sSize + "&lrm;";
		}else{
			sDownloadSizeText = sSize;
		}
	}

	return sDownloadSizeText;
}

function fnFormatSize(iSize){
	if(iSize >= conMB){
		return fnRound(iSize/conMB, 1) + " " + L_MB_Text;
	}else{
		return fnRound(iSize/conKB, 0) + " " + L_KB_Text;
	}
}

/* iu functions */
/* general functions */

function fnRound(i, iDecimalPlaces){
	if(iDecimalPlaces == null) iDecimalPlaces = 0;

	iDecimalPlaces = Math.pow(10, iDecimalPlaces);
	return Math.round(i*iDecimalPlaces)/iDecimalPlaces;
}

function fnArrayFromNodesText(vNodes){
	var iArrayLen, aArray, i;

	iArrayLen = vNodes.length;
	aArray = new Array(iArrayLen);
	for(i = 0; i < iArrayLen; i++) aArray[i] = vNodes[i].text;
	return aArray;
}

function fnGetQueryString(sURL, sKey){
	var vValue;

	vValue = sURL.match("(\\?|&)" + sKey + "=([^&$]*)");
	vValue = (vValue == null || vValue.length == 1) ? "" : vValue[2];
	return vValue;
}

function fnCopyArray(aFromArray){ return aFromArray.join(",").split(","); }

function fnRemoveDuplicates(aArray){
	var iArrayLen, aReturnArray, iReturnArrayLen, vValue, bFound, i, j;

	iArrayLen = aArray.length;
	aReturnArray = [];

	for(i = 0; i < iArrayLen; i++){
		vValue = aArray[i];
		bFound = false;
		iReturnArrayLen = aReturnArray.length;

		for(j = 0; j < iReturnArrayLen; j++){
			if(vValue == aReturnArray[j]){
				bFound = true;
				break;
			}
		}

		if(!bFound) aReturnArray[iReturnArrayLen] = vValue;
	}

	return aReturnArray;
}

/* general functions */
/* xml functions */

function xmlRemoveNodes(oXML, aNodeNames){
	var iNodeNamesLen, vNodes, iNodesLen, i, j;

	iNodeNamesLen = aNodeNames.length;
	for(i = 0; i < iNodeNamesLen; i++){
		vNodes = oXML.selectNodes(aNodeNames[i]);
		iNodesLen = vNodes.length;
		for(j = 0; j < iNodesLen; j++) vNodes[j].parentNode.removeChild(vNodes[j]);
	}
}

/* xml functions */
/*---- CONTENT ----*/

function fnLoadImages(){
	var vImages, iImagesLen, sSource, i;

	vImages = eContent.document.images;
	iImagesLen = vImages.length;
	for(i = 0; i < iImagesLen; i++){
		sSource = vImages[i].source;
		if(sSource != null) vImages[i].src = sSource;
	}
}

/* dependencies */

function fnGetDependencies(){
	var iDependenciesLen, aDependencyIDs, vUpdateIDs, iUpdateIDsLen, oUpdateDiv, vUpdateDivChildren, iUpdateDivChildrenLen, i;

	var iTotalBasketCount, iTotalBasketSize;

	iTotalBasketCount = g_iConsumerBasketCount;
	iTotalBasketSize = g_iConsumerBasketSize;
	eContent.g_iTotalBasketCount = iTotalBasketCount;
	eContent.g_iTotalBasketSize = iTotalBasketSize;

	// find updates in basket that have dependencies \\
	vUpdateIDs = g_oCatalogXML.selectNodes("provider/product/group/item[@basket = '1'][not(@hidden)][dependencies/identity]/identity/@itemID");
	iUpdateIDsLen = vUpdateIDs.length;
	if(iUpdateIDsLen == 0) return false;
	vUpdateIDs = fnArrayFromNodesText(vUpdateIDs);

	// find dependencies that haven't been detected yet, and detect them \\
	g_aDependencies = new Array();
	for(i = 0; i < iUpdateIDsLen; i++) fnFindAllDependencies(vUpdateIDs[i], "", false);
	aDependencyIDs = fnRemoveDuplicates(g_aDependencies);
	if(aDependencyIDs.length > 0) fnGetManifest(conDependencyLevel, aDependencyIDs);

	g_aDependencies = new Array();
	iDependenciesLen = 0;

	// find updates in basket who's dependencies are not in the basket and aren't installed. If no updates AREN'T in the basket, it's safe to remove the dependencies popup  \\
	for(i = 0; i < iUpdateIDsLen; i++){
		sUpdateID = vUpdateIDs[i];

		oUpdateDiv = eContent.document.all[sUpdateID];
		vUpdateDivChildren = oUpdateDiv.children;
		iUpdateDivChildrenLen = vUpdateDivChildren.length;

		fnFindAllDependencies(sUpdateID, "[not(@basket)]", true);

		if(g_aDependencies.length > iDependenciesLen){
			iDependenciesLen = g_aDependencies.length;
			vUpdateDivChildren[0].innerText = vUpdateDivChildren[0].innerText.replace(/([^\*])$/, "$1*");
			vUpdateDivChildren[iUpdateDivChildrenLen - 3].style.display = "block";
			vUpdateDivChildren[iUpdateDivChildrenLen - 2].style.display = "block";
		}else{
			vUpdateDivChildren[0].innerText = vUpdateDivChildren[0].innerText.replace(/\*$/, "");
			vUpdateDivChildren[iUpdateDivChildrenLen - 3].style.display = "none";
			vUpdateDivChildren[iUpdateDivChildrenLen - 2].style.display = "none";
		}
	}

	// get dependencies sizes \\
	aDependencyIDs = fnRemoveDuplicates(g_aDependencies);
	iDependenciesLen = aDependencyIDs.length;
	for(i = 0; i < iDependenciesLen; i++){
		iTotalBasketCount++;
		iTotalBasketSize += parseInt(g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + aDependencyIDs[i] + "']/size").text);
	}

	eContent.g_iTotalBasketCount = iTotalBasketCount;
	eContent.g_iTotalBasketSize = iTotalBasketSize;
}

var g_oOldDependencyPopupLink;

function fnShowDependencies(oLink, sUpdateID, bShow){
	var oDoc, oOldDependencyPopupLink, oDiv, oSpan, oBr;
	var aDependencies, iDependencyIDsLen, aDependencyDetails, oCurrentDependencies, iCurrentDependenciesLen, i;
	var oCatalogNode, sTitle;
	var iHiddenDependencySizes, iVisibleDependencyCount;


	oDoc = eContent.document;

	if(g_oOldDependencyPopupLink != null){
		oOldDependencyPopupLink = g_oOldDependencyPopupLink;
		oSpan = oOldDependencyPopupLink.parentElement;

		oOldDependencyPopupLink.innerText = L_DependenciesShow_Text + " >>";
		oOldDependencyPopupLink.className = "sys-link-normal";
		oOldDependencyPopupLink.onclick = new Function("fnShowDependencies(this, '" + sUpdateID + "', true);eContent.fnCancel();return false;");

		oSpan.className = "dependencies";
		oSpan.style.cursor = "auto";

		oDiv = oDoc.all[oSpan.parentElement.parentElement.id + "DepDiv"];
		oDiv.style.visibility = "hidden";
	}

	if(bShow){
		oSpan = oLink.parentElement;
		oDiv = oDoc.all[sUpdateID + "DepDiv"];

		if("object" != typeof(oDiv)){
			oDiv = oDoc.createElement("div");
			oDiv.className = "sys-rhp-bgcolor sys-toppane-color-border dependenciesBox";
			var sUpdateTitle = oSpan.parentElement.parentElement.firstChild.innerText.replace(/\*/, "");
			oDiv.innerText = L_DependenciesBoxText_Text.replace(/\|UPDATE\|/g, sUpdateTitle);
			oDiv.id = sUpdateID + "DepDiv";
			oBr = oDoc.createElement("br");
			oDiv.appendChild(oBr);
			oBr = oDoc.createElement("br");
			oDiv.appendChild(oBr);
			oDoc.body.appendChild(oDiv);
		}

		oLink.innerText = L_DependenciesHide_Text + " <<";
		oLink.className = "sys-link-normal sys-toppane-header-color";
		oLink.onclick = new Function("fnShowDependencies(this, '" + sUpdateID + "', false);return false;");

		oSpan.className = "dependencies sys-toppane-header-bgcolor"
		oSpan.style.cursor = "hand";

		// get titles for dependencies that don't have titles \\
		g_aDependencies = new Array();
		fnFindAllDependencies(sUpdateID, "[not(title)][not(@basket)]", true);
		aDependencies = fnRemoveDuplicates(g_aDependencies);

		if(g_aDependencies.length > 0) fnGetUpdateTitles(aDependencies);

		// construct titles & sizes for non-hidden dependencies \\
		g_aDependencies = new Array();
		fnFindAllDependencies(sUpdateID, "[not(@basket)]", true);
		aDependencies = fnRemoveDuplicates(g_aDependencies);

		iHiddenDependencySizes = 0;
		iVisibleDependencyCount = 0;
		iDependencyIDsLen = aDependencies.length;
		aDependencyDetails = new Array();
		for(i = 0; i < iDependencyIDsLen; i++){
			oCatalogNode = g_oCatalogXML.selectSingleNode("provider/product/group/item[identity/@itemID = '" + aDependencies[i] + "']");
			iSize = parseInt(oCatalogNode.selectSingleNode("size").text);

			if(oCatalogNode.selectSingleNode("title") == null || oCatalogNode.selectSingleNode("@hidden") != null){
				iHiddenDependencySizes += iSize;
			}else{
				sTitle = oCatalogNode.selectSingleNode("title").text;
				aDependencyDetails[iVisibleDependencyCount++] = sTitle + " (" + fnFormatSize(iSize) + ")";
			}
		}

		// add titles for hidden dependencies \\
		if(iHiddenDependencySizes > 0){
			aDependencyDetails[iVisibleDependencyCount] = L_DependenciesBoxHidden_Text + " (" + fnFormatSize(iHiddenDependencySizes) + ")";
			iVisibleDependencyCount++;
		}

		// remove temporaty text from popup \\
		oCurrentDependencies = oDiv.children;
		iCurrentDependenciesLen = oCurrentDependencies.length;
		for(i = 2; i < iCurrentDependenciesLen; i++) oDiv.removeChild(oCurrentDependencies[2], true);

		// write dependency titles into popup \\
		for(i = 0; i < iVisibleDependencyCount; i++){
			oSpan = oDoc.createElement("span");
			oSpan.innerText = aDependencyDetails[i];
			oDiv.appendChild(oSpan);
			oBr = oDoc.createElement("br");
			oDiv.appendChild(oBr);
		}

		var iLinkTop = eContent.fnGetDistance(oLink, true) - eContent.eUpdatesContainer.scrollTop;

		if(iLinkTop + oLink.offsetHeight - oDoc.body.offsetHeight + oDiv.offsetHeight + 6 > 0){
			oDiv.style.top = iLinkTop - oDiv.offsetHeight - 1 + "px";
		}else{
			oDiv.style.top = iLinkTop + oLink.offsetHeight + 2 + "px";
		}

		g_oOldDependencyPopupLink = oLink;
		oLink.focus();
		oLink.onblur = new Function("fnShowDependencies(g_oOldDependencyPopupLink, '" + sUpdateID + "', false);");
		oDoc.onmousewheel = new Function("fnShowDependencies(g_oOldDependencyPopupLink, '" + sUpdateID + "', false);");
		oDiv.style.visibility = "visible";
	}else{
		g_oOldDependencyPopupLink = null;
		oLink.onblur = null;
		oDoc.onmousewheel = null;
	}
}

/* dependencies */
/* adding/removing updates */

function fnAddUpdate(oAddButton){
	var oDiv, oRemoveButton, bExclusiveUpdate, sUpdateTitle;

	if(fnContentDisabled()) return false;

	oDiv = oAddButton.parentElement.parentElement;

	bExclusiveUpdate = (oDiv.exclusive == "1");
	if(bExclusiveUpdate){
		sUpdateTitle = oDiv.children[0].innerText.replace(/\*$/, "");

		if((g_iConsumerBasketCount == 0) || window.confirm(L_ExclusivePopupText_Text.replace(/\|EXCLUSIVE\|/g, sUpdateTitle))){
			g_sExclusiveUpdateTitle = sUpdateTitle;
			fnEmptyBasket();
			eContent.fnUpdateButtonStates();
		}else{
			return false;
		}
	}else if(g_sExclusiveUpdateTitle != null){
		sUpdateTitle = oDiv.children[0].innerText;
		if(window.confirm(L_ExclusivePopupOverwriteText_Text.replace(/\|EXCLUSIVE\|/g, g_sExclusiveUpdateTitle).replace(/\|UPDATE\|/g, sUpdateTitle))){
			g_sExclusiveUpdateTitle = null;
			eContent.clearTimeout(eContent.g_iMoveTimer);
			if("object" == typeof(eContent.eMoveObj)) eContent.eMoveObj.removeNode(true);
			fnEmptyBasket();
			eContent.fnUpdateButtonStates();
		}else{
			return false;
		}
	}

	oRemoveButton = oAddButton.nextSibling;
	oAddButton.disabled = true;
	oRemoveButton.disabled = false;

	eContent.fnMoveObject(oDiv, eContent.conShrinking, conAddedUpdate);
}

function fnRemoveUpdate(oRemoveButton){
	var oDiv, iAddButton;

	if(fnContentDisabled()) return false;
	if("object" == typeof(eContent.eMoveObj)) eContent.fnEndMove(true);

	oDiv = oRemoveButton.parentElement.parentElement;
	oAddButton = oRemoveButton.previousSibling;
	oAddButton.disabled = false;
	oRemoveButton.disabled = true;

	if(oDiv.exclusive == "1") g_sExclusiveUpdateTitle = null;
	if(oDiv.downloaded == "1") oDiv.getElementsByTagName("span")[0].innerHTML = L_AlreadyDownloadedRemovedText_Text;

	oDiv.className = "update";
	oDiv.lastChild.firstChild.style.visibility = "hidden";

	fnRemoveItem(oDiv.id);
	eContent.fnUpdateBasketStats();

	eContent.fnMoveObject(oDiv, eContent.conGrowing, conRemovedUpdate);
}

function fnRemoveFromBasket(oRemoveButton){
	var oDiv;

	if(fnContentDisabled()) return false;

	oDiv = oRemoveButton.parentElement.parentElement;

	if(oDiv.exclusive == "1") g_sExclusiveUpdateTitle = null;

	eContent.fnMoveObject(oDiv, eContent.conShrinking, conBasketPage);
}

/* adding/removing updates */
/*---- CONTENT ----*/
/*---- TOC ----*/

function fnAddTOCLink(sProductID,sProductLabel,sProductCategory,iUpdatesLen){
	var oDoc, bIsWindows, oImage, oLink, oSpan, oText, oBr, oI;

	oDoc = eTOC.document;
	bIsWindows = (sProductCategory == conCategoryOS);

	if(bIsWindows){
		oLink = eTOC.eWindowsUpdates;
		oLink.innerText = "";
	}else{
		oLink = oDoc.createElement("a");
		oBr = oDoc.createElement("br");
		eTOC.eAvailableUpdatesDiv.insertBefore(oLink, eTOC.eDriverUpdates);
		eTOC.eAvailableUpdatesDiv.insertBefore(oBr, eTOC.eDriverUpdates);
	}

	oImage = oDoc.createElement("img");
	oText = oDoc.createTextNode(sProductLabel);
	oI = oDoc.createElement("i");

	oLink.appendChild(oImage);
	oLink.appendChild(oText);
	oLink.appendChild(oI);

	oLink.id = sProductID;
	oLink.title = L_ProductUpdatesAlt_Text.replace("|PRODUCT|", sProductLabel);
	oLink.onclick = new Function("g_bCorporate=false;fnDisplayProductUpdates('" + sProductID + "');return false;");
	if(iUpdatesLen > 0) oLink.style.fontWeight = "bold";
	eTOC.fnEnableLink(oLink);

	oImage.src = "/shared/images/toc_endnode.gif";

	if(conRTL) oI.dir = "ltr";
	oI.innerText = " (" + iUpdatesLen + ")";
}

function fnEndTOCDetectUpdates(iCriticalUpdatesLen, iDriverUpdatesLen){ // enables the critical updates and driver updates link
	var oLink;

	oLink = eTOC.eCriticalUpdates;
	eTOC.fnEnableLink(oLink);
	oLink.children[1].innerText = " (" + iCriticalUpdatesLen + ")";
	oLink.onclick = new Function("fnDisplayCriticalUpdates();return false;");
	if(iCriticalUpdatesLen > 0) oLink.style.fontWeight = "bold";

	oLink = eTOC.eDriverUpdates;
	if(iDriverUpdatesLen == 0 && g_bDriversFailed == true){
		eTOC.fnEnableLink(oLink,false);
	}
	else {
		eTOC.fnEnableLink(oLink);
		oLink.children[1].innerText = " (" + iDriverUpdatesLen + ")";
		oLink.onclick = new Function("fnDisplayDriverUpdates();return false;");
		if(iDriverUpdatesLen > 0) oLink.style.fontWeight = "bold";
	}

	oLink = eTOC.eAvailableUpdates;
	oLink.onclick = new Function("fnDisplayAvailableUpdates();eTOC.fnExpandNode(this, null, false);return false;");
	oLink.children[1].innerText = L_ScanForAvailableUpdates_Text;

	oLink = eTOC.eBasketUpdates;
	eTOC.fnEnableLink(oLink);
	oLink.onclick = new Function("fnDisplayBasketUpdates(false);return false;");
}

/*---- TOC ----*/

fnInitTopJS();

