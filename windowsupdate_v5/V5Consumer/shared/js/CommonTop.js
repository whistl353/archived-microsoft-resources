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

var conErrorControlFailed = 8;
var conErrorControlUpdateFailed = 9;
var conErrorControlInstallFailed = 25;
var conErrorWin2KLessThanSP3 = 26;
var conErrorRebootRequired = 29;

var conResultsCritical = 0;
var conResultsProduct = 1;
var conResultsBasket = 2;
var conResultsDrivers = 3;
var conResultsBeta = 4;
var conResultsHidden = 5;
var conExpressInstall = 6;

var conSplashCheckingControl = 0;
var conSplashInstallingControl = 1;
var conSplashOldControl = 2;
var conSplashWelcome = 3;
var conSplashScanning = 4;
var conSplashInstallingWait = 9;
var conSplashScanningDone = 10;
var conSplashUpdatingControl = 11;
 
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
var conErrorOther = -1;
var conErrorNotAdmin = 3;
var conErrorDisabled = 4;

//Update.state enum
var conStateNotApplicable = 0;
var conStateInstallable = 1;
var conStateInstalled = 2;
var conStateInstallationInProgress = 3;
var conStateHidden = 4;
var conStateSuperceded = 5;
var conStateOutOfScope = 6;

/* WebCom API GetUserType */
var conNotAdmin = 0;
var conElevatedUser = 1;
var conAdmin = 2;
/* WebCom API GetUserType */

var IU_UPDATE_NOTNEEDED = 0;
var IU_UPDATE_NEEDED = 1;
var S_OK = 0;
var SUS_E_REBOOT_REQUIRED = 4;
var E_ACCESSDENIED = 5;
var INET_E_INVALID_URL = 6;
var WINDOWS_UPDATE_DISABLED = true;
var ERROR_INVALID_PROPERTY = -2146828218;
var VER_SUITE_DATACENTER = 0x00000080;
var VER_NT_SERVER = 0x00000003;
var REQUIRES_EXCLUSIVE_HANDLING	= 2;
/* constants */

/* global variables */
var g_oControl, g_oPopup, g_bIsRebootRequired;
var g_iConsumerBasketCount, g_iConsumerBasketSize, g_iConnectionSpeed;
var g_bPosted, g_bScanning, g_bDetectedItems, g_bPersonalizing, g_bEULAAccepted, g_bX86, g_bAutoUpdateEnabled; 
var g_bControlInitialized = false;
var g_bExpressScan = false;
var g_UpdateCategory, g_UpdateCol, g_InstallCol, g_oInstallationResult;
var g_aUpdate = new Array(); // This array is parallel to the Update collection
/* global variables */

function window.onload(){
	fnInit();
	window.setTimeout('fnDoReporting();',2000);
}

/*Initializes the global variables */
function fnInit(){ 
	var sCurrentURL, sWelcomePage, sErrorPage;

	if("undefined" == typeof(conQueryString) || "object" != typeof(eContent) || "object" != typeof(eTOC) || "function" != typeof(eTOC.fnDisableTOC)){
		window.setTimeout("fnInit();", 0);
		return false;
	}

	g_bPosted = false;
	g_bScanning = false;
	g_bPersonalizing = false;
	g_bDetectedItems = false;
	g_bAutoUpdateEnabled = false;
	g_bX86 = (window.navigator.cpuClass == "x86");
	g_iConnectionSpeed = 0;
	g_iConsumerBasketCount = 0;
	g_iConsumerBasketSize = 0;
	eTOC.fnInitTOC();
	sCurrentURL = eContent.location.href.toLowerCase();
	sWelcomePage = "http://" + window.location.host + conConsumerURL + "splash.aspx?page=" + conSplashCheckingControl + "&" + conQueryString;
	sErrorPage = "http://" + window.location.host + conConsumerURL + "ErrorInformation.aspx?error=" + conErrorControlUpdateFailed + "&" + conQueryString;

	if(window.location.search.indexOf("page=") == -1 && !g_bControlInitialized && sCurrentURL != sWelcomePage && sCurrentURL != sErrorPage){
		fnDisplaySplashPage(conSplashCheckingControl);
	}
	
}

/* control init */

function fnInitializeControl(){ 
	var iInitReturn; 
	try{ 
		if(g_oControl == null){
			g_oControl = new ActiveXObject("SoftwareDistribution.WebControl");
		}
		window.setTimeout('fnTestControl();',4000); // delay so that control is initialized before we access the property
		
	}catch(e){ 
		if(e.number == ERROR_INVALID_PROPERTY){
			fnDisplayErrorPage(conErrorNotAdmin, true);
		}else{
			fnDisplayErrorPage(e.number, true);
		}
		return false;
	}
}

