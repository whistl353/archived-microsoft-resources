var g_sLang;
var g_sDir;
var g_sUserAgent;
var g_oLearnPrivacy = null;
var g_OS = null;
function fnLoadTshoot()
{
g_sUserAgent = navigator.userAgent;
window.setTimeout("fnDoReporting()",1000);
}
function fnPingback(response,resolutionid) {
var sQueryString;
var sEventID;
var sEventNamespaceID;
var sUpdateId;
var sWin32HResult;
var sAppName;
var sComputerID;
var sOSMajorVersion = 0;
var sOSMinorVersion = 0;
var sOSBuildNumber = 0;
var sOSServicePackMajorNumber = 0;
var sOSServicePackMinorNumber = 0;
var oDate;
var sProcArch;
var iOSServicePackBuildNumber = 0;
var iSuiteMask = 0;
var iProductType = 0;
var sClientVersion = "";
if (window.opener.parent.g_bControlInitialized == true){
sOSMajorVersion = window.opener.parent.g_iOSMajor;
sOSMinorVersion = window.opener.parent.g_iOSMinor;
sOSServicePackMajorNumber = window.opener.parent.g_iOSSPMajor;
sOSServicePackMinorNumber = window.opener.parent.g_iOSSPMinor;
sOSBuildNumber = window.opener.parent.g_sOSBuildNumber;
iOSServicePackBuildNumber = window.opener.parent.g_iOSServicePackBuildNumber;
iSuiteMask = window.opener.parent.g_iSuiteMask;
iProductType = window.opener.parent.g_iProductType;
sClientVersion = window.opener.parent.g_sClientVersion
}
else{
var UA = navigator.userAgent.toLowerCase();
sOSBuildNumber = 0;
sOSServicePackMajorNumber = 0;
sOSServicePackMinorNumber = 0;
if(UA.indexOf("windows nt 5.0") > 0){
sOSMajorVersion = 5;
sOSMinorVersion = 0;
}
else if(UA.indexOf("windows nt 5.1") > 0){
sOSMajorVersion = 5;
sOSMinorVersion = 1;
}
else if(UA.indexOf("windows nt 5.2") > 0){
sOSMajorVersion = 5;
sOSMinorVersion = 2;
}
}
if (response == "yes"){
sEventID = 601;
}
else
{
sEventID = 602;
}
switch (navigator.cpuClass.toLowerCase()){
case "x86":
sProcArch = "X86Compatible";
break;
case "ia64":
sProcArch = "IA64Compatible";
break;
case "amd64":
sProcArch = "Amd64Compatible";
break;
default:
sProcArch = "Unknown";
}
sEventNamespaceID = 3;
sWin32HResult = resolutionid;
sAppName = "SiteEvent";
sComputerID = "";
oDate = new Date();
sTimeAtTarget = oDate.getFullYear() + "/" + (oDate.getMonth() + 1) + "/" + oDate.getDate() + "-" + oDate.getHours() + ":" + oDate.getMinutes();
sUpdateId = "12345678-1234-1234-1234-123456789123";
sQueryString = "?error=" + sWin32HResult + "&eventid=" + sEventID +
"&timeattarget=" + sTimeAtTarget + "&appname=" + sAppName +
"&updateid=" + sUpdateId +
"&loc=" + sOSLocale + "&procarc=" + sProcArch +
"&osvermaj=" + sOSMajorVersion + "&osvermin=" + sOSMinorVersion +
"&build=" + sOSBuildNumber + "&spmaj=" + sOSServicePackMajorNumber +
"&spmin=" + sOSServicePackMinorNumber +
"&spbuild=" + iOSServicePackBuildNumber +
"&suitemask=" + iSuiteMask +
"&prodtype=" + iProductType +
"&clientver=" + sClientVersion +
"&ArticleId=" + iarticleid;
if ( window.opener.sPingBackUrl != "")
{
pingback2.location.replace(window.opener.sPingBackUrl + sQueryString);
}
closelink.focus();
window.showModalDialog("tshootthanks.aspx?ln=" + window.opener.parent.conLangCode,null,"dialogWidth:350px;dialogHeight:150px;center:yes;resizable:no;scroll:no;status:no;help:no");
}
