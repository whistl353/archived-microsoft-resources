//Copyright (c) Microsoft Corporation.  All rights reserved.
/* constants */
var conErrorPage = 0; 
var conSplashPage = 1;
var conResultsPage = 2;
var conThanksPage = 3;
var conHistoryPage = 4;
var conAboutPage = 5;
var conSupportPage = 6;
var conStatusPage = 7;
var conDownloadPage = 10;
var conPersonalizationPage = 13;
var conAdministratorsPage = 14;

var iWerQueryModeExpress = 1 ;              //specific update + all critical updates
var iWerQueryModeHardwareAll = 2 ;		   // ALL optional hardware updates	
var iWerQueryModeExpressAll = 3 ;           // All critical updates

var conErrorNoScripting = 1;
var conErrorNotAdmin = 2;
var conErrorDisabled = 3;
var conErrorControlFailed = 4;
var conErrorControlUpdateFailed = 5;
var conErrorWin2KLessThanSP3 = 6;
var conErrorRebootRequired = 7;
var conErrorSearchTimeout = 9;
var conErrorServiceDisabled = 24;

var conResultsCritical = 0;
var conResultsProduct = 1;
var conResultsBasket = 2;
var conResultsDrivers = 3;
var conResultsBeta = 4;
var conResultsHidden = 5;
var conExpressInstall = 6;

var conSplashCheckingControl = 0;
var conSplashOldControl = 2;
var conSplashWelcome = 3;
var conSplashScanning = 4;
var conSplashInstallingWait = 5;
var conSplashScanningDone = 6;
var conSplashUpdatingControl = 7;
var conSplashMandatoryUpdates = 8;
var conSplashIE5 = 9;
var conSplash2003DC = 10;

var conServicePack = 9;

var conInstallStatusRegular = 0;
var conInstallStatusMandatory = 1;
 
var conAUControlledByPolicy = 0;
var conAUDontNotify = 1;
var conAUNotifyButDontDownload = 2;
var conAUDownloadAndNotify = 3;
var conAUScheduledOK = 4; 
 
var conCategorySoftware = "SOFTWARE";
var conCategoryHardware = "HARDWARE";
var conCategoryCritical = "critical";
var conCategoryBeta = "beta";

var conByte = 8;
var conKB = 1024; 
var conMB = 1048576;

var conHideable = 0;
var conCritical = 1;
var conSoftware = 2;
var conHardware = 3;

/* WebCom API GetUserType */
var conNotAdmin = 0;
var conAdmin = 2;
/* WebCom API GetUserType */

var IU_UPDATE_NEEDED = 1;
var S_OK = 0;
var ERROR_INVALID_PROPERTY = -2146828218;
var VER_SUITE_DATACENTER = 0x00000080;
var VER_NT_SERVER = 0x00000003;
var REQUIRES_EXCLUSIVE_HANDLING	= 2;
var PROXY_ERROR_CODE = -2145107941;
var ERROR_INVALID_PID = -2145124311
var conReadyStateComplete = 4;
/* constants */

/* global variables */
var g_oControl, g_oPopup, g_oAutomaticUpdates, g_bIsRebootRequired;
var g_iConsumerBasketCount, g_iConsumerBasketSize, g_iDownloadSpeed = 0;
var g_bPosted, g_bScanning, g_bDetectedItems, g_bPersonalizing, g_bAutoUpdateEnabled; 
var g_UpdateCategory, g_UpdateCol, g_InstallCol, g_oInstallationResult, g_sCpuClass, g_RawUpdateCol;
var g_bControlInitialized = false, g_bControlReady = false, g_oControlReadyTimer;
var g_bExpressScan, g_bInvalidPID = false;
var g_iAUConfiguration = -1;
var g_aUpdate = new Array(); // This array is parallel to the Update collection
var g_aToc = new Array();    // This array contains data for the TOC
var g_bWerModeUpdateFound = false; //variable which is set to true if WER update id is found is list of applicable updates after scan.
var g_bWerModeUpdateInstalled = false; //variable which is set to true if WER update id is found is list of installed updates on the client.
var g_aQueryString = new Array(); //used for WER pingback
var g_bIE5page=false;
var g_b2003DC = false;
var g_iWuwebTimeoutCount, g_iWuwebTimeoutMax = 120;
var g_iOSMajor, g_iOSMinor, g_iOSSPMajor;
var g_sOSBuildNumber, g_iOSSPMinor;
/* global variables */
var g_iProgressBarCount =0;
var g_oInterval = "";
var g_iProgresspixles = -18;
var g_sProgressBar,g_iProgressCount
var g_iOSServicePackBuildNumber,g_iSuiteMask,g_iProductType,g_sClientVersion;
var g_bSurveyAttempted = false;



