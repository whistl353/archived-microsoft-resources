//Copyright (c) Microsoft Corporation.  All rights reserved.
/* global variables */
var g_bOSIsServer,g_aProductIDs;
var g_bMandatoryUpdatePresent;
var g_sMandatoryUpdateIndexes;
var g_aSuccessfulUpdates = new Array();
var g_aFailedUpdates = new Array();
var g_aRemainingUpdates = new Array();
var g_aSuccessfulMandatoryUpdates = new Array();
var g_aFailedMandatoryUpdates = new Array();
var g_bSPMode = false;//variable that tells to scan for superseded updates
var g_bSPPresent = false; // tells if SP is present and needs to be displayed
var g_iSPPresentIndex = -1;
var g_bHighPriority = false; // tells if high priority update is present
var g_bPsfStringPresent = false;
var g_sPsfString = "windowspatch";

/* global variables */

/* constants */
var conInstallSucceeded = 2;
var conInstallAborted = 5;
var conUpdateTypeSoftware = 1;
var conSecPerMBPsf = 18
var conBiasPsf = 45;

/* constants */
 
var sTOC = "<UL class='RootUL'>";
var g_oUpdateSearcher, g_oSearchJob, g_oSearchResult, g_bSearchTimeout, g_oUpdateInstaller, g_oWebProxy, g_oWebSession;
var g_iSearchTimeoutValue = 1200000;
var g_iProxyRetry = 0, g_iProxyRetryMax = 3;
var g_sDelim = "==@#$%^==";
var g_aCat = new Array();    // This array contains data for the Categories
var g_iSingleExclusive = -1
var g_iSingleEXDownloadPriority = 9;
var g_sExlusiveUpdates = "" ;
var g_iHighestDownloadPriority = 9;
var g_sSortExclusive = ""; 
var g_aMFDURLs = new Array();
var g_aMFDURLIndex = new Array();//Two parallel arrays that contain URL and index

function fnInitDetect(){
	var i, j;
	fnTrace("fnInitDetect");
	g_bSearchTimeout = false;
	g_bMandatoryUpdatePresent = false;
	try {
		if(!g_bSPMode){
			g_oWebSession = g_oControl.CreateObject("Microsoft.Update.Session");
			g_oWebSession.ClientApplicationID = "WindowsUpdate";
			g_oUpdateSearcher = g_oWebSession.CreateUpdateSearcher();
			g_oUpdateSearcher.ServerSelection = 2;	
		}else{	
			g_oUpdateSearcher.IncludePotentiallySupersededUpdates = true;		
		}
		g_oSearchJob = g_oUpdateSearcher.BeginSearch("IsInstalled=0", fnSearchOperationCallBack, 0); // Async Search Operation for mandatory and non-mandatory updates
		window.setTimeout("fnSearchOperationTimeout()", g_iSearchTimeoutValue); 
	}	
	catch(e){
			g_bScanning = false;
			fnDisplayErrorPage(e.number, false);
			return false;
	}
}

function fnSearchOperationTimeout() { 
	fnTrace("fnSearchOperationTimeout");
	if(g_oSearchJob.IsCompleted) {
		return false;
	} else {
		g_bSearchTimeout = true;
		fnDisplayErrorPage(conErrorSearchTimeout, false);
	}
}

function fnSearchOperationCallBack() {
	var i, iWarningsCount;
	fnTrace("fnSearchOperationCallBack");
	if(g_bSearchTimeout) {
		return false;
	}  
	try {
		if(g_oSearchJob.IsCompleted) { 
			g_sSearchResult = g_oUpdateSearcher.EndSearch(g_oSearchJob);
			iWarningsCount = g_sSearchResult.Warnings.Count;
			if(iWarningsCount > 0) {
				for(i = 0; i < iWarningsCount; i++) {
					if(g_sSearchResult.Warnings.Item(i).HResult == ERROR_INVALID_PID) {
						g_bInvalidPID = true;
						break;
					}
				}
			}
			g_UpdateCategory = g_sSearchResult.RootCategories;
			g_RawUpdateCol = g_sSearchResult.Updates;
			g_iProxyRetry = 0;
			fnEndDetectUpdates();
			return; 
		}
	}	
	catch(e) { 
		if(e.number == PROXY_ERROR_CODE) {
			if(g_iProxyRetry++ == g_iProxyRetryMax) {
				g_bScanning = false;
				g_iProxyRetry = 0;
				fnDisplayErrorPage(PROXY_ERROR_CODE, false);
				return false;
			}
			if(g_iProxyRetry == 1) {
				g_oWebProxy = g_oControl.CreateObject("Microsoft.Update.WebProxy");
				g_oWebSession.WebProxy = g_oWebProxy;
			}
			g_oWebProxy.PromptForCredentials(window, L_ProxyTitle_Text);
			g_oSearchJob = g_oUpdateSearcher.BeginSearch("IsInstalled=0", fnSearchOperationCallBack, 0);
			return false;
		}
		g_bScanning = false;		
		fnDisplayErrorPage(e.number, false);
		return false;
	}

}

function fnEndDetectUpdates(){
	fnTrace("fnEndDetectUpdates");
	g_bDetectedItems = true;
	if(fnBuildCategoryArrays() == false) return;
	if (g_bMandatoryUpdatePresent){ 
		fnDisplayMandatoryUpdates();
	}
	else {
		fnShowResultlist();
	}	
	g_bScanning = false;
}

function fnShowResultlist(){
	var iCriticalUpdatesCount, sUpdateArrayIndexes, aMandatoryUpdateIndexes, iUpdateResultCode, iInstallColCount, oUpdateInstallResult, iMandatoryUpdateCount, oInstallationResult, oUpdateInstaller, oInstallCol, i;
	var bSomeFailed = false;
	var j = 0;
	var k = 0;
	if (g_bMandatoryUpdatePresent){ // then install mandatory updates first
		oInstallCol = g_oControl.CreateObject("Microsoft.Update.UpdateColl");
		aMandatoryUpdateIndexes = g_sMandatoryUpdateIndexes.split(",");	
		iMandatoryUpdateCount = aMandatoryUpdateIndexes.length;
		for(i = 0; i < iMandatoryUpdateCount; i++) {			
			oInstallCol.Add(parent.g_UpdateCol(aMandatoryUpdateIndexes[i]));
		}	
		oUpdateInstaller = g_oWebSession.CreateUpdateInstaller();
		oUpdateInstaller.Updates = oInstallCol;
		iInstallColCount = oInstallCol.Count;
		oUpdateInstaller.ParentWindow = window;
		oInstallationResult = oUpdateInstaller.RunWizard(parent.L_InstallTitle_Text);
		g_aSuccessfulMandatoryUpdates.length = 0;
		g_aFailedMandatoryUpdates.length = 0;
		for(i = 0; i < iInstallColCount; i++) {
			oUpdateInstallResult = oInstallationResult.GetUpdateResult(i);
			iUpdateResultCode = oUpdateInstallResult.ResultCode;
			if (iUpdateResultCode == conInstallSucceeded){	
				g_aSuccessfulMandatoryUpdates[j] = new String();
				g_aSuccessfulMandatoryUpdates[j++].Title = oInstallCol(i).Title;
			}
			else {
				g_aFailedMandatoryUpdates[k] = new String();
				g_aFailedMandatoryUpdates[k].Title = oInstallCol(i).Title;
				g_aFailedMandatoryUpdates[k++].ErrorCode = oUpdateInstallResult.HResult;	  
				bSomeFailed = true;
			}
			if(oUpdateInstallResult.RebootRequired) {
				g_bIsRebootRequired = true;
			}
		}
		
		if (bSomeFailed || g_bIsRebootRequired) {
			fnDisplayInstallStatus(conInstallStatusMandatory);
			return false;
		}	
	}		
			
			
	if((g_bExpressScan && !(g_bSPCoolOff || g_bSPAU)) || (g_iHighestDownloadPriority == 0))	g_bSPPresent = false; // set Sp present to false if any very high priority updates are present  
	if ((!g_bExpressScan && (!g_bSPPresent || g_iHighestDownloadPriority == 0)) || ('undefined' != typeof(conWerMode) && conWerMode == iWerQueryModeHardwareAll) ) {
		fnCreateTocTree();
		eTOC.eAvailableUpdatesTable.style.display = "block";
	}	
	iCriticalUpdatesCount = fnGetUpdateCount();
	if (g_bExpressScan)	fnEndTOCDetectUpdates(conExpressInstall);
	
	g_iConsumerBasketCount = iCriticalUpdatesCount;
	
	if(g_bPersonalizing){
		fnUpdateTOCBasket();
		fnDisplayPersonalization();
		g_bPersonalizing = false;
	}else{
		if (!g_bExpressScan) {
			if ('undefined' != typeof(conWerMode) && conWerMode == iWerQueryModeHardwareAll ){ //WER scenario
				fnEndTOCDetectUpdates(conResultsBasket);
				fnDisplayHardwareUpdates();
			}
			else if(g_bSPPresent && g_iHighestDownloadPriority != 0){
				fnEndTOCDetectUpdates(conExpressInstall);
				fnDisplaySPUpdate();
			}else{
				fnEndTOCDetectUpdates(conResultsBasket);
				fnDisplayCriticalUpdates();	
			}	
		}	
		else {
			fnEndTOCDetectUpdates(conExpressInstall);
			if((g_bSPCoolOff || g_bSPAU) && g_bSPPresent && g_iHighestDownloadPriority != 0){
				fnDisplaySPUpdate();
			}else{
				sUpdateArrayIndexes = fnGetCategoryLevelUpdates(conCategoryCritical,null);
				fnPostData(sUpdateArrayIndexes, conConsumerURL + "resultslist.aspx?" + conQueryString + "&id=" + conExpressInstall);
			}
		}
		
	}
	
}

