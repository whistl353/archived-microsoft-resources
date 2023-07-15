//Copyright (c) Microsoft Corporation.  All rights reserved.
var g_iPage, g_iSubPage;

function fnInit(iPage, iSubPage){ //done
	if("function" == typeof(parent.fnTrace)) parent.fnTrace("fnInit");
	if(!parent.conDevServer){
		document.ondragstart = new Function("return false;");
		//document.oncontextmenu = new Function("return false;");
	}

	//if(!parent.g_bControlInitialized) return false;
	try {
		if(parent.document.readyState != "complete" || parent.eTOC.document.readyState != "complete"){
			window.setTimeout("fnInit(" + iPage + ", " + iSubPage + ");", 100);
			return false;
		}
	}
	catch (e) {}	

	g_iPage = iPage;
	g_iSubPage = iSubPage;
	
	if(self != top){
		if("function" == typeof(parent.eTOC.fnSyncTOC)) parent.eTOC.fnSyncTOC(self.location.href, g_iPage, g_iSubPage);
		if("function" == typeof(fnLoadImages)) fnLoadImages();
	}
	//if(parent.conBrowserVersion < 5.5) document.styleSheets[0].addRule("button", "width: auto !important;height: auto !important;");
	window.setTimeout("fnDoReporting('" + window.location.pathname + "')",1000);
	if (g_iSubPage == parent.conSplashWelcome && g_iPage == parent.conSplashPage) {
		 document.all("newsframe").src = "news.aspx?ln=" + parent.conLangCode ; 
	}
}
 
function fnInitSplashPage(iPage, iSubPage){ 
	var iInitReturn;
	parent.fnTrace("fnInitSplashPage");
	// Make sure default and toc frames are loaded.
	if(self == top || iSubPage == parent.conSplashCheckingControl) {
		if(parent.document.readyState != "complete" || parent.eTOC.document.readyState != "complete") {
			window.setTimeout("fnInitSplashPage(" + iPage + ", " + iSubPage + ");", 100);
			return false;
		}
	}
	switch(iSubPage) {
		case parent.conSplashCheckingControl: //0
			iInitReturn = parent.fnInitializeControl();
			break;
		case parent.conSplashWelcome: //3
			audivDontNotify.style.display = "none";
			audivNotifyButDontDownlaod.style.display = "none";
			audivDownloadAndNotify.style.display = "none";
			audivScheduledOK.style.display = "none";
			if(parent.g_iAUConfiguration == parent.conAUDontNotify) { 
				audivDontNotify.style.display = "block";
			} else if(parent.g_iAUConfiguration == parent.conAUNotifyButDontDownload) {
				audivNotifyButDontDownlaod.style.display = "block";
			} else if(parent.g_iAUConfiguration == parent.conAUDownloadAndNotify) {
				audivDownloadAndNotify.style.display = "block";
			} else if(parent.g_iAUConfiguration == parent.conAUScheduledOK) {
				audivScheduledOK.style.display = "block";
			}
			aExpress.focus();
			break;	
		case parent.conSplashMandatoryUpdates: //8
			fnGetMandatoryUpdates();
			break;	
	}
	
	fnInit(iPage, iSubPage);
	return true;	
}

function fnGetMandatoryUpdates(){
	parent.fnTrace("fnGetMandatoryUpdates");
	var aMandatoryUpdateIndexes, iMandatoryUpdateCount,i ,oMandatoryUpdate, sTitle, oSpan, sDescription, sSizeText, iSize, sHtml, oSize, iTotalSize, sTotalSizeText;
	sHtml = "";
	iTotalSize = 0;
	iTotalSec = 0;
	if(sMandatoryUpdateIndexes != "") {
		aMandatoryUpdateIndexes = sMandatoryUpdateIndexes.split(",");	
		iMandatoryUpdateCount = aMandatoryUpdateIndexes.length;
		for(i = 0; i < iMandatoryUpdateCount; i++) {			
			oMandatoryUpdate = parent.g_UpdateCol(aMandatoryUpdateIndexes[i]);
			sTitle = parent.fnSanitize(oMandatoryUpdate.Title);
			sDescription = parent.fnSanitize(oMandatoryUpdate.Description);
			oSize = parent.g_aUpdate[aMandatoryUpdateIndexes[i]].Size;
			if (oSize == null) {
				oSize = "1000";
			}
			iTotalSize += oSize;
			iTotalSec += parent.g_aUpdate[aMandatoryUpdateIndexes[i]].DownloadSec;
			iSize = parseInt(oSize);
			sSizeText = parent.fnGetDownloadSizeText(iSize,parent.g_aUpdate[aMandatoryUpdateIndexes[i]].DownloadSec);
			if(iSize == 0) {
				sSizeText += "&nbsp;<img align='middle' src='shared/images/info_16x.gif' title='" + parent.L_RListInfoGifAlt_Text + "'>";
			}
			sHtml += "<div>" + sTitle + "<br>" + sSizeText + "<br />" + sDescription + "</div><br /><br />"
		}
		iTotalSize = parseInt(iTotalSize);
		sTotalSizeText = parent.fnGetDownloadSizeText(iTotalSize,iTotalSec);	
		document.all("eMandatoryUpdates").innerHTML += sHtml;
		oSpan = document.createElement("span");
		eMandatoryUpdates.appendChild(oSpan);
		oSpan.innerHTML = "Total:" + sTotalSizeText; 		
	}			
}
function fnLoadImages(){  
	var vImages, iImagesLen, sSource, i;
	parent.fnTrace("fnLoadImages");
	vImages = document.images;
	iImagesLen = vImages.length;
	for(i = 0; i < iImagesLen; i++){
		sSource = vImages[i].source;
		if(sSource != null) vImages[i].src = sSource;
	}
} 