function window.onload(){
	fnInit();
	window.setTimeout('fnDoReporting();',2000);
}

/*Initializes the global variables */
function fnInit(){ 
	var sCurrentURL, sWelcomePage, sErrorPage;
	fnTrace("fnInit");
	if("undefined" == typeof(conQueryString) || "object" != typeof(eContent) || "object" != typeof(eTOC) || "function" != typeof(eTOC.fnDisableTOC)){
		window.setTimeout("fnInit();", 0);
		return false;
	}
	if ('undefined' != typeof(conWerMode)){ // WER Scenario
		
		g_aQueryString[0] = "&BucketID=" + ( ('undefined' != typeof(sWerBucketId))? sWerBucketId : ""  ) + "&SID=" + ( ('undefined' != typeof(sSID))? sSID : ""  ) ;
	}	
	g_bPosted = false;
	g_bScanning = false;
	g_bPersonalizing = false;
	g_bDetectedItems = false;
	g_bAutoUpdateEnabled = false;
	g_sCpuClass = window.navigator.cpuClass;
	g_iDownloadSpeed = 0;
	g_iConsumerBasketCount = 0;
	g_iConsumerBasketSize = 0;
	eTOC.fnInitTOC();
	sCurrentURL = eContent.location.href.toLowerCase();
	sWelcomePage = window.location.protocol + "//" + window.location.host + conConsumerURL + "splash.aspx?page=" + conSplashCheckingControl + "&" + conQueryString;
	sErrorPage = window.location.protocol + "//" + window.location.host + conConsumerURL + "errorinformation.aspx?error=" + conErrorControlUpdateFailed + "&" + conQueryString;

	if(window.location.search.indexOf("page=") == -1 && !g_bControlInitialized && sCurrentURL != sWelcomePage && sCurrentURL != sErrorPage){
		fnDisplaySplashPage(conSplashCheckingControl);
	}
}

/* control init */
function fnInitializeControl() { 
	var dDate, sCodeBase, iInitReturn, aControlVersion, s;
	fnTrace("fnInitializeControl");
	try { 
		if(g_oControl == null) { 
			dDate = new Date();
			s = "";
			if(g_sControlVersion != "TOK_CONTROLVERSION") {  
				if(g_sControlVersion.indexOf(".") != -1) {
					aControlVersion = g_sControlVersion.split(".");
					if(aControlVersion.length > 0) {
						s = "5,4," + aControlVersion[0] + "," + aControlVersion[1];
						g_sControlVersion = s;
					}
				}
			}
			if(s.length == 0) {
				g_sControlVersion = "5,4,3790,1830";          
			}
			//WU Control
			sCodeBase = "V5Controls/" + "en" + (navigator.cpuClass == "x86" ? "/x86/" : "/ia64/") + "client/wuweb_site.cab?" + dDate.getTime() + "#version=" + g_sControlVersion;
			SusWebCtl.outerHTML = "<object id='SusWebCtl' classid='CLSID:6414512B-B978-451D-A0D8-FCFDF33E833C' codebase='" + sCodeBase + "'></object>";

			//MU Control
			//sCodeBase = "V5Controls/" + "en" + (navigator.cpuClass == "x86" ? "/x86/" : "/ia64/") + "client/muweb_site.cab?" + dDate.getTime() + "#version=" + g_sControlVersion;
			//SusWebCtl.outerHTML = "<object id='SusWebCtl' classid='CLSID:6e32070a-766d-4ee6-879c-dc1fa91d2fc3' codebase='" + sCodeBase + "'></object>";
			g_oControl = SusWebCtl;

		}
	} catch(e) { 
		if(e.number == ERROR_INVALID_PROPERTY) {
			fnDisplayErrorPage(conErrorNotAdmin, true);
		} else {
			fnDisplayErrorPage(e.number, true);
		}
		return;
	}
	g_iWuwebTimeoutCount = 0;
	g_oControlReadyTimer = window.setTimeout("fnControlReadyCheck();", 10);
	return;
}