function fnDisplayMandatoryUpdates(){
	fnTrace("fnDisplayMandatoryUpdates");
	fnPostData(g_sMandatoryUpdateIndexes, conConsumerURL + "splash.aspx?" + conQueryString + "&page=" + conSplashMandatoryUpdates);
}
function fnDisplaySPUpdate(){
	fnTrace("fnDisplaySPUpdate");
	fnPostData(g_iSPPresentIndex, conConsumerURL + "servicepack.aspx?" + conQueryString + "&page=" + conServicePack);
}
function fnInstallUpdates(exclusiveIndex){  
	//Build an update collection of only the updates that are selected into the basket
	var i, ii, iUpdateCount, bFailed, iInstallColCount, bInBasket = false, aMFDUpdateIndexes, l;
	var j = 0;
	var k = 0;
	var m = 0;
	fnTrace("fnInstallUpdates");
	iUpdateCount = g_aUpdate.length;
	var oUpdateInstallResult, iUpdateResultCode;
	g_aRemainingUpdates.length = 0;
	for(i = 0; i < iUpdateCount; i++) {
		if(g_aUpdate[i].InBasket) {
			bInBasket = true; 
			break;
		}
	}	
	//If an exclusive in basket, remove all but first exclusive
	if(exclusiveIndex != -1) {
		for(i = 0; i < iUpdateCount; i++) {
			g_aUpdate[i].InBasket = false;
		}
		g_aUpdate[exclusiveIndex].InBasket = true;
		bInBasket = true;
	}
	
	if(bInBasket) {
		try {
			//Create a new collection and add the selected updates
			g_InstallCol = g_oControl.CreateObject("Microsoft.Update.UpdateColl");
			g_aRemainingUpdates.length = 0;
			for(i = 0; i < iUpdateCount; i++) { 
				if(g_aUpdate[i].InBasket) {
					if ('undefined' != typeof(conWerMode) && conWerMode == iWerQueryModeExpress && g_UpdateCol(i).Identity.UpdateID == sWerUpdateId ){
						g_aQueryString[1] = "IssueType=UserInstall";
						fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
					}
					g_InstallCol.Add(g_UpdateCol(i));
					if(g_aUpdate[i].MFDIndex != "") {
						aMFDUpdateIndexes = g_aUpdate[i].MFDIndex.split(",");
						for(ii=0; ii < aMFDUpdateIndexes.length-1; ii++) {
							g_InstallCol.Add(g_UpdateCol(aMFDUpdateIndexes[ii]));
						}						
					}	
				} else {
					if(g_aUpdate[i].IsCritical ) {
						g_aRemainingUpdates[m] = new String();
						g_aRemainingUpdates[m++].Title = g_UpdateCol(i).Title;
					}
				}
			}
			if ('undefined' != typeof(conWerMode) && ( conWerMode == iWerQueryModeExpressAll || conWerMode == iWerQueryModeHardwareAll  ) ){
				g_aQueryString[1] = "IssueType=UserInstall";
				fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
			}
			//Create the Installer object and pass it the Install collection
			//g_oUpdateInstaller = g_oControl.CreateObject("Microsoft.Update.Installer");
			g_oUpdateInstaller = g_oWebSession.CreateUpdateInstaller();
			g_oUpdateInstaller.Updates = g_InstallCol;
			iInstallColCount = g_InstallCol.Count;
			
			//Code for Installer.RunWizard
			g_oUpdateInstaller.ParentWindow = window;
			g_oInstallationResult = g_oUpdateInstaller.RunWizard(parent.L_InstallTitle_Text);
			g_aSuccessfulUpdates.length = 0;
			g_aFailedUpdates.length = 0;
			//if (g_oInstallationResult.ResultCode != conInstallAborted){ 
			eTOC.eHidden.onclick = null;
			eTOC.fnEnableLink(eTOC.eHidden, false);
			for(i = 0; i < iInstallColCount; i++) {
				oUpdateInstallResult = g_oInstallationResult.GetUpdateResult(i);
				iUpdateResultCode = oUpdateInstallResult.ResultCode;
				if (iUpdateResultCode == conInstallSucceeded){
					g_aSuccessfulUpdates[j] = new String();
					g_aSuccessfulUpdates[j++].Title = g_InstallCol(i).Title;					
				}	
				else {
					bFailed = true;
					if ('undefined' != typeof(conWerMode) && conWerMode == iWerQueryModeExpress && g_InstallCol(i).Identity.UpdateID == sWerUpdateId ){
						g_aQueryString[1] = "IssueType=SetupFail";
						fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
					}
					g_aFailedUpdates[k] = new String();
					g_aFailedUpdates[k].Title = g_InstallCol(i).Title;
					g_aFailedUpdates[k++].ErrorCode = oUpdateInstallResult.HResult;	 	
				}
				if(oUpdateInstallResult.RebootRequired) {
					g_bIsRebootRequired = true;
				}
			}
			if (bFailed && 'undefined' != typeof(conWerMode) && ( conWerMode == iWerQueryModeExpressAll || conWerMode == iWerQueryModeHardwareAll  ) ){
				g_aQueryString[1] = "IssueType=SetupFail";
				fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
			}
			
			g_oUpdateInstaller = null;
			fnDisplayInstallStatus(conInstallStatusRegular);
			//}	
		}
		catch(e){	
			g_oUpdateInstaller = null;
			fnDisplayErrorPage(e.number, true);
			return false;
		}
	} else {
				alert(parent.L_RListBasketUpdatesNotAvailableText_Text);
	}
}

function fnDisplayInstallStatus(iPage) {
	fnTrace("fnDisplayInstallStatus");	
	eContent.location.href = "InstallStatus.aspx?page=" + iPage + "&" + conQueryString;
}

function window.onbeforeunload(){
	fnTrace("onbeforeunload");
	try {
		g_oSearchJob.RequestAbort();
		g_oSearchJob.CleanUp();
	}
	catch(e) {}	
}

