//Copyright (c) Microsoft Corporation.  All rights reserved.
var g_sLang;
var g_sDir;
var g_sUserAgent;
var g_oLearnPrivacy = null;
var g_OS = null;

function fnLoadTshoot()
{

	// get the lang, load the IssuesString.inc and then transform the xml
	g_sUserAgent = navigator.userAgent;
	window.setTimeout("fnDoReporting()",1000);

}
/*
function fnShowOtherIssues(i){
	//i = the page number that was clicked on, what the user wants to see
	//divcountjs = total number of pages
	//currentdiv = current page being shown.
	
	currentdiv = i;	
	// hide all of the divs
	for(var a = 1; a < divcountjs + 1; a++)
	{
		document.all["divMainIssuesContents" + a].style.display="none";
	}
	// show the desired div	
	document.all["divMainIssuesContents" + currentdiv].style.display="block";

	// build whole set of anchor tags anew:
	// if we're at the first page
	if (currentdiv ==1){
		labelMainIssuesPages.innerHTML  =currentdiv + "&nbsp" +
									"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
									"<a href='javascript:fnShowNext()'  class='sys-link-normal'>Next&gt;&gt;</a>"
	}
	//          what if we're at page 2? what will be shown?

	// if we're at the last page
	if (currentdiv == divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv - 1) + ")'  class='sys-link-normal'>" + (currentdiv -1) + "</a>&nbsp;" +
										 currentdiv + "&nbsp";
	}
	//          what if we're at divcountjs - 1 page? what will be shown?

	// if we're in the middle
	if (currentdiv != 1 && currentdiv != divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										currentdiv + "&nbsp" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
										"<a href='javascript:fnShowNext()'  class='sys-link-normal'>Next&gt;&gt;</a>"
	}
    
}

function fnShowPrev(){
	//divcountjs = total number of pages
	//currentdiv = current page shown.
	
	currentdiv = currentdiv - 1;	
	// hide all of the divs
	for(var a = 1; a < divcountjs + 1; a++)
	{
		document.all["divMainIssuesContents" + a].style.display="none";
	}
	// show the desired div	
	document.all["divMainIssuesContents" + currentdiv].style.display="block";

	// if we're at the first page
	if (currentdiv ==1){
		labelMainIssuesPages.innerHTML  =currentdiv + "&nbsp" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
										"<a href='javascript:fnShowNext()' class='sys-link-normal'>Next&gt;&gt;</a>"
	}
	// if we're in the middle
	if (currentdiv != 1 && currentdiv != divcountjs){
	labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
									currentdiv + "&nbsp" +
									"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
									"<a href='javascript:fnShowNext()' class='sys-link-normal'>Next&gt;&gt;</a>"
	}


}

function fnShowNext(){
	//divcountjs = total number of pages
	//currentdiv = current page shown.
	
	currentdiv = currentdiv + 1;
	// hide all of the divs
	for(var a = 1; a < divcountjs + 1; a++)
	{
		document.all["divMainIssuesContents" + a].style.display="none";
	}
	// show the desired div	
	document.all["divMainIssuesContents" + currentdiv ].style.display="block";

	// if we're in the middle
	if (currentdiv != 1 && currentdiv != divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										currentdiv + "&nbsp" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
										"<a href='javascript:fnShowNext()' class='sys-link-normal'>Next&gt;&gt;</a>"
	}
	
	// if we're at the last page
	if (currentdiv == divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv - 1) + ")' class='sys-link-normal'>" + (currentdiv -1) + "</a>&nbsp;" +
										 currentdiv + "&nbsp";
	}


}
*/


function fnPingback(response,resolutionid) {
	var queryString;
	var sEventID;// – 620 = site error, 601 = Tshoot Yes, 602 = Tshoot No.
	var sEventNamespaceID;// – 3
	var sUpdateId;// another ssite identifier
	var sWin32HResult;// - decimal error number
	var sAppName;// – This is currently an nvarchar(256) which seems expensive given the data
	var sComputerID;// – ""
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

		
		sOSMajorVersion = window.opener.parent.g_iOSMajor; //osMajor = 5
		sOSMinorVersion = window.opener.parent.g_iOSMinor; //osMinor = 2
		sOSServicePackMajorNumber = window.opener.parent.g_iOSSPMajor; //spMajor = 0
		sOSServicePackMinorNumber = window.opener.parent.g_iOSSPMinor; //spMinor = 0
		sOSBuildNumber = window.opener.parent.g_sOSBuildNumber; //osBuildNumber = 3790
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
			//sOSstring = "Win2000";
			sOSMajorVersion = 5;
			sOSMinorVersion = 0;
		}
		else if(UA.indexOf("windows nt 5.1") > 0){
			//sOSstring = "WinXP";
			sOSMajorVersion = 5;
			sOSMinorVersion = 1;
		}
		else if(UA.indexOf("windows nt 5.2") > 0){
			//sOSstring = "Server2003";
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
	sTimeAtTarget =  oDate.getFullYear() + "/" + oDate.getMonth() + "/" + oDate.getDate() + "-" + oDate.getHours() + ":" + oDate.getMinutes();

	
	sUpdateId = "12345678-1234-1234-1234-123456789123";
	queryString = "?error=" + sWin32HResult + "&eventid=" + sEventID + 
	"&timeattarget=" + sTimeAtTarget + "&appname=" + sAppName + 
	"&updateid=" + sUpdateId +
	"&loc=" + sOSLocale + "&procarc=" + sProcArch + 
	"&osvermaj=" + sOSMajorVersion + "&osvermin=" + sOSMinorVersion + 
	"&build=" + sOSBuildNumber + "&spmaj=" + sOSServicePackMajorNumber + 
	"&spmin=" + sOSServicePackMinorNumber +
	"&spbuild=" + iOSServicePackBuildNumber +
	"&suitemask=" + iSuiteMask +
	"&prodtype=" + iProductType +
	"&clientver=" + sClientVersion ;
	 
	pingback2.location.replace(window.opener.pingbackURL + queryString);
    

	closelink.focus();
	window.showModalDialog("tshootthanks.aspx?ln=" + window.opener.parent.conLangCode,null,"dialogWidth:350px;dialogHeight:150px;center:yes;resizable:no;scroll:no;status:no");

}