/* Checks to see if the control is ready to use */
function fnControlReadyCheck() {
	var iUserType, bIsAdmin; 
	fnTrace("fnControlReadyCheck");
	window.clearTimeout(g_oControlReadyTimer);
	try {
		iUserType = g_oControl.GetUserType();
		bIsAdmin = (iUserType == conAdmin);
		g_bControlReady = true;
	}
	catch(e) {
		if(e.number != -2146827850) { // 0x800A01B6
			 fnDisplayErrorPage(e.number, true);
			 return;
		}
	}
	
	if(!g_bControlReady) {
		if(g_iWuwebTimeoutCount++ < g_iWuwebTimeoutMax) {
			g_oControlReadyTimer = window.setTimeout("fnControlReadyCheck();", 1000);
		} else {
			fnControlFailure();
		}
	} else {
		if(!bIsAdmin) {
			fnDisplayErrorPage(conErrorNotAdmin, true);
		} else {
			fnTestControl();
		}
	}
	return;
}

/* Handles control instantiation timeout */
function fnControlFailure() {
	if(!g_bControlReady) {
		fnTrace("fnControlFailure");
		fnDisplayErrorPage(conErrorControlFailed, true);
	}
}

/* Tests the control by checking its property */
function fnTestControl(){  
	var WUDisabled, iAULevel, oAutomaticUpdates, bIsDatacenter;
	fnTrace("fnTestControl");	
	try {
		WUDisabled = g_oControl.IsWindowsUpdateDisabled;
		if (WUDisabled == "undefined") {
			fnDisplayErrorPage(conErrorControlFailed, true);
			return false;
		}

		if (WUDisabled) {
			if ('undefined' != typeof(conWerMode)){
				g_aQueryString[1] = "IssueType=WUNotLegal";
				fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409"); 
			}	
			fnDisplayErrorPage(conErrorDisabled, true);
			return false;
		}
		
		// if platform is < win2k SP3 , redirect to V4 site
		g_iOSMajor = g_oControl.GetOSVersionInfo(0,1);
		g_iOSMinor =  g_oControl.GetOSVersionInfo(1,1);
		g_iOSSPMajor =	g_oControl.GetOSVersionInfo(4,1);
		g_sOSBuildNumber = g_oControl.GetOSVersionInfo(2,1);
		g_iOSSPMinor = g_oControl.GetOSVersionInfo(5,1);
		try{
		g_iOSServicePackBuildNumber = g_oControl.GetOSVersionInfo(9,1); // throws an exception on win2k
		}
		catch(e) {}
		g_iSuiteMask = g_oControl.GetOSVersionInfo(6,1); 
		g_iProductType = g_oControl.GetOSVersionInfo(7,1);
		g_sClientVersion =  g_oControl.GetOSVersionInfo(10,1);
				
		if (g_iOSMajor == 5 && g_iOSMinor == 0 && g_iOSSPMajor < 3 ){ 
			fnDisplayErrorPage(conErrorWin2KLessThanSP3, true);
			return false;
		}
		
		// if Win2K, and Datacenter, display thanks page
		bIsDataCenter = ((g_oControl.GetOSVersionInfo(6,1) & VER_SUITE_DATACENTER) > 0);
		if(bIsDataCenter && (g_iOSMajor == 5) && (g_iOSMinor == 0)) {	
			window.location.replace("thanks.aspx?ThanksPage=4");
			return false;
		}
	} catch(e) {
		if(e.number == ERROR_INVALID_PROPERTY){
			if ('undefined' != typeof(conWerMode)){
				g_aQueryString[1] = "IssueType=WUNonAdmin";
				fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
			}	
			fnDisplayErrorPage(conErrorNotAdmin, true);
		}else{
			fnDisplayErrorPage(e.number, true);
		}
		return false;
	}

	g_bControlInitialized = true;
	
	fnInitializeSite(false);
	return true;
	
}