/* Tests the control by checking its property */
function fnTestControl(){  
	var WUDisabled, OSMajor, OSMinor, OSSPMajor;	
	try {
		WUDisabled = g_oControl.IsWindowsUpdateDisabled;
		//alert("control" + typeof(g_oControl.IsWindowsUpdateDisabled));
		if (WUDisabled == undefined) {
			fnDisplayErrorPage(conErrorControlFailed, true);
			return false;
		}
		if (WUDisabled) {
			fnDisplayErrorPage(conErrorDisabled, true);
			return false;
		}
		// if platform is < win2k SP3 , redirect to V4 site
		OSMajor = g_oControl.GetOSVersionInfo(0,1);
		OSMinor =  g_oControl.GetOSVersionInfo(1,1);
		OSSPMajor =	g_oControl.GetOSVersionInfo(4,1);
		if (OSMajor == 5 && OSMinor == 0 && OSSPMajor < 3 ){ 
		   fnDisplayErrorPage(conErrorWin2KLessThanSP3, true);
		   return false;
		}
	} catch(e) {
		if(e.number == ERROR_INVALID_PROPERTY){
			fnDisplayErrorPage(conErrorNotAdmin, true);
		}else{
			fnDisplayErrorPage(e.number, true);
		}
		return false;
	}

	g_bControlInitialized = true;
	
	fnInitializeSite();
	return true;
	
}

function fnInitializeSite(){  

	var bIsDataCenter, bIsAdmin,bAreLocalUsersElevated, oComputerSettings, sOemUrl, iUserType;
	
	try {
		iUserType = g_oControl.GetUserType();
		bIsAdmin = (iUserType == conAdmin);
		bAreLocalUsersElevated = (iUserType == conElevatedUser);
		bIsDataCenter = ((g_oControl.GetOSVersionInfo(6,1) & VER_SUITE_DATACENTER) > 0) ;
		g_bIsRebootRequired = g_oControl.IsRebootRequired ;
		g_bOSIsServer=(g_oControl.GetOSVersionInfo(7,1) == VER_NT_SERVER);
		oComputerSettings = g_oControl.CreateObject("Microsoft.Update.SystemInfo");
		
	}
	catch(e) {
		fnDisplayErrorPage(e.number, true);
		return false;
	}	
	
	sOemUrl = oComputerSettings.OemHardwareSupportLink;
	if(sOemUrl != null && sOemUrl != ""){
		fnRetry("'object' == typeof(eTOC) && 'function' == typeof(eTOC.fnEnableHardwareSupportLink)", "eTOC.fnEnableHardwareSupportLink('" + fnValidateURL(sOemUrl) + "');", "", 1000, 4);
	}
	
	if(!bIsAdmin && !bAreLocalUsersElevated){
		fnDisplayErrorPage(conErrorNotAdmin, true);
		return false;
	}
	else{
		if(bIsDataCenter){	// Win2k datacenter is not supported
			window.location.replace(conConsumerURL + "thanks.aspx?os=dtc");
		}
		else
		{
			if (g_bIsRebootRequired) {
				fnDisplayErrorPage(conErrorRebootRequired, true);
				return false ;
			} 
		}
	}
	fnDisplaySplashPage(conSplashWelcome);
	eTOC.fnEnableTOC();
	if("function" == typeof(fnInitWebIQ) && conLangCode == "en") window.setTimeout("fnInitWebIQ();", 0);
	
}

/* control init */

/* Sets the Express Scan flag and scans */
function fnExpressScan() {
	g_bExpressScan = true;
	fnScan();
}

function fnScan(){ 
	fnRetry("'function' == typeof(eTOC.fnInitDetectUpdates)", "if(!g_bScanning) fnInitScan();", "fnReloadSite();", 1000, 5);
}

function fnInitScan(){ 
	if (g_bIsRebootRequired) {
		fnDisplayErrorPage(conErrorRebootRequired, true);
		return false ;
	} 
	g_bScanning = true;
	eTOC.fnInitDetectUpdates();

	if(eContent.g_iPage == conSplashPage && eContent.g_iSubPage == conSplashWelcome){
		eContent.eSplashWelcome.style.display = "none";
		eContent.eSplashScanning.style.display = "block";
	}else{
		fnDisplaySplashPage(conSplashScanning);
	}

	if("function" == typeof(fnInitDetect)){
		window.setTimeout("fnInitDetect();", 10);
	}else{
		window.setTimeout("fnLoadJS();", 0);
	}
}

/* Loads the .js file when scan is clicked */
function fnLoadJS(){ 
	top2.src = "shared/js/WebComTop.js";
}