/* creates <UL> blob and then plots the TOC tree for categories */
function fnCreateTocTree(sProductID, sProductLabel, sProductCategory, iUpdatesLen){
	var bRemoved , i, bAddExtraLiBlob, sCriticalId, sOptionalSoftwareId, sOptionalHardwareId, sBetaId;
	fnTrace("fnCreateTocTree");
	sCriticalId = conCategoryCritical;
	sOptionalSoftwareId = conCategorySoftware;
	sOptionalHardwareId = conCategoryHardware;
	sBetaId = conCategoryBeta;
	//if (g_aToc.length > 0){ Commented for Bug #848653
	fnCreateTocSection(eTOC.L_Toc_Critical_Text, eTOC.L_Toc_CriticalUpdatesAlt_Text, sCriticalId, conCritical);
	fnCreateTocSection(eTOC.L_Toc_Software_Text ,eTOC.L_Toc_SoftwareUpdatesAlt_Text, sOptionalSoftwareId, conSoftware);
	fnCreateTocSection(eTOC.L_Toc_Hardware_Text ,eTOC.L_Toc_HardwareUpdatesAlt_Text, sOptionalHardwareId, conHardware);
	fnCreateTocSection(eTOC.L_Toc_Beta_Text ,eTOC.L_Toc_BetaUpdatesAlt_Text, sBetaId, conHideable)
	//}	 
	
	sTOC += "</UL>";
	eTOC.eAvailableUpdatesDiv.style.display = "block";
	eTOC.eAvailableUpdatesDiv.innerHTML = sTOC;
	var vLinks = eTOC.eAvailableUpdatesDiv.getElementsByTagName("a");
	var iCategoryLinkLength = vLinks.length;
	if ('function' == typeof(eTOC.fnEnableLink)){
		for(i = 0; i < iCategoryLinkLength; i++) {
			vLinks[i].onclick = new Function("eTOC.fnClickTOCtree(this);return false;");
			eTOC.fnEnableLink(vLinks[i],true);
		}	
	} 
		
}

/* Created TOC secction for Critical,Software,Hardware,Beta updates*/
function fnCreateTocSection(sSec,sAltText,sId,sDeterminingFactor) {
	var sTitle, sCategoryIndexes, sAlt,  iTocLength, sCategoryLevelIndexes, sCategoryClassName, sNodeClassName, sLevelIndexes;
	var iCurrentDisplayLevel, bLeafNode, iNextDisplayLevel, iLevelDiff, sImageSrc, iCategoryLevelUpdatesCount;
	var bCritical, bHideable, sTempId;
	fnTrace("fnCreateTocSection");
	sTitle = sSec;
	sAlt = sAltText;
	sTempId = sId;
	if ( sDeterminingFactor == conCritical ) bCritical = true;
	else if (sDeterminingFactor == conHideable) bHideable = true;
	
	if (sId == conCategorySoftware || sId == conCategoryHardware ) sTempId = "optional";
	sCategoryLevelIndexes = fnGetCategoryLevelUpdates(sTempId,sDeterminingFactor);
	if (sCategoryLevelIndexes != ""){
		iCategoryLevelUpdatesCount = fnGetActualCategoryLevelUpdateCount(sCategoryLevelIndexes);
	}
	else {
		iCategoryLevelUpdatesCount = 0;
	}	
	sCategoryClassName = "CategoryLI"; 
	//if (sCategoryLevelIndexes == "" ) sCategoryClassName += " NoUpdates"  // if there are no updates , dont show that section
	
	
	if (bHideable){
		sCategoryClassName += (eTOC.g_oUserData.getAttribute("bBetaLink")== "1")? "" : " HideCategory";
	}	 
	 
	if (bCritical || bHideable || sDeterminingFactor == conHardware ) { // no sub-tree under "critical updates" or "beta updates" or "hardware updates"
		sTOC += "<LI class='" + sCategoryClassName + "' UpdateArrayIndexes='" + sCategoryLevelIndexes + "' ID='" + sId + "' LeafNode='false'><span style='layout-flow:horizontal'>" +
				"<a ID ='" + sId + "' title=\"" + sAlt + "\" class='sys-link-normal'> " +
				"<img src='shared/images/toc_endnode.gif' />" + sTitle + " <span id='eUpdateCount'>(" + iCategoryLevelUpdatesCount + ")</span></a></span></LI>\n";
				
	
	} 	
	else  {		// software updates 
		iTocLength = g_aToc.length;
		
		sTOC += "<LI class='" + sCategoryClassName + "' UpdateArrayIndexes='" + sCategoryLevelIndexes + "' ID='" + sId + "' LeafNode='false'><span>" +
				"<a ID='" + sId + "' title=\"" + sAlt + "\" class='sys-link-normal'> " +
				"<img src='shared/images/" + "ImgPlaceHolder" + "' />" + sTitle + " <span id='eUpdateCount'>(" + iCategoryLevelUpdatesCount +  ")</span></a></span></LI>\n";
		
		sTOC += "<UL class='UpdateCategory' ID='U" + sId + "'>\n";
		sCategoryIndexes = "";
		for (var i = 0; i < iTocLength; i++) {
			
			iCurrentDisplayLevel = g_aToc[i].displayLevel;
			sText = g_aToc[i].text;
			if (iCurrentDisplayLevel == -1 || iCurrentDisplayLevel == 0 || g_aToc[i].isDriver == true ) continue;
			sLevelIndexes = g_aToc[i].optionalUpdates; 
			if (sLevelIndexes != "") sCategoryIndexes += sLevelIndexes + ",";
			sNodeClassName = "Level";
			sNodeClassName +=  iCurrentDisplayLevel - 1;
			if (sLevelIndexes == "" ) sNodeClassName += " NoUpdates";
			sImageSrc = "shared/images/toc_collapsed.gif" ;
			bLeafNode = "false" ;
			if (i == iTocLength-1 || (i != iTocLength-1 && iCurrentDisplayLevel >= g_aToc[i+1].displayLevel && g_aToc[i+1].displayLevel != -1 ) || (i != iTocLength-1 && g_aToc[i+1].displayLevel == -1 && iCurrentDisplayLevel >= g_aToc[i+2].displayLevel) ) {
				sImageSrc = "shared/images/toc_endnode.gif" ;
				bLeafNode = "true" ;
			}	
			sTOC += "<LI class='" + sNodeClassName + "' TocIndex ='" + i + "' UpdateArrayIndexes='" + sLevelIndexes + "' ID='" + sId + i + "' LeafNode='" + bLeafNode + "'><span><a ID ='" + sId + i + "' title=\"" + eTOC.L_TocProductAlt_Text + sText + "\" class='sys-link-normal'> " +
					"<img src='" + sImageSrc + "' />" + sText + "</a></span></LI>\n";
					
			if (i == iTocLength-1 ){
				iCurrentDisplayLevel = (iCurrentDisplayLevel != "0") ? iCurrentDisplayLevel - 1 : 0 ;
				for (j=0 ; j < iCurrentDisplayLevel ;j++ ) sTOC += "</UL>\n" ;
			}
			else {		
				iNextDisplayLevel = g_aToc[i+1].displayLevel ;
				//if (iNextDisplayLevel == -1 || (bCritical && iNextDisplayLevel == 0)) iNextDisplayLevel = g_aToc[i+2].displayLevel ;
				if (iNextDisplayLevel == -1 || iNextDisplayLevel == 0){
					 if ("undefined" != typeof(g_aToc[i+2])){
						iNextDisplayLevel = g_aToc[i+2].displayLevel;
					 }
					 if (iNextDisplayLevel == iCurrentDisplayLevel + 1) sTOC += "<UL class='UpdateLevel' ID='U" + sId + i + "'>\n" ;
					 else {
						iLevelDiff = iCurrentDisplayLevel - 1 ;
						if (iLevelDiff > 0 ){
							for (j = 0; j < iLevelDiff; j++) sTOC += "</UL>\n" ;
						} 	 
					 }	
				}
				else { 	 
					if (iNextDisplayLevel == iCurrentDisplayLevel + 1) sTOC += "<UL class='UpdateLevel' ID='U" + sId + i + "'>\n" ;	
					else if ( iNextDisplayLevel !=  iCurrentDisplayLevel) {
						iLevelDiff = iCurrentDisplayLevel - iNextDisplayLevel ; 
						//if ("undefined" != typeof(sSkipUpdateCondition)) iLevelDiff -- ;
						if (iLevelDiff > 0 ){
							for (j = 0; j < iLevelDiff; j++) sTOC += "</UL>\n" ;
						}
						
					}
				}	
			}	
		}
		if (sCategoryIndexes.length > 1 ) sCategoryIndexes = sCategoryIndexes.substr(0,sCategoryIndexes.length -1);
		
		if (sCategoryIndexes == "") sTOC = sTOC.replace("ImgPlaceHolder" , "toc_endnode.gif")
		else sTOC = sTOC.replace("ImgPlaceHolder" , "toc_collapsed.gif");
		sTOC += "</UL>\n" ; 
	}	
	
}