function fnInitializeSite(bControlCheckedforUpdate){  

	var bIsDataCenter, bAUEnabled, oComputerSettings, sOemUrl;
	fnTrace("fnInitializeSite");
	try {
		g_bIsRebootRequired = g_oControl.IsRebootRequired ;
		g_bOSIsServer=(g_oControl.GetOSVersionInfo(7,1) == VER_NT_SERVER);
	}
	catch(e) {
		fnDisplayErrorPage(e.number, true);
		return false;
	}	

	if (g_bIsRebootRequired) {
		if ('undefined' != typeof(conWerMode)){
			g_aQueryString[1] = "IssueType=WURebootRequired";
			fnPingServer(g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428&clcid=0x409");
		}	
		fnDisplayErrorPage(conErrorRebootRequired, true);
		return false;
	} else if(!bControlCheckedforUpdate) {
		try {
			iInitReturn = g_oControl.CheckIfClientUpdateNeeded(); // sync call. waits till status is returned. this method would be called again after we hit "update now" button
		}
		catch(e) { 
			if(e.number == ERROR_INVALID_PROPERTY){
				fnDisplayErrorPage(conErrorNotAdmin, true);
			}else{
				fnDisplayErrorPage(e.number, true);
			}
			return false;
		}
		
		if(iInitReturn == IU_UPDATE_NEEDED){
			fnDisplaySplashPage(conSplashOldControl);
			return false;
		}
	} 
	//Object to read/set autoupdate 
	if (g_oControl != null) {
		try	{
			g_oAutomaticUpdates = g_oControl.CreateObject("Microsoft.Update.AutoUpdate");
			bAUEnabled = g_oAutomaticUpdates.ServiceEnabled;
			if(!bAUEnabled) {
				fnDisplayErrorPage(conErrorServiceDisabled, true);
				return false;
			}
		}
		catch(e) {
		}
		fnCheckAutomaticUpdates();
	}
	oComputerSettings = g_oControl.CreateObject("Microsoft.Update.SystemInfo");
	sOemUrl = oComputerSettings.OemHardwareSupportLink;	
	try {	
		if(sOemUrl != null && sOemUrl != ""){
			fnRetry("'object' == typeof(eTOC) && 'function' == typeof(eTOC.fnEnableHardwareSupportLink)", "eTOC.fnEnableHardwareSupportLink('" + fnValidateURL(sOemUrl) + "');", "", 1000, 4);
		}
	} catch(e) {}

	try {
	    if (g_oControl != null){
			g_iDownloadSpeed = g_oControl.GetDownloadSpeed();
			if(g_iDownloadSpeed == null || g_iDownloadSpeed == 0) {
				g_iDownloadSpeed = 7000;
			}
		}	 
	} catch(e) {
		g_iDownloadSpeed = 7000;
	}

	if ('undefined' != typeof(conWerMode)) {
		if( conWerMode == iWerQueryModeExpressAll || conWerMode == iWerQueryModeExpress ){
			fnExpressScan();
		}
		else if( conWerMode == iWerQueryModeHardwareAll){
			fnScan();
		}
	}
	else { 
		fnDisplaySplashPage(conSplashWelcome);		
	}	
	if ("function" == typeof(eTOC.fnEnableTOC)) eTOC.fnEnableTOC();
	
}

function fnCheckAutomaticUpdates() { 
	fnTrace("fnCheckAutomaticUpdates");
	var bAUEnabled = false;
	g_iAUConfiguration = conAUControlledByPolicy;
	try	{
		bAUEnabled = g_oAutomaticUpdates.ServiceEnabled;
		if(!bAUEnabled) {
			return false;
		}
	}
	catch(e) {
		return false;
	}
	try {
		var iAULevel = g_oAutomaticUpdates.Settings.NotificationLevel;
		if(g_oAutomaticUpdates.Settings.ReadOnly) { 
			g_iAUConfiguration = conAUControlledByPolicy; 
		} else {
			switch(iAULevel) {
				case conAUDontNotify: 
					g_iAUConfiguration = conAUDontNotify;	//Yellow
					break;
				case conAUNotifyButDontDownload: 
					g_iAUConfiguration = conAUNotifyButDontDownload; //Yellow
					break;
				case conAUDownloadAndNotify: 
					g_iAUConfiguration   = conAUDownloadAndNotify;   //Yellow
					break;
				case conAUScheduledOK: //Configured correctly
					g_iAUConfiguration = conAUScheduledOK;    //Green
					break;
				default:
					g_iAUConfiguration = conAUControlledByPolicy;
					break;
			}
			
		}
		return false;
	}
	catch(e) {
		fnDisplayErrorPage(e.number, false);
		return false;
	}
}

function fnConfigureAutomaticUpdates() {
	fnTrace("fnConfigureAutomaticUpdates");
	g_oAutomaticUpdates.ShowSettingsDialog();
	eContent.eReporting.location.replace("AUReporting.aspx"); 
}

function fnUpdateControl() {
	fnTrace("fnUpdateControl");
	fnDisplaySplashPage(conSplashUpdatingControl);
	window.setTimeout("fnDelayUpdate();",4000) // delay so that OperationDesc and PercentComplete elements are plotted on the page by the time we access them
}

function fnDelayUpdate(){
	fnTrace("fnDelayUpdate");
	try{
		iInitReturn = g_oControl.UpdateClient(fnUpdateOperationCallBack); // async call , would invoke OnComplete after it is done
	}catch(e){ 
		fnDisplayErrorPage(e.number, true);
		return false;
	}
}

function fnUpdateOperationCallBack(iOperationMode, lPercentComplete, bClientUpdateCompleted, lErrorCode){
	fnTrace("fnUpdateOperationCallBack");
	var sOperationMode = "";
	try {
		switch(iOperationMode) {
			case 1:
				sOperationMode = L_OperationModeDownload_Text; 
				break;
			case 2:
				sOperationMode = L_OperationModeCopying_Text;
				break;
			case 3:
				sOperationMode = L_OperationModeRegister_Text;
				break;	
		}
		if ( iOperationMode != 4 ){
			eContent.document.all("OperationDesc").innerText = sOperationMode;
			eContent.document.all("PercentComplete").innerText = Math.ceil(lPercentComplete);
			eContent.document.all("UpdateStatus").style.display = "block";
		}	
		if (bClientUpdateCompleted) {
			if (lErrorCode == S_OK) fnInitializeSite(true);
			else { 
				fnDisplayErrorPage(lErrorCode, true);
				return false;
			}
		}
	}
	catch(e) {
	}	
}

/* control init */

/* Sets the Express Scan flag and scans */
function fnExpressScan() {
	fnTrace("fnExpressScan");
	g_bExpressScan = true;
	fnRetry("'function' == typeof(eTOC.fnInitDetectUpdates)", "if(!g_bScanning) fnInitScan();", "", 1000, 5); 
}

function fnScan(){ 
	fnTrace("fnScan");
	g_bExpressScan = false ;
	fnRetry("'function' == typeof(eTOC.fnInitDetectUpdates)", "if(!g_bScanning) fnInitScan();", "", 1000, 5);
}

function fnInitScan(){
	
	fnTrace("fnInitScan");
	//eContent.audiv.style.display = "none";
	//eContent.newsframediv.style.display = "none";	
	if ( g_bIsRebootRequired || g_oControl.IsRebootRequired ) {
		fnDisplayErrorPage(conErrorRebootRequired, false);
		return false ;
	} 
	eTOC.eHidden.onclick = null;
	eTOC.fnEnableLink(eTOC.eHidden, false);
	g_bScanning = true;
	if ('function' == typeof(eTOC.fnInitDetectUpdates)) eTOC.fnInitDetectUpdates();

	if(eContent.g_iPage == conSplashPage && eContent.g_iSubPage == conSplashWelcome){ 
		eContent.eSplashWelcome.style.display = "none";
		eContent.eSplashScanning.style.display = "block";
		
	}else{
		fnDisplaySplashPage(conSplashScanning);		
	}
	g_iProgressBarCount =0;
	g_iProgresspixles = -45;
	if(eContent.sDir=="ltr"){
		g_sProgressBar = "<span id='OuterProgress' name='OuterProgress'><span class=progreessbarlightest></span><span class=progreessbarlight></span><span class=progreessbar></span><span class=progreessbar></span><span class=progreessbar></span><span class=progreessbar></span><span class=progreessbar></span></span>";
		g_iProgressCount = 38
	}else{
		g_sProgressBar = "<span id='OuterProgress' name='OuterProgress'><span class=progreessbar></span><span class=progreessbar></span><span class=progreessbar></span><span class=progreessbar></span><span class=progreessbar></span><span class=progreessbarlight></span><span class=progreessbarlightest></span></span>";
		g_iProgressCount = 25
	}

	g_oInterval = window.setInterval(fnProgressBar, 80);
	try{
		fnInitDetect();
	}
	catch(e) {
		fnDisplayErrorPage(e.number, true);
		return false;
	}	
}
function fnProgressBar(){	
	if(g_iProgressBarCount == g_iProgressCount) {
		g_iProgressBarCount = 0;
		g_iProgresspixles = -18;
		
	}	
	if('undefined' != typeof(eContent.fileprogress)){		
		eContent.fileprogress.innerHTML = g_sProgressBar;
		if(eContent.sDir=="ltr"){
			eContent.OuterProgress.style.marginLeft = g_iProgresspixles;
		}else{
			eContent.OuterProgress.style.marginRight = g_iProgresspixles;
		}
		
	}else{
		if(g_iProgressBarCount < 2) return;
		window.clearInterval(g_oInterval)
	}
	g_iProgressBarCount += 1;
	g_iProgresspixles += 10
		
}

/* display content */

function fnDisplayErrorPage(iError, bDisableTOC){
	fnTrace("fnDisplayErrorPage");
	g_bControlReady = false ;
	try{
		if(bDisableTOC) {
			g_oControl = null;
			eTOC.fnDisableTOC();
		}	
		eContent.location.replace(conConsumerURL + "errorinformation.aspx?error=" + iError  + "&" + conQueryString);
	}catch(e){
	
	}
}

function fnDisplaySplashPage(iPage){ 
	fnTrace("fnDisplaySplashPage");
	var UA = navigator.userAgent.toLowerCase();
	if((UA.indexOf("msie 5.0") > 0) && !g_bIE5page && (iPage == conSplashWelcome)){ 
		iPage = conSplashIE5;
	}
	if((UA.indexOf("windows nt 5.2") != -1) && (UA.indexOf("; data center") != -1) && (iPage == conSplashWelcome) && !g_b2003DC) {
		iPage = conSplash2003DC;
	}
	if (iPage == conSplashCheckingControl || iPage == conSplashWelcome){ // Bug 827824
		eContent.location.replace( conConsumerURL + "splash.aspx?page=" + iPage + "&cpuClass=" + g_sCpuClass + "&auenabled=" + g_bAutoUpdateEnabled + "&" + conQueryString );
	}
	else {
		eContent.location.href = conConsumerURL + "splash.aspx?page=" + iPage + "&cpuClass=" + g_sCpuClass + "&auenabled=" + g_bAutoUpdateEnabled + "&" + conQueryString;
	}	
}


function fnDisplayBasketUpdates(sBasketId){
	fnTrace("fnDisplayBasketUpdates");	
	if(!g_bExpressScan && (g_bSPPresent && g_iHighestDownloadPriority != 0)){
			fnDisplaySPUpdate();
	}else {
		if (sBasketId == null ) { sBasketId = conResultsBasket ; } 
		if((g_bSPCoolOff || g_bSPAU) && g_bSPPresent && g_iHighestDownloadPriority != 0){
				fnDisplaySPUpdate();
			}else{
			eContent.location.href = "resultslist.aspx?id=" + sBasketId + "&speed=" + g_iDownloadSpeed + "&" + conQueryString;
		}
	}
}

function fnDisplayCriticalUpdates(){
	fnTrace("fnDisplayCriticalUpdates");
	var sUpdateArrayIndexes = fnGetCategoryLevelUpdates(conCategoryCritical,null);
	fnPostData(sUpdateArrayIndexes, conConsumerURL + "resultslist.aspx?" + conQueryString + "&id=" + conResultsCritical);
}

function fnDisplayHardwareUpdates(){
	fnTrace("fnDisplayHardwareUpdates");
	var sUpdateArrayIndexes = fnGetCategoryLevelUpdates("optional",conHardware); 
	fnPostData(sUpdateArrayIndexes, conConsumerURL + "resultslist.aspx?" + conQueryString + "&id=" + conResultsDrivers + "&LinkId=" + conCategoryHardware);
}
	
function fnDisplayHiddenUpdates() {
	fnTrace("fnDisplayHiddenUpdates");
	var sHiddenUpdates = fnGetHiddenUpdates();
	fnPostData(sHiddenUpdates, conConsumerURL + "resultslist.aspx?" + conQueryString + "&id=" + conResultsHidden );
}
/* display content */

function fnGetHiddenUpdates() {
	var i, iUpdateLen = g_aUpdate.length;
	var sUpdateArrayIndexes = "";
	fnTrace("fnGetHiddenUpdates");
	if ( iUpdateLen > 0){
		for (i = 0; i < iUpdateLen; i++){
			if (g_aUpdate[i].IsHidden == true) sUpdateArrayIndexes += i + ",";
		} 
	}	
	
	return (sUpdateArrayIndexes == "")? sUpdateArrayIndexes: sUpdateArrayIndexes.substr(0,sUpdateArrayIndexes.length -1);
}

/* general functions */

function fnPostData(sData, sURL){
	var oPostForm;
	fnTrace("fnPostData");
	try {
		oPostForm = eTOC.ePostForm;
		oPostForm.ePostData.value = sData;
		oPostForm.action = sURL;
		oPostForm.submit();
		g_bPosted = true;
	}
	catch(e){}	
	
}

function fnRetry(sTry, sIfSuccess, sIfFailure, iPause, iMaxRetries, iTries){
	fnTrace("fnRetry");
	if(iTries == null) iTries = 0;

	if(eval(sTry)){
		eval(sIfSuccess);
	}else if(iTries < iMaxRetries){
		window.setTimeout("fnRetry(\"" + sTry + "\", \"" + sIfSuccess + "\", \"" + sIfFailure + "\", " + iPause + ", " + iMaxRetries + ", " + ++iTries + ");", iPause);
	}else{
		eval(sIfFailure);
	}
}

function fnValidateURL(sURL){ 
	fnTrace("fnValidateURL");
	if(sURL.match(/^(ftp|http|https):\/\//i) == null) sURL = "http://" + sURL;
	return sURL;
}

/* Clear out the values of all hidden elements in the form*/
function fnClearForm(oForm){
	var iFormElementsCount, i, oChildNodes;
	oChildNodes = oForm.getElementsByTagName("input");
	iFormElementsCount = oChildNodes.length;
	for (i = 0; i < iFormElementsCount; i++ ){
		oChildNodes.item(i).value = "" ;
	}
}

/* Remove script from strings */
function fnSanitize(s) {
	var	ss = s;
	while(ss.indexOf("<") != -1) ss = ss.replace(/</,"&lt;");
	while(ss.indexOf(">") != -1) ss = ss.replace(/>/,"&gt;");
	while(ss.indexOf("\"") != -1) ss = ss.replace(/"/,"&quot;");
	while(ss.indexOf("'") != -1) ss = ss.replace(/'/,"&#39;");
	while(ss.indexOf("\\") != -1) ss = ss.replace("\\","&#92;");
	return ss;
}

/* general functions */

function fnUpdateTOCBasket(){ 
	var iBasketCount, oBasket, oBasketNumber;
	fnTrace("fnUpdateTOCBasket");
	oBasket = eTOC.eBasketUpdates;
	oBasketNumber = oBasket.children[1];
	if(oBasketNumber == null) return false;
	iBasketCount = g_iConsumerBasketCount;
	if(iBasketCount > 0){
		oBasketNumber.innerText = " (" + iBasketCount + ")";
		oBasket.style.fontWeight = "bold";
	}else{
		oBasketNumber.innerText = " (0)";//oBasketNumber.innerText.replace(/\ \(\d+\)/, "");
		oBasket.style.fontWeight = "";
	}
}
/* should go in resultlist.js*/
function fnGetDownloadSizeText(iSize,iSec){
	var sSize, sDownloadSizeText, iMinutes, iHours, sHours, sMinutes, bLessThan, sLessThan;
	fnTrace("fnGetDownloadSizeText");
	sSize = fnFormatSize(iSize);
	if(g_iDownloadSpeed > 0){
		iMinutes = iSec/60;		
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
				sLessThan = bLessThan ? " " + parent.L_RListLessThan_Text + " " : "";
				sDownloadSizeText = "&lrm;" + iMinutes + sLessThan + " ," + sSize + "&lrm;";
			}
		}else{
			if(iHours > 0){
				sDownloadSizeText = sSize + ", " + iHours + " " + sHours + " " + iMinutes;
			}else{
				sLessThan = bLessThan ? " " + parent.L_RListLessThan_Text + " " : "";
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
	fnTrace("fnFormatSize");
	if(iSize >= conMB){
		return fnRound(iSize/conMB, 1) + " " + L_MB_Text;
	}else{
		return fnRound(iSize/conKB, 0) + " " + L_KB_Text;
	}
}

function fnRound(i, iDecimalPlaces){
	fnTrace("fnRound");
	if(iDecimalPlaces == null) iDecimalPlaces = 0;

	iDecimalPlaces = Math.pow(10, iDecimalPlaces);
	return Math.round(i*iDecimalPlaces)/iDecimalPlaces;
}
/* should go in resultlist.js*/

/* Enables the "Install Updates" link */
function fnEndTOCDetectUpdates(sId){
	var oLink;
	fnTrace("fnEndTOCDetectUpdates");
	oLink = eTOC.eBasketUpdates;
	eTOC.fnEnableLink(oLink);
	oLink.onclick = new Function("fnDisplayBasketUpdates('" + sId + "');return false;");
	
	//if (!g_bSPPresent){	
		eTOC.eHidden.onclick = new Function("parent.fnDisplayHiddenUpdates();return false;");
		eTOC.fnEnableLink(eTOC.eHidden, true);
	//}
	
}

function fnPostInstall() {
	fnTrace("fnPostInstall");
	g_aUpdate.length = 0;
	g_aToc.length = 0;
	g_UpdateCol = null;
	g_iConsumerBasketCount = 0;
	fnUpdateTOCBasket();
	eTOC.fnEnableLink(eTOC.eBasketUpdates, false);
	eTOC.eAvailableUpdatesTable.style.display = "none";
	
}
//Trace code
function fnTrace(sFunct) {
	try {
		if(conDevServer) fnAddTrace(sFunct);
	}
	catch(e) { }
	return false;
}