function fnHeaderClicked(){
	if (eMandatoryUpdates.style.display == "block"){
		eHeader.className = "sys-header";
		eHeader.style.color = "#C7D8FA";
		eMandatoryUpdates.style.display = "none";
		imgDetailsHeader.src = "shared/images/icon.plus.gif";
	}
	else {
		eHeader.className = "sys-header-selected";
		eHeader.style.color = "#FFFFFF";
		eMandatoryUpdates.style.display = "block";
		imgDetailsHeader.src = "shared/images/icon.minus.gif"; 
	}
}

function fnWriteInstallResult(iSubPage) {
	parent.fnTrace("fnWriteInstallResult");
	window.setTimeout("fnDoReporting('" + window.location.pathname + "')",1000);
	var sSuccessfulUpdatesHtml = "" ,sFailedUpdatesHtml = "", sDeclinedUpdatesHtml = "";
	var aSuccessfulUpdates, aFailedUpdates;
	var bLowDiskSpace = false;
	
	if (iSubPage == parent.conInstallStatusRegular ){
		aSuccessfulUpdates = parent.g_aSuccessfulUpdates;
		aFailedUpdates = parent.g_aFailedUpdates;
	}
	else { // Install Status Page for Mandatory Updates
		aSuccessfulUpdates = parent.g_aSuccessfulMandatoryUpdates;
		aFailedUpdates = parent.g_aFailedMandatoryUpdates;
	}
	
	try {
		var iSuccessfulUpdatesCount = aSuccessfulUpdates.length;
		for(i = 0; i < iSuccessfulUpdatesCount; i++) {
			sSuccessfulUpdatesHtml += "<li>" + aSuccessfulUpdates[i].Title;			
			sSuccessfulUpdatesHtml += "</li>";
		}
		if(sSuccessfulUpdatesHtml != "") {
			SuccessfulUpdatesList.innerHTML = sSuccessfulUpdatesHtml;
			Successfulupdates.style.display = "block";
		}
	} catch(e) {}
			
	try {
		var iFailedUpdatesCount = aFailedUpdates.length;
		for(i = 0; i < iFailedUpdatesCount; i++) {
			if (aFailedUpdates[i].ErrorCode != '-2145124317') {
				sFailedUpdatesHtml += "<li>" + aFailedUpdates[i].Title + "</li>";
			}	
			else {
				sDeclinedUpdatesHtml += "<li>" + aFailedUpdates[i].Title + "</li>";
			}
			if((aFailedUpdates[i].ErrorCode == -2147024784) || (aFailedUpdates[i].ErrorCode == -2146963453) ||(aFailedUpdates[i].ErrorCode == -2146963413) ) bLowDiskSpace = true;
		}
		if (sFailedUpdatesHtml != "") {
			FailedUpdatesList.innerHTML = sFailedUpdatesHtml;
			Failedupdates.style.display = "block";
		}
		if (sDeclinedUpdatesHtml != "") {
			DeclinedUpdatesList.innerHTML = sDeclinedUpdatesHtml;
			Declinedupdates.style.display = "block";
		}
		if(bLowDiskSpace) LowDiskSpaceInstructions.style.display = "block";
	} catch(e) {}
	
	if (iSubPage == parent.conInstallStatusRegular ){
		try {
			fnCheckRemainingUpdates();
			if (!parent.g_bIsRebootRequired) {
				ScanButton.style.display = "block";
				eScan.href = (parent.g_bExpressScan)? "javascript:parent.fnExpressScan();" : "javascript:parent.fnScan();" ;	
			} else {
				RebootInstructions.style.display = "block";
			}			
		} catch(e) {

		}	
		parent.fnPostInstall();
	}
	else {  
		if (parent.g_bIsRebootRequired) RebootInstructions.style.display = "block";
	}	
}
	
function fnCheckRemainingUpdates() {
	var sRemainingUpdatesHtml = "";
	try {
		var iRemainingUpdatesCount = parent.g_aRemainingUpdates.length;
		for (i = 0; i < iRemainingUpdatesCount; i++) {
			sRemainingUpdatesHtml += "<li>" + parent.g_aRemainingUpdates[i].Title + "</li>";
		}
		if (sRemainingUpdatesHtml != "") {
			RemainingUpdatesList.innerHTML = sRemainingUpdatesHtml ;
			RemainingUpdates.style.display = "block";
		}
	} catch(e) {
		return false;
	}
}
function fnDisplayWelcomePage(){//function used by IE5 to display welcome page
	parent.g_bIE5page=true;
	parent.fnDisplaySplashPage(parent.conSplashWelcome);
}
function fnDisplayWelcomePage2003DC(){//function used by DataCenter 2003 to display welcome page
	parent.g_b2003DC=true;
	parent.fnDisplaySplashPage(parent.conSplashWelcome);
}