/* return indexes of all the updates in the array for this particular category like "Beta" , "Critical" etc  */
function fnGetCategoryLevelUpdates(sCategoryId,sDeterminingFactor){ 
	var iTocLength, i, sUpdateArrayIndexes, sUpdateIndexes, sSkipUpdateCondition;
	fnTrace("fnGetCategoryLevelUpdates");
	sUpdateArrayIndexes = "" ;
	if (sDeterminingFactor == conSoftware) sSkipUpdateCondition = "g_aToc[i].isDriver == true";
	else if (sDeterminingFactor == conHardware) sSkipUpdateCondition = "g_aToc[i].isDriver == false";
		
	iTocLength = g_aToc.length ;
	for (i = 0; i < iTocLength; i++ ){
		if (g_aToc[i].displayLevel == 0 && !eval(sSkipUpdateCondition)) {
			sUpdateIndexes = eval("g_aToc[i]." + sCategoryId + "Updates"); 
			if (sUpdateIndexes != "")	sUpdateArrayIndexes += sUpdateIndexes + "," ;
		} 
	}	
	return (sUpdateArrayIndexes == "")? sUpdateArrayIndexes: sUpdateArrayIndexes.substr(0,sUpdateArrayIndexes.length -1) ;
	
}

// Gets the non-hidden updates count for a given category\\

function fnGetActualCategoryLevelUpdateCount(sUpdateArrayIndexes){
	var i, aUpdateIndexes, iUpdateIndexesLength, iUpdateCount = 0;
	if(sUpdateArrayIndexes != "" ){		
		aUpdateIndexes = sUpdateArrayIndexes.split(",");
		iUpdateIndexesLength = aUpdateIndexes.length;
		sUpdateArrayIndexes = "";
		for(i = 0; i < iUpdateIndexesLength ; i++){
			if(!g_aUpdate[aUpdateIndexes[i]].IsHidden && !g_UpdateCol(aUpdateIndexes[i]).IsMandatory && (g_aUpdate[aUpdateIndexes[i]].MFDIndex != "-1")){
				iUpdateCount ++ ;
			}
		}		
	}
	
	return iUpdateCount;
}