function fnInitTopJS(){
	if(g_bScanning) fnInitDetect();
}

/* general */
function fnReloadSite(){
	if(window.confirm(L_ReloadingSiteText_Text)){
		fnScan(); 
	}else{
		window.location.reload();
	}
}
/* general */
/* dialogs */

function fnShowReadMore()
{
    strUrl = event.srcElement.readMoreUrl;
    iTop = (document.body.clientHeight - 400)/2;
    iLeft = (document.body.clientWidth - 400)/2;
    window.open(strUrl, "_blank", "directories=no,width=400,height=400,left=" + iLeft + ",top=" + iTop + ",location=no,menubar=yes,status=no,toolbar=no,resizable=yes,scrollbars=yes");
    event.returnValue = false;
}

function fnClickRetry(sUpdateId){
	if(g_oPopup) g_oPopup.close();
	g_oPopup = window.showModalDialog(conConsumerURL + "DialogRetry.aspx?UpdateId=" + sUpdateId + conQueryString,[window], "dialogWidth:500px;dialogHeight:500px;help:no;scroll:no;status:no;resizable:yes;")
}
/* dialogs */
/* display content */

function fnDisplayErrorPage(iError, bDisableTOC){
	try{
		if(bDisableTOC) eTOC.fnDisableTOC();
		eContent.location.replace(conConsumerURL + "errorInformation.aspx?error=" + iError  + "&" + conQueryString);
	}catch(e){}
}

function fnDisplaySplashPage(iPage){
	eContent.location.replace(conConsumerURL + "splash.aspx?page=" + iPage + "&x86=" + g_bX86 + "&auenabled=" + g_bAutoUpdateEnabled + "&" + conQueryString);
}

function fnDisplayLearnAbout(iTopic){
	if(g_oPopup != null) g_oPopup.close();
	g_oPopup = window.showModelessDialog(conConsumerURL + "DialogLearnAbout.aspx?topic=" + iTopic + "&" + conQueryString, [window], "scroll:no;help:no;status:no;resizable:no;dialogWidth:385px;dialogHeight:440px");
}

function fnDisplayBasketUpdates(sBasketId){
	if (sBasketId == null ) { sBasketId = conResultsBasket ; } 
	eContent.location.href = "resultsList.aspx?id=" + sBasketId + "&speed=" + g_iConnectionSpeed + "&" + conQueryString;
}

function fnDisplayCriticalUpdates(){
	var sUpdateArrayIndexes = fnGetCategoryLevelUpdates(conCategoryCritical,null);
	fnPostData(sUpdateArrayIndexes, conConsumerURL + "resultsList.aspx?" + conQueryString + "&id=" + conResultsCritical);
}
	
function fnDisplayHiddenUpdates() {
	var sHiddenUpdates = fnGetHiddenUpdates();
	fnPostData(sHiddenUpdates, conConsumerURL + "resultsList.aspx?" + conQueryString + "&id=" + conResultsHidden );
}
/* display content */

function fnGetHiddenUpdates() {
	var i, iUpdateLen = g_aUpdate.length;
	var sUpdateArrayIndexes = "";
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

	oPostForm = eTOC.ePostForm;
	oPostForm.ePostData.value = sData;
	oPostForm.action = sURL;
	oPostForm.submit();
	g_bPosted = true;
}