function fnGetUpdateCount(){
	var iTocLength,iUpdateCount, i;
	fnTrace("fnGetUpdateCount");
	iTocLength = g_aToc.length ;
	iUpdateCount = 0 ;
	for (i = 0; i < iTocLength; i++ ){
		if (g_aToc[i].displayLevel == 0) 	iUpdateCount += g_aToc[i].numCriticalUpdates ; 
	}
	return iUpdateCount ;
}
function fnFindMFD(){
	var iMFDCount = 0;
	var bMFDalreadyadded = false;
	var i,j,oUpdate;
	for(i=0;i<g_UpdateCol.Count;i++){
		g_aUpdate[i] = new String();
		oUpdate = g_UpdateCol(i);
		if(oUpdate.IsInstalled) continue;
		
		g_aUpdate[i].IsCritical = oUpdate.AutoSelectOnWebSites;
		g_aUpdate[i].IsHidden = (oUpdate.IsHidden == true); 
		
		if(oUpdate.InstallationBehavior != null) {
			g_aUpdate[i].RebootRequired = (oUpdate.InstallationBehavior.Impact == REQUIRES_EXCLUSIVE_HANDLING);
			g_aUpdate[i].CanRequestUserInput = oUpdate.InstallationBehavior.CanRequestUserInput;
		} else {
			g_aUpdate[i].RebootRequired = false;
			g_aUpdate[i].CanRequestUserInput = false;
		}	
	
		g_aUpdate[i].MFDIndex = "";						
		if(oUpdate.DownloadContents.Count != 0){
			bMFDalreadyadded = false;
			for(j=0;j<iMFDCount;j++){
				if(g_aMFDURLs[j] == oUpdate.DownloadContents.Item(0).DownloadUrl ) {
					bMFDalreadyadded =true;	
					if(g_aUpdate[g_aMFDURLIndex[j]].MFDIndex == ""){
						g_aUpdate[g_aMFDURLIndex[j]].MFDIndex = i + ",";
					}else{
						g_aUpdate[g_aMFDURLIndex[j]].MFDIndex = g_aUpdate[g_aMFDURLIndex[j]].MFDIndex + i + ",";
					}
					if(g_aUpdate[i].IsCritical) g_aUpdate[g_aMFDURLIndex[j]].IsCritical = true;
					if(g_aUpdate[i].IsHidden) g_aUpdate[g_aMFDURLIndex[j]].IsHidden = true;
					if(g_aUpdate[i].RebootRequired) g_aUpdate[g_aMFDURLIndex[j]].RebootRequired = true;
					break;
				}
			}
			if(!bMFDalreadyadded){
				g_aMFDURLs[iMFDCount] = g_UpdateCol(i).DownloadContents.Item(0).DownloadUrl;
				g_aMFDURLIndex[iMFDCount] = i;
				iMFDCount++;
			}else{
				g_aUpdate[i].MFDIndex = "-1"
				g_aUpdate[i].MFDParent = g_aMFDURLIndex[j]
			}			
		}
	}
}
function fnUpdatePreProcess(){
	var iUpdatesCount, iSPIDCount, sUpdateID, oUpdate;
	var aSPsupersededIds = new Array()
	var aNonSPsupersededIds = new Array()
	var iNonSPsupersededCount = 0;
	var iSPsupersededIdsCount = 0;
	var iNonSPsupersededIdsCount = 0;
	var bUpdateFound = false; // used to see if an updated is superseded by other
	iUpdatesCount = g_RawUpdateCol.Count;
	iSPIDCount = spUpdateIds.length;
	if("undefined" != typeof(conWerMode))  {
		g_UpdateCol = g_RawUpdateCol;
		return;
	}
	g_iSPPresentIndex = -1;
	g_bSPPresent = false;
	if(iUpdatesCount > 0) {		
		// Loop once through the Update Collection
		for (i = 0; i < iUpdatesCount; i++) {
			oUpdate = g_RawUpdateCol(i);
			sUpdateID = oUpdate.Identity.UpdateID.toLowerCase();
			//code to get if SP is present
			if(g_iSPPresentIndex == -1){
				for(j = 0; j < iSPIDCount; j++){
					if(sUpdateID == spUpdateIds[j].toLowerCase() && oUpdate.AutoSelectOnWebSites){
						g_iSPPresentIndex = i;
						g_bSPPresent = true;
						if(g_bSPMode && oUpdate.SupersededUpdateIDs.Count > 0){
							for(k = 0; k < oUpdate.SupersededUpdateIDs.Count; k++){
								aSPsupersededIds[k] = oUpdate.SupersededUpdateIDs(k);
							}
						}						
					}
				}
			}
			if(g_bSPMode && (i != g_iSPPresentIndex) && (oUpdate.SupersededUpdateIDs.Count > 0)) {
				for(l = 0; l < oUpdate.SupersededUpdateIDs.Count; l++){
					aNonSPsupersededIds[iNonSPsupersededCount++] = oUpdate.SupersededUpdateIDs(l);
				}
			}
		}
		if(!g_bSPMode) {
			g_UpdateCol = g_RawUpdateCol;
		} else {
			if(iUpdatesCount > 0) {
				g_UpdateCol = g_oControl.CreateObject("Microsoft.Update.UpdateColl");
				iSPsupersededIdsCount = aSPsupersededIds.length 	
				iNonSPsupersededIdsCount = 	aNonSPsupersededIds.length
				// Loop once through the Update Collection
				for (i = 0; i < iUpdatesCount; i++) {
					bUpdateFound = false;
					oUpdate = g_RawUpdateCol(i);
					sUpdateID = oUpdate.Identity.UpdateID;
					//Get critical updates superseded by the SP
					for(j = 0; j < iSPsupersededIdsCount; j++){
						if(aSPsupersededIds[j] == sUpdateID) {
							bUpdateFound = true;
							if(oUpdate.AutoSelectOnWebSites){
								g_UpdateCol.Add(oUpdate);								
							}
							break;	
						}
					}
					if(!bUpdateFound) {
						for(k = 0; k < iNonSPsupersededIdsCount; k++){
							if(aNonSPsupersededIds[k] == sUpdateID) {
								bUpdateFound = true;
								break;
							}
						}
					}
					if(!bUpdateFound && (i != g_iSPPresentIndex) ) g_UpdateCol.Add(oUpdate);
				}
			}
		}	
	}  else {
		g_UpdateCol = g_RawUpdateCol;
	}
	if(g_bSPMode) g_bSPPresent = false; // if the user chooses to view other updates set the sp variable to false
	
}
/* Build category arrays from the UpdateArray Collection */
function fnBuildCategoryArrays() {
	var s, oRegExp, i, j, k, isDriver = false,ProdLevel = 0;
	var numCompany = 0, iCompany, oSearchResult; 
	var conErrorUnknownCollectionError = 23; 
	var sUpdateType, sCompany, sProductFamily, sProduct;
	var sUpdateTypeOrder, sCompanyOrder, sProductFamilyOrder, sProductOrder, sDriverIndex = "", sDriverCriticalIndex = "";
	var lastUpdateType = "", lastCompany = "", lastProductFamily = "", lastProduct = "";
	var sCategoryID, iCategoryLevel, iCatId, UpdateCatId, oCat, oParent, oSupersededUpdateIds, iSupersededIdCount, m, iSortArrayLength, sUpdateID;
	var aCategories = new Array();
	var aCategoriesSorted = new Array();
	var aSortArray = new Array();
	var iUpdateCategoryCount = g_UpdateCategory.Count;
	g_sMandatoryUpdateIndexes = "";
	fnTrace("fnBuildCategoryArrays");
	// Build an array of category strings to be sorted
	if(iUpdateCategoryCount.Count == 0) {
		fnDisplayErrorPage(conErrorUnknownCollectionError, false); // Error because the category collection cannot be empty
		return false;
	}
	var oCompCat, oFamCat, iCompCatCount, iFamCatCount;
	try {
		for(i = 0, ii = -1; i < iUpdateCategoryCount; i++) {
			oCompCat = g_UpdateCategory(i);
			isDriver = (oCompCat.Name == "Drivers");
			//Ignore non-software categories
			if((oCompCat.Children.Count == 0) || (isDriver)) continue;
			
			if(oCompCat.Children(0).type != "ProductFamily") {
				oFamCat = oCompCat.Children(0);
				iFamCatCount = oFamCat.Children.Count;
				for(k = 0; k < iFamCatCount; k++) {
					aCategories[++ii] = new String();
					aCategories[ii].oCat = oFamCat.Children(k);
				}
			} else {
				iCompCatCount = oCompCat.Children.Count;
				for(j = 0; j < iCompCatCount; j++) {
					oFamCat = oCompCat.Children(j);
					iFamCatCount = oFamCat.Children.Count;
					for(k = 0; k < iFamCatCount; k++) {
						aCategories[++ii] = new String();
						aCategories[ii].oCat = oFamCat.Children(k);
					}
				}
			}
		}
	}
	catch(e) {
		fnDisplayErrorPage(e.number, false);
		return false;
	}

			
	for(j = 0; j <  aCategories.length; j++) {
		oCat = aCategories[j].oCat;
		aCategories[j].Updates = "";
		aCategories[j].CriticalUpdates = "";
		aCategories[j].BetaUpdates = "";
		aCategories[j].isDriver = false;
		aCategories[j].UpdateType = "Software";
		aCategories[j].UpdateTypeOrder = "0000";

		sProduct = sProductFamily = sCompany = "";
		aCategories[j].Product = aCategories[j].Company = "";
		sUpdateType = aCategories[j].UpdateType; 
		sUpdateTypeOrder = aCategories[j].UpdateTypeOrder;
		
		while(oCat != null) {
			switch(oCat.Type) {
				case "Product":
					sProduct = oCat.Name;
					sProductOrder = fnFormatOrder(oCat.Order);
					aCategories[j].Product = sProduct;
					aCategories[j].ProductOrder = sProductOrder;
					sCategoryID = oCat.CategoryID;
					aCategories[j].CategoryID = sCategoryID;					
					break;
				case "ProductFamily":
					sProductFamily = oCat.Name;
					sProductFamilyOrder = fnFormatOrder(oCat.order);
					aCategories[j].ProductFamily = sProductFamily;
					aCategories[j].ProductFamilyOrder = sProductFamilyOrder;
					break;
				case "Company":
					sCompany = oCat.Name;
					sCompanyOrder = fnFormatOrder(oCat.order);
					aCategories[j].Company = sCompany;
					aCategories[j].CompanyOrder = sCompanyOrder;
					break;
				default:
			}
			if(oCat.Parent == null) break;
			oCat = oCat.Parent;
		}
		aCategories[j].oCat = "";
		if(sProductFamily.length == 0) {
			sProductFamily = sProduct;
			sProductFamilyOrder = sProductOrder;
			aCategories[j].ProductFamily = sProduct;
			aCategories[j].ProductFamilyOrder = sProductOrder;
		}

		// Make sure the category has a Company and a Product, otherwise don't show it
		if((sProduct.length > 0) && (sCompany.length > 0)) {		
			aSortArray[j] = (sUpdateTypeOrder + g_sDelim + sUpdateType + g_sDelim +
				sCompanyOrder + g_sDelim + sCompany + g_sDelim +
				sProductFamilyOrder + g_sDelim + sProductFamily + g_sDelim +
				sProductOrder + g_sDelim + sProduct + g_sDelim + 
				sCategoryID + g_sDelim + j).toUpperCase();
		}
	}

	
	// Sort the categories
	aSortArray = aSortArray.sort();
	iSortArrayLength = aSortArray.length;
	for(i = 0; i < iSortArrayLength; i++) {
		j = aSortArray[i].split(g_sDelim)[9];
		aCategoriesSorted[i] = new String();
		aCategoriesSorted[i] = aCategories[j];
	}
	aCategories = aCategoriesSorted;
	
	// Need to remove product families that have only one product and then re-sort...
	lastProductFamily = "";
	var cntProducts = 0;
	var iCategoryLength = aCategories.length;
	for(i = 0; i < iCategoryLength; i++) {
		if(aCategories[i].ProductFamily != lastProductFamily) {
			if(cntProducts == 1) {
				aCategories[i-1].ProductFamily = aCategories[i-1].Product;
			}
			lastProductFamily = aCategories[i].ProductFamily;
			cntProducts = 0;
		}
		cntProducts++;
	}
	if(cntProducts == 1) {
		aCategories[i-1].ProductFamily = aCategories[i-1].Product;
	}
	// Now re-sort
	for(i = 0; i < iCategoryLength; i++) {
		aSortArray[i] = (aCategories[i].UpdateTypeOrder + g_sDelim + aCategories[i].UpdateType + g_sDelim +
			aCategories[i].CompanyOrder + g_sDelim + aCategories[i].Company + g_sDelim +
			aCategories[i].ProductFamilyOrder + g_sDelim + aCategories[i].ProductFamily + g_sDelim +
			aCategories[i].ProductOrder + g_sDelim + aCategories[i].Product + g_sDelim + 
			sCategoryID + g_sDelim + i).toUpperCase();
	}
	aSortArray = aSortArray.sort();
	iSortArrayLength = aSortArray.length;
	aCategoriesSorted = new Array();
	for(i = 0; i < iSortArrayLength; i++) {
		j = aSortArray[i].split(g_sDelim)[9];
		aCategoriesSorted[i] = new String();
		aCategoriesSorted[i] = aCategories[j];
		if(aCategoriesSorted[i].Product == aCategoriesSorted[i].ProductFamily) {
			aCategoriesSorted[i].ProductFamily = "";
		}
	}
	aCategories = aCategoriesSorted;

	aSortArray = null;
	aCategoriesSorted = null;
	
	// Link the non-driver updates to the categories and set up the g_aUpdate array for all
	
	fnTrace("Raw")
	fnUpdatePreProcess();
	fnTrace("Preprocessed")
	
	var iUpdateColCount = g_UpdateCol.Count;
	g_aUpdate.length = 0;
	if(iUpdateColCount > 0) {
	
		g_iSingleExclusive = -1
		g_iSingleEXDownloadPriority = 9;
		g_sExlusiveUpdates = "" ;
		g_sSortExclusive = "";
		var sSortExclusivePerUpdate = "";
		g_iHighestDownloadPriority = 9;
		// Loop once through the Update Collection

		fnFindMFD();
		for (i = 0; i < iUpdateColCount; i++) {
			// Set items in parallel array g_aUpdate[](parallel to the Update collection)
			oUpdate = g_UpdateCol(i);
			sUpdateID = oUpdate.Identity.UpdateID;
			if(oUpdate.IsInstalled) continue;		
			
			// WER scenario\\
			if (!g_bWerModeUpdateFound && 'undefined' != typeof(conWerMode) && conWerMode == iWerQueryModeExpress ){
				if ( sUpdateID == sWerUpdateId ){
					g_bWerModeUpdateFound = true;
					if (g_aUpdate[i].IsHidden){   // if the update is hidden
						g_aQueryString[1] = "IssueType=WUHidden";
						fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
						if (window.confirm(L_ExpressModeHidden_Text)){ //unhide it and add to basket
							g_aUpdate[i].IsHidden = false;
							g_UpdateCol(i).IsHidden = false;
							g_aUpdate[i].IsCritical = true;
						}
					}
					else {
						g_aUpdate[i].IsCritical = true;  //make the update critical if it is already marked critical or not  
					}	
										
				}
				else { // look into the superseded ids
					oSupersededUpdateIds = oUpdate.SupersededUpdateIDs;
					iSupersededIdCount = oSupersededUpdateIds.Count;
					for(m = 0; m < iSupersededIdCount; m++ ) {
						if (oSupersededUpdateIds(m) == sWerUpdateId ){ // WER Update is superseded by some other update applicable now
							g_aQueryString[1] = "IssueType=Superceded";
							fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
							g_bWerModeUpdateFound = true;
							if (g_aUpdate[i].IsHidden){ // if the update is hidden
								g_aQueryString[1] = "IssueType=WUHidden";
								fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
								if (window.confirm(L_ExpressModeHidden_Text)){ //unhide it and add to basket
									g_aUpdate[i].IsHidden = false;
									g_UpdateCol(i).IsHidden = false;
									g_aUpdate[i].IsCritical = true;
								}
							}
							else {
								g_aUpdate[i].IsCritical = true;  //make the update critical if it is already marked critical or not  
							}	
							break;
						}
					}
				}
			} 
			// WER scenario\\
			
			g_aUpdate[i].IsBeta = (oUpdate.IsBeta == true);
			if (oUpdate.IsMandatory) {
				g_bMandatoryUpdatePresent = true;
				g_sMandatoryUpdateIndexes += i + ",";
			}	
			if(oUpdate.Type == conUpdateTypeSoftware)  {
				isDriver = false; 
				g_aUpdate[i].IsDriver = false;
			} else {
				isDriver = true;
				g_aUpdate[i].IsDriver = true;
			}
		
			if((!g_aUpdate[i].IsHidden) && (g_aUpdate[i].MFDIndex != "-1")) {
				g_aUpdate[i].InBasket = g_aUpdate[i].IsCritical;
			} else {
				g_aUpdate[i].InBasket = false;
			}
			g_aUpdate[i].sizeIsTypical = false;
			if(oUpdate.IsDownloaded) {
				g_aUpdate[i].Size = 0;
			} else {
				if((oUpdate.MinDownloadSize != null) && (oUpdate.MinDownloadSize != 0)) {
					g_aUpdate[i].Size = oUpdate.MinDownloadSize;
					g_aUpdate[i].sizeIsTypical = true;
				} else {
					g_aUpdate[i].Size = oUpdate.MaxDownloadSize;
				}
			}
			g_aUpdate[i].DownloadSec = (g_aUpdate[i].Size/g_iDownloadSpeed);
			
			//If it is a psf update then modify the download time for inventory/synthesis
			if((g_aUpdate[i].Size != 0) && oUpdate.DeltaCompressedContentPreferred && oUpdate.DeltaCompressedContentAvailable) {
				g_bPsfStringPresent = false;
				if(fnSearchPsf(oUpdate)) {
					g_aUpdate[i].DownloadSec += ((g_aUpdate[i].Size/1000000) * conSecPerMBPsf) + conBiasPsf;
				}
			}		
			
			//Create a string that can be used to sort by date -- descending
			s = oUpdate.LastDeploymentChangeTime;
			if(s == null || s == "") s = "1980/01/01";
			s = new Date(s);
			g_aUpdate[i].SortDate = (4000 - s.getFullYear()) + "/" + (12 - s.getMonth()) + "/" + (32 - s.getDate());
			
			g_aUpdate[i].DownloadPriority = oUpdate.DownloadPriority;
			if("number" != typeof(g_aUpdate[i].DownloadPriority)) { 
				g_aUpdate[i].DownloadPriority = 1;
			}
			// the site does only care for very high priority updates
			if(g_aUpdate[i].DownloadPriority == 3) {
				g_aUpdate[i].DownloadPriority = 0; 
			}else{
				g_aUpdate[i].DownloadPriority = 1
			}
			if((g_iHighestDownloadPriority > g_aUpdate[i].DownloadPriority) && (i != g_iSPPresentIndex) &&  g_aUpdate[i].IsCritical && !g_aUpdate[i].IsHidden) 
			{	
				g_iHighestDownloadPriority = g_aUpdate[i].DownloadPriority;
			}
			
			if(g_aUpdate[i].Size == 0) {
				g_aUpdate[i].IsDownloaded = true;
			} else {
			g_aUpdate[i].IsDownloaded = false;
			}
			
			//Get CategoryID from the category of type "Product" and match it to a CategoryID in aCategories
			iCatId = -1;
			sCatId = "";
			if(oUpdate.Categories.Count > 0 && !isDriver) {
				for(j = 0; j < oUpdate.Categories.Count; j++) {
					if(oUpdate.Categories(j).Type == "Product") {
						sCatId = oUpdate.Categories(j).CategoryID;
						for(k = 0; k < aCategories.length; k++) {
							if(aCategories[k].CategoryID == sCatId) {
								iCatId = k;
								break;
							}
						}
						break;
					}
				}
			}
			g_aUpdate[i].Company = "";
			g_aUpdate[i].Product = "";
			g_aUpdate[i].ProductFamily = "";
			// If no associated category then the Update will not show up on the site
			if(sCatId != "") {
				g_aUpdate[i].UpdateType = aCategories[iCatId].UpdateType;
				g_aUpdate[i].Company = fnSanitize(aCategories[iCatId].Company);
				g_aUpdate[i].ProductFamily = fnSanitize(aCategories[iCatId].ProductFamily);
				g_aUpdate[i].Product = fnSanitize(aCategories[iCatId].Product);
				g_aUpdate[i].UpdateTypeOrder = aCategories[iCatId].UpdateTypeOrder;
				g_aUpdate[i].CompanyOrder = aCategories[iCatId].CompanyOrder;
				g_aUpdate[i].ProductFamilyOrder = aCategories[iCatId].ProductFamilyOrder;
				g_aUpdate[i].ProductOrder = aCategories[iCatId].ProductOrder;				
				
							
				// This links the Update to its associated category
				if((!oUpdate.IsInstalled) || (oUpdate.IsHidden)) {
					if(g_aUpdate[i].IsBeta) {
						aCategories[iCatId].BetaUpdates  += i + ",";
						g_aUpdate[i].IsCritical = false;
						g_aUpdate[i].InBasket = false;
					}
					else if(g_aUpdate[i].IsCritical) {
						aCategories[iCatId].CriticalUpdates  += i + ",";
					} else {			
						aCategories[iCatId].Updates += i + ",";
					}
				}
			}
			//For drivers, get the Company, Product Family and Product from the Update collection			
			if((isDriver) && (g_aUpdate[i].MFDIndex != "-1")) {
				g_aUpdate[i].UpdateType = "Driver";
				g_aUpdate[i].Company = fnSanitize(oUpdate.DriverManufacturer);
				g_aUpdate[i].ProductFamily = "";
				g_aUpdate[i].Product = fnSanitize(oUpdate.DriverModel);
				g_aUpdate[i].UpdateTypeOrder = "9999";
				g_aUpdate[i].CompanyOrder = "9999";
				g_aUpdate[i].ProductFamilyOrder = "9999";
				g_aUpdate[i].ProductOrder = "9999";

				//Add the driver to appropriate index
				if(g_aUpdate[i].IsCritical) {
					sDriverCriticalIndex += i + ",";
				}else{
					sDriverIndex += i + ",";
				}
				
			}
			if(g_aUpdate[i].RebootRequired && g_aUpdate[i].IsCritical && !g_aUpdate[i].IsHidden && (g_aUpdate[i].MFDIndex != "-1")){
				g_sExlusiveUpdates = g_sExlusiveUpdates + i + ","
				sSortExclusivePerUpdate = g_aUpdate[i].DownloadPriority + g_aUpdate[i].CompanyOrder + g_aUpdate[i].Company.toUpperCase() + g_aUpdate[i].ProductFamilyOrder + g_aUpdate[i].ProductFamily.toUpperCase() + g_aUpdate[i].ProductOrder + g_aUpdate[i].Product.toUpperCase() + g_aUpdate[i].SortDate + i; 
				if((g_iSingleExclusive == -1) || (g_sSortExclusive > sSortExclusivePerUpdate)) {
					g_iSingleExclusive = i;
					g_sSortExclusive = sSortExclusivePerUpdate;
					g_iSingleEXDownloadPriority = g_aUpdate[i].DownloadPriority
				}
			}
		} // End Loop
		//fnFindMFD();
		g_sMandatoryUpdateIndexes = (g_sMandatoryUpdateIndexes == "")? g_sMandatoryUpdateIndexes: g_sMandatoryUpdateIndexes.substr(0,g_sMandatoryUpdateIndexes.length -1) ;
	 }
	 
	 if(g_bExpressScan && g_bSPPresent && g_aUpdate[g_iSPPresentIndex].IsCritical && (g_aUpdate[g_iSPPresentIndex].DownloadPriority <= g_iHighestDownloadPriority)) {
		g_aUpdate[g_iSPPresentIndex].IsHidden = false; 
		g_aUpdate[g_iSPPresentIndex].InBasket = true;
		//added following 2 sections one for if SP is exclusive and one for SP non-exclusive in case of Express install
		if(!g_aUpdate[g_iSPPresentIndex].RebootRequired && (g_aUpdate[g_iSPPresentIndex].DownloadPriority < g_iHighestDownloadPriority)){
			g_iHighestDownloadPriority = g_aUpdate[g_iSPPresentIndex].DownloadPriority;
		}	
		if(g_aUpdate[g_iSPPresentIndex].RebootRequired && (g_aUpdate[g_iSPPresentIndex].DownloadPriority <= g_iSingleEXDownloadPriority)){
			g_iSingleEXDownloadPriority = g_aUpdate[g_iSPPresentIndex].DownloadPriority;
			g_iSingleExclusive = g_iSPPresentIndex;
		}		
	}
	
	 // sets updates in the basket depending on exclusivity and highest priority
	 if(iUpdateColCount > 0) {
		if(g_iSingleExclusive > -1) {
			if( g_iHighestDownloadPriority >= g_iSingleEXDownloadPriority ){
				for (i = 0; i < iUpdateColCount; i++) {
					g_aUpdate[i].InBasket = false;
				}
				g_aUpdate[g_iSingleExclusive].InBasket = true;
				if(g_aUpdate[g_iSingleExclusive].MFDIndex == "-1") g_aUpdate[g_aUpdate[g_iSingleExclusive].MFDParent].InBasket = true; 
			}else{
				aExclusiveUpdates = g_sExlusiveUpdates.split(",")
				for (i = 0; i < aExclusiveUpdates.length - 1; i++){
					if(g_aUpdate[aExclusiveUpdates[i]].MFDIndex == "-1") g_aUpdate[g_aUpdate[aExclusiveUpdates[i]].MFDParent].InBasket = false; 
					g_aUpdate[aExclusiveUpdates[i]].InBasket = false;
				} 
			}
			
			if ( g_bWerModeUpdateFound && 'undefined' != typeof(conWerMode) ){ //PingBack if WER update is found but a critical exclusive update is also applicable in which case only that update would be shown.
				g_aQueryString[1] = "IssueType=WUCritExNeeded"; 
				fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
			}
		}
	}
	
	// WER Scenario \\
	if (!g_bWerModeUpdateFound && 'undefined' != typeof(conWerMode) && conWerMode == iWerQueryModeExpress ){ // if the WER update id is not found in the list of applicable updates on first scan
		try {
			oSearchResult = g_oUpdateSearcher.Search("IsInstalled=1"); // Synchronous search for installed updates
			if (oSearchResult.ResultCode == 2 ){
				fnCheckWerUpdateInstalled(oSearchResult.Updates);
			}
		}	
		catch(e){
			fnDisplayErrorPage(e.number, false);
			return false;
		}
	}
	// WER Scenario \\
	 
	// Build the Category array
	g_aCat.length = 0;
	lastProductFamily = "";
	lastCompany = "";
	lastProduct = "";
	numCompany = 0;
	for(i = 0, j = 0; i < aCategories.length; i++) {

		if(aCategories[i].UpdateType != lastUpdateType) {
			lastUpdateType = fnSanitize(aCategories[i].UpdateType);
			isDriver = aCategories[i].isDriver;
			g_aCat[j] = new String();
			g_aCat[j].level = 0;
			g_aCat[j].displayLevel = 0;
			g_aCat[j].text = lastUpdateType;
			g_aCat[j].resultHeaderText = "";
			g_aCat[j].isDriver = false;
			g_aCat[j].optionalUpdates = "";
			g_aCat[j].criticalUpdates = ""
			g_aCat[j++].betaUpdates = "";
		}

		if(aCategories[i].Company != lastCompany) {
			numCompany++;
			iCompany = j;
			lastCompany = fnSanitize(aCategories[i].Company);
			g_aCat[j] = new String();
			g_aCat[j].level = 1;
			g_aCat[j].displayLevel = 1;
			g_aCat[j].text = lastCompany;
			g_aCat[j].resultHeaderText = lastCompany;
			g_aCat[j].isDriver = false;
			g_aCat[j].optionalUpdates = "";
			g_aCat[j].criticalUpdates = ""
			g_aCat[j++].betaUpdates = "";
		}
		if(aCategories[i].ProductFamily != lastProductFamily) {
			lastProductFamily = fnSanitize(aCategories[i].ProductFamily);
			if(lastProductFamily.length > 0) {
				g_aCat[j] = new String();
				g_aCat[j].level = 2;
				g_aCat[j].displayLevel = 2;
				g_aCat[j].text = lastProductFamily;
				g_aCat[j].resultHeaderText = lastCompany + " - " + lastProductFamily
				g_aCat[j].isDriver = false;
				g_aCat[j].optionalUpdates = "";
				g_aCat[j].criticalUpdates = ""
				g_aCat[j++].betaUpdates = "";
			}
		}

		if(lastProductFamily.length == 0) {
			ProdLevel = 2;
		} else {
			ProdLevel = 3;
		}
		g_aCat[j] = new String();
		g_aCat[j].level = 3;
		g_aCat[j].displayLevel = ProdLevel;
		g_aCat[j].text = fnSanitize(aCategories[i].Product);
		g_aCat[j].resultHeaderText = lastCompany + " - ";
		if(lastProductFamily.length > 0) {
			g_aCat[j].resultHeaderText += lastProductFamily + " - ";
		}
		g_aCat[j].resultHeaderText += fnSanitize(aCategories[i].Product);
		g_aCat[j].isDriver = isDriver;
		g_aCat[j].optionalUpdates = aCategories[i].Updates;
		g_aCat[j].criticalUpdates = aCategories[i].CriticalUpdates;
		g_aCat[j++].betaUpdates = aCategories[i].BetaUpdates;

		//Traverse backwards through g_aCat until reaching level 0
		//Add these updates to any level which is less than the current level
		//But don't add it to two rows at the same level...
		for(k = j - 2; k > -1; k--) {
			if(g_aCat[k].level < ProdLevel) {
				g_aCat[k].optionalUpdates += aCategories[i].Updates;
				g_aCat[k].criticalUpdates += aCategories[i].CriticalUpdates;
				g_aCat[k].betaUpdates += aCategories[i].BetaUpdates;
				ProdLevel--;
			}
			if(g_aCat[k].level == 0) {
				break;
			}
		}
	}
	//If only one company, don't show it and promote items under it
	if(numCompany == 1) {
		g_aCat[iCompany].displayLevel = -1;
		for(k = iCompany + 1; k < g_aCat.length; k++) {
			if(g_aCat[k].displayLevel == 0) break;
			g_aCat[k].displayLevel--;
		}
	}
	
	//Remove trailing comma and calculate the number of updates of each type
	for(i = 0; i < g_aCat.length; i++) {
		s = g_aCat[i].optionalUpdates;
		if(s.length > 0) {
			s = s.substring(0, s.length - 1);
			g_aCat[i].optionalUpdates = s;
			g_aCat[i].numOptionalUpdates = s.split(",").length;
		} else {
			g_aCat[i].numOptionalUpdates = 0;
		}
		s = g_aCat[i].criticalUpdates;
		if(s.length > 0) {
			s = s.substring(0, s.length - 1);
			g_aCat[i].criticalUpdates = s;
			g_aCat[i].numCriticalUpdates = s.split(",").length;
		} else {
			g_aCat[i].numCriticalUpdates = 0;
		}
		s = g_aCat[i].betaUpdates;
		if(s.length > 0) {
			s = s.substring(0, s.length - 1);
			g_aCat[i].betaUpdates = s;
			g_aCat[i].numBetalUpdates = s.split(",").length;
		} else {
			g_aCat[i].numBetaUpdates = 0;
		}
	}
	//Add the driver node
	if(sDriverIndex.length > 0) {
		j = g_aCat.length;
		g_aCat[j] = new String;
		sDriverIndex = sDriverIndex.substring(0, sDriverIndex.length - 1);
		g_aCat[j].optionalUpdates = sDriverIndex;
		g_aCat[j].numOptionalUpdates = sDriverIndex.split(",").length;
		if(sDriverCriticalIndex.length > 0) {
			sDriverCriticalIndex = sDriverCriticalIndex.substring(0, sDriverCriticalIndex.length - 1);
			g_aCat[j].criticalUpdates = sDriverCriticalIndex;
			g_aCat[j].numCriticalUpdates = sDriverCriticalIndex.split(",").length;
			
		}  else {
			g_aCat[j].criticalUpdates = "";
			g_aCat[j].numCriticalUpdates = 0;
		}
		g_aCat[j].level = 0;
		g_aCat[j].displayLevel = 0;
		g_aCat[j].text = "Hardware";
		g_aCat[j].resultHeaderText = "";
		g_aCat[j].isDriver = true;
		g_aCat[j].betaUpdates = "";
		g_aCat[j].numBetaUpdates = 0;
	}
	
	//Delete TOC entries that have no optional updates
	for(i = 0; i < g_aCat.length ; i++) { 
		if(g_aCat[i].numOptionalUpdates == 0 && g_aCat[i].numCriticalUpdates == 0 ) {
			g_aCat[i].displayLevel = -1;
		}
	}
	
	//Build the TOC array, remove everything with displayLevel of -1
	g_aToc.length = 0;
	for(i = 0, j = 0; i < g_aCat.length; i++) {
		if(g_aCat[i].displayLevel != -1) {
			g_aToc[j++] = g_aCat[i];
		}
	}
	return true;
}