function fnRetry(sTry, sIfSuccess, sIfFailure, iPause, iMaxRetries, iTries){
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
	if(sURL.match(/^(ftp|http|https):\/\//i) == null) sURL = "http://" + sURL;
	return sURL;
}
/* general functions */

function fnUpdateTOCBasket(){ 
	var iBasketCount, oBasket, oBasketNumber;

	oBasket = eTOC.eBasketUpdates;
	oBasketNumber = oBasket.children[1];
	if(oBasketNumber == null) return false;
	iBasketCount = g_iConsumerBasketCount;
	if(iBasketCount > 0){
		oBasketNumber.innerText = " (" + iBasketCount + ")";
		oBasket.style.fontWeight = "bold";
	}else{
		oBasketNumber.innerText = oBasketNumber.innerText.replace(/\ \(\d+\)/, "");
		oBasket.style.fontWeight = "";
	}
}
/* should go in resultlist.js*/
function fnGetDownloadSizeText(iSize){
	var sSize, sDownloadSizeText, iMinutes, iHours, sHours, sMinutes, bLessThan, sLessThan;

	sSize = fnFormatSize(iSize);
	g_iConnectionSpeed = 7000//403373 // added to get time karunaka
	if(g_iConnectionSpeed > 0){
		iMinutes = (iSize/g_iConnectionSpeed)/60;		iHours = 0;

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

function fnRound(i, iDecimalPlaces){
	if(iDecimalPlaces == null) iDecimalPlaces = 0;

	iDecimalPlaces = Math.pow(10, iDecimalPlaces);
	return Math.round(i*iDecimalPlaces)/iDecimalPlaces;
}
/* should go in resultlist.js*/

/* Enables the "Instal Updates" link */
function fnEndTOCDetectUpdates(sId){
	var oLink;
	oLink = eTOC.eBasketUpdates;
	eTOC.fnEnableLink(oLink);
	oLink.onclick = new Function("fnDisplayBasketUpdates('" + sId + "');return false;");
	
	if (!g_bExpressScan){	
		eTOC.eHidden.onclick = new Function("parent.fnDisplayHiddenUpdates();return false;");
		eTOC.fnEnableLink(eTOC.eHidden, true);
	}
	
}

function fnPostInstall() {

	g_aUpdate.length = 0;
	g_aToc.length = 0;
	g_UpdateCol = null;
	g_iConsumerBasketCount = 0;
	fnUpdateTOCBasket();
	eTOC.fnEnableLink(eTOC.eBasketUpdates, false);
	eTOC.eAvailableUpdatesTable.style.display = "none";
	
}
/*Stats.Net Web Metrix Reporting*/

function fnDoReporting(sPath){ 
	var ToolBar_Supported = false;
	var doImage = doImage;
	var TType = TType;
	if (navigator.userAgent.indexOf("MSIE")    != -1 && 
		navigator.userAgent.indexOf("Windows") != -1 && 
		navigator.appVersion.substring(0,1) > 3)
		{
			ToolBar_Supported = true;
		}

		if(doImage == null)
		{
			var a= new Array();
			a[0] = fnprepTrackingString(window.location.hostname,7);
			
			if (TType == null)
			{	
				a[1] = fnprepTrackingString('PV',8);
			}
			else
			{
				a[1] = fnprepTrackingString(TType,8);
			}
			
			if (sPath == null) sPath = window.location.pathname;
			
			a[2] = fnprepTrackingString(sPath,0);
			
			if( '' != window.document.referrer)
			{
				a[a.length] = fnprepTrackingString(window.document.referrer,5);
			}
			if (navigator.userAgent.indexOf("SunOS") == -1 && navigator.userAgent.indexOf("Linux") == -1)
			{
				fnbuildIMG(a);
			}
		}

}

function fnbuildIMG(pArr){

	var TG= window.location.protocol + "//c.microsoft.com/trans_pixel.asp?";
	for(var i=0; i<pArr.length; i++)
	{
		if(0 == i)
		{
			TG +=  pArr[i];
		}
		else
		{
			TG += '&' + pArr[i];
		}
	}
	
	document.all["eReporting"].src = TG;
	
}

function fnprepTrackingString(ts, type){
	var rArray;
	var rString;
	var pName = '';
	if (0 == type)
	{
		pName = 'p=';
		rString = ts.substring(1);
		rArray = rString.split('/');
		
	}
	if (1 == type)
	{
		pName = 'qs=';
		rString = ts.substring(1);
		rArray = rString.split('&');		
	}
	if (2 == type)
	{
		pName = 'f=';
		rString = escape(ts);
		return pName + rString;
	}
	if (3 == type)
	{
		pName = 'tPage=';
		rString = escape(ts);
		return pName+rString;
	}
	if (4 == type)
	{
		pName = 'sPage=';
		rString = escape(ts);
		return pName + rString;
	}
	if (5 == type)
	{
		pName = 'r=';
		rString = escape(ts);
		return pName + rString;
	}
	if (6 == type)
	{
		pName = 'MSID=';
		rString = escape(ts);
		return pName + rString;
	}
	if (7 == type)
	{
		pName = 'source=';
		rString = ts.toLowerCase();
		if(rString.indexOf("microsoft.com") != -1)
		{
			rString = rString.substring(0,rString.indexOf("microsoft.com"));
			if('' == rString)
			{
				rString = "www";
			}	
			else
			{
				rString = rString.substring(0,rString.length -1);
			}
		}
		return pName + rString;
	}
	if (8 == type)
	{
		pName = 'TYPE=';
		rString = escape(ts);
		return pName + rString;
	}
	rString = '';
	if(null != rArray)
	{
		for( j=0; j < rArray.length; j++)
		{	
			rString += rArray[j] + '_';  
		} 
		
	}
	
	rString = rString.substring(0, rString.length - 1); 
	return pName + rString;
}

/*Stats.Net Web Metrix Reporting*/