//Looks for the string "windowspatch" in the HandlerID string of the specified update 
//and all bundled updates
function fnSearchPsf(oUpdate) {	
	var iBundledUpdatesCount, i;	
	//check oUpdate for windowspatch
	try {
		if((oUpdate.HandlerID.toLowerCase().indexOf(g_sPsfString) != -1)) {
			return true;
		} else {
			iBundledUpdatesCount = oUpdate.BundledUpdates.Count;
			if(iBundledUpdatesCount > 0) {
				//loop recursively through bundles looking for windows patch. 
				//Return true on first found
				for(i = 0; i < iBundledUpdatesCount; i++) {
					if(fnSearchPsf(oUpdate.BundledUpdates.Item(i))) {
						g_bPsfStringPresent = true;
						break;
					}
				}
			}
		}
		return g_bPsfStringPresent;
	} catch(e) {
		return false;
	}
}

// checks if the WER update is already installed on the client machine
function fnCheckWerUpdateInstalled(oUpdateCol){
	var iUpdateColCount, i, oUpdate, sUpdateID, oSupersededUpdateIds, iSupersededIdCount, m;
	fnTrace("fnCheckWerUpdateInstalled");
	try {
		iUpdateColCount = oUpdateCol.Count;
		if(iUpdateColCount > 0) {
			for (i = 0; i < iUpdateColCount; i++) {
				oUpdate = oUpdateCol(i);
				sUpdateID = oUpdate.Identity.UpdateID;
				if ( sUpdateID == sWerUpdateId ){
					g_bWerModeUpdateInstalled = true;
					break;
				}
				else { // look into the superseded ids
					oSupersededUpdateIds = oUpdate.SupersededUpdateIDs;
					iSupersededIdCount = oSupersededUpdateIds.Count;
					for(m = 0; m < iSupersededIdCount; m++ ) {
						if (oSupersededUpdateIds(m) == sWerUpdateId ){ // WER Update is superseded by some other update installed now
							g_bWerModeUpdateInstalled = true;
							break;
						}
					}
				}
					
			}
			if (g_bWerModeUpdateInstalled){ // WER update is already installed on the client machine
				alert(L_WerUpdateInstalled_Text);
				g_aQueryString[1] = "IssueType=AlreadyInstalled";
				fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409")
			}
			else { // WER update unknown/removed/doesn't apply
				g_aQueryString[1] = "IssueType=NotApplicable";
				fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409")
			}
		}
		else { // WER update unknown/removed/doesn't apply
			aQueryString[1] = "IssueType=NotApplicable";
			fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409")
		}
	}catch(e){
			fnDisplayErrorPage(e.number, false);
			return false;
	}
}

// this function adds "0" in the start of "sOrder" to make it 4 digits long
function fnFormatOrder(sOrder) {  
	var sOrderLength,iZeroCount,i;
	if(sOrder == -1) sOrder = "9999";
	sOrderLength = sOrder.toString().length;
	if(sOrderLength == 0) {
		return "9999";
	} else {
		iZeroCount = 4 - sOrderLength;
		for(i = 1; i <= iZeroCount; i++) sOrder = "0" + sOrder;
		return sOrder;
	}
}

