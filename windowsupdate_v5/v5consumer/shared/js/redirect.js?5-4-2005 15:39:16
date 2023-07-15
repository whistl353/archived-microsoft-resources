//Copyright (c) Microsoft Corporation.  All rights reserved.

//OS types
var conOSUnsupported = "-1";
var conOSWin2K = "5.0";
var conOSWinXP = "5.1";
var conOSWin2003 = "5.2";
var conOSLonghorn = "5.3";

//V5 Thanks page types
var conThanksDown = 1;
var conThanksBadOS = 2;
var conThanksWinCE = 3;
var conThanksDatacenter = 4;
var conThanksBadBrowser = 5;
var conThanksIE5 = 8;
var conThanksLocale = 9;
var conThanks64BitBrowser = 10;

var V3Site = "http://windowsupdate.microsoft.com"
var V4Site = "http://v4.windowsupdate.microsoft.com";
var V5Site = "http://v5.windowsupdate.microsoft.com";

var g_iOSType, g_iOSSPMajor;
var g_bV4Catalog = false;
var g_sUA = navigator.userAgent.toLowerCase();
var aUA = g_sUA.split(";");
if(aUA.length > 3) g_sUA = aUA[0] + ";" + aUA[1] + ";" + aUA[2] + ";" + aUA[3] + ";";

var g_sOSLang = navigator.browserLanguage;
if(typeof(g_sOSLang) == "undefined") g_sOSLang = "en";
g_sOSLang = g_sOSLang.toLowerCase();

fnRedirect();
	
function fnRedirect() {
	var sURL;
	var sQueryString, sClientVersion, aClientVersion;
	var oControl;
	var oXMLHTTP;
	var oResponseXML, aResponseXML;
	var oServiceManager;
	var UpdateServices;
	var cpuClass;
	
	// Make initial checks and do redirection as necessary
	if(fnV5DownForMaintenance() == false) return false
	if(fnCheckWinCE() == false) return false;;
	if(fnCheckDatacenter() == false) return false;
	if(fnCheckBrowser() == false) return false;
	
	if(fnCheck95NT4() == false) return false;
		
	g_bV4Catalog = fnCheckV4Catalog() ;
	if(fnCheck98() == false) return false;
	
	g_iOSType = fnCheckV5OS();
	if(g_iOSType == conOSUnsupported) return false;	
	
	if(!g_bV4Catalog){
		sUrl = window.location.href.toLowerCase();
		if(sUrl.indexOf("g_sconsumersite") > -1) {
			return false;
		}
		
		//new code added for v6
		g_sOSLang = fnGetLanID(g_sOSLang);
		var cpuClass = navigator.cpuClass.toLowerCase()
		if((cpuClass == "x86") && (g_sUA.indexOf("wow") > 0)) cpuClass = "wow64"
		sQueryString = "OS=" + g_iOSType + "&Processor=" + cpuClass + "&Lang=" + g_sOSLang + "&CurrentSite=" + curSite;
		oXMLHTTP = new ActiveXObject("Microsoft.XMLHTTP");

		if(sUrl.indexOf("betathanksurl") > -1) {
			sQueryString += "&BetaThanksurl=true";
		}
		
		try {
			//WU control
			oControl = new ActiveXObject("SoftwareDistribution.WebControl");			
		}
		catch(e) {
			oControl = "";
			try{
			//mu contol
			oControl = new ActiveXObject("SoftwareDistribution.MicrosoftUpdateWebControl");
			
			}
			catch(e) {
				oControl = "";
			}
		}
		
		
		try{
			//if  control is present get SP, control veriosn, managed and Opted in settings
			if("object" == typeof(oControl)){
				sQueryString += "&SP=" + oControl.GetOSVersionInfo(4,1);
				sClientVersion =  oControl.GetOSVersionInfo(10,1);
				sQueryString += "&control=" + sClientVersion;
				
				oServiceManager = oControl.CreateObject("Microsoft.Update.ServiceManager");
				UpdateServices = oServiceManager.Services;
				for (i = 0; i < UpdateServices.Count; i++) {
					if (UpdateServices.Item(i).IsManaged) {
						sQueryString += "&IsManaged=true" ;
						break;
					}
				}	
			}			
		} 
		catch(e) {}
		
		//send the querystring data to redirect.asp
		oXMLHTTP.open("POST", "redirect.asp?" + sQueryString , false);
		oXMLHTTP.send("<send>Querystring</send>");
		oResponseXML = oXMLHTTP.responseText;
		//the URL is delimited bt @| so when we get the xml back split it by @| and get the url
		aResponseXML = oResponseXML.split("@|");
		
		if(aResponseXML.length > 1) {
			sURL = aResponseXML[1];
		} else {
		//need to change to 6 when 5 goes down 
			if(curSite == 5) {
				sURL = "thanks.aspx?" + "ln=" + g_sOSLang;
			} else{
				sURL = V5Site + "/v5Consumer/" + "thanks.aspx?" + "ln=" + g_sOSLang;
			}
		}
		if(sURL.toLowerCase() != "ok"){
			location.href = sURL;
		}
	}
	return false;
}

function fnGetLanID(sLanID){
	var sAllSupported = "ar,cs,da,de,el,en,es,fi,fr,he,hu,it,ja,ko,nl,no,pt,pl,ru,sv,tr,";
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
	}
	if((sLanID == "zh-tw") || (sLanID == "zh-cn") || (sLanID == "pt-br") || (sLanID == "zh-hk")) return sLanID;	
	sLanID = sLanID.substr(0,2);	
	if(sAllSupported.search(sLanID + ",") < 0 ) sLanID = "en";
	return sLanID;
}

function fnV5DownForMaintenance() {
	// V5 - Check the down-for-maintenance indicator
	if(curSite == "5" || curSite == "6" || curSite == "6MU") {
		var sURL = "thanks.aspx?" + "ln=" + g_sOSLang + "&thankspage=" + conThanksDown + "&os=";
		if((g_sUA.indexOf("windows nt 5.0") > 0) && (g_sDownForMaintenance2K.length > 0)) {
			location.href = sURL + conOSWin2K;
			return false;
		} else if((g_sUA.indexOf("windows nt 5.1") > 0) && (g_sDownForMaintenanceXP.length > 0)) {
			location.href = sURL + conOSWinXP;
			return false;
		} else if((g_sUA.indexOf("windows nt 5.2") > 0) && (g_sDownForMaintenance2003.length > 0)) {
			location.href = sURL + conOSWin2003;
			return false;
		} else if((g_sUA.indexOf("windows nt 6.0") > 0) && (g_sDownForMaintenanceLonghorn.length > 0)) {
			location.href = sURL + conOSLonghorn;
			return false;
		}
	}
	return true;
}

function fnCheckBrowser() {
	// Check for IE5 or IE6
	var bIE5or6;
	var bunsupported = false;
	bIE5or6 = ((g_sUA.indexOf("msie 5") > 0) || (g_sUA.indexOf("msie 6") > 0));
	if(g_sUA.indexOf("opera") != -1) bunsupported = true;
	if(!bIE5or6 || bunsupported) {
		if (curSite != 4) {
			location.href = V4Site;
		} else {
			location.href = "thanks.asp";
		}
		return false;
	}
	return true;
}

function fnCheckWinCE() {
	// Check for Windows CE
	if(g_sUA.indexOf("; mspie") != -1) {
		if(curSite == 5) {
			// Windows CE thanks page for V5
			location.href = "thanks.aspx?" + "ln=" + g_sOSLang + "&thankspage=" + conThanksWinCE;
		}else{
			location.href = V5Site + "/v5Consumer/" + "thanks.aspx?" + "ln=" + g_sOSLang + "&thankspage=" + conThanksWinCE;
		}
		return false;
	}
	return true;
}

function fnCheckDatacenter() {
	// Check for Windows 2000 Datacenter
	if((g_sUA.indexOf("windows nt 5.0") != -1) && (g_sUA.indexOf("; data center") != -1) && !g_bV4Catalog) {
		if(curSite == 5) {
			// Windows 2000 Datacenter thanks page for V5
			location.href = "thanks.aspx?" + "ln=" + g_sOSLang + "&thankspage=" + conThanksDatacenter;
		}else{
			location.href = V5Site + "/v5Consumer/" + "thanks.aspx?" + "ln=" + g_sOSLang + "&thankspage=" + conThanksDatacenter;
		}
		return false;
	}
	return true;
}
	
function fnCheck95NT4() {
    if((g_sUA.indexOf("windows 95") > 0) || ( g_sUA.indexOf("windows nt)") >0 ) || ( g_sUA.indexOf("windows nt;") >0 )  || ( g_sUA.indexOf("windows nt 4") > 0 ) ) {
		fnGoToV3();
		return false;
    } 
	return true;
}
function fnCheckV4Catalog() {
    var sLocation = location.href.toLowerCase();
	if((sLocation.search("/catalog") > 0) && (curSite == 4)) return true;
    
	return false;
}
 			
function fnCheck98() {	
	if(g_sUA.indexOf("windows 98") > 0) {
		if (curSite != 4) location.href = V4Site;
		return false;
	}
	return true;
}
function fnCheckV5OS() {
	var iOS = conOSUnsupported;
	if(g_sUA.indexOf("windows nt 5.0") > 0)	iOS = conOSWin2K;
	else if(g_sUA.indexOf("windows nt 5.1") > 0) iOS = conOSWinXP;
	else if(g_sUA.indexOf("windows nt 5.2") > 0) iOS = conOSWin2003;
	else if(g_sUA.indexOf("windows nt 6.0") > 0) iOS = conOSLonghorn;
	if(iOS == conOSUnsupported) {
		if(curSite == 5) {
			// Bad OS thanks page for V5
			location.href = "thanks.aspx?" + "ln=" + g_sOSLang + "&thankspage=" + conThanksBadOS;
		}else{
			location.href = V5Site + "/v5Consumer/" + "thanks.aspx?" + "ln=" + g_sOSLang + "&thankspage=" + conThanksBadOS;
		}
	}
	return iOS;
}

function fnGoToV3() {
	if(curSite == 3) {
		//YOU ARE ON V3
		document.open();
		document.write("<FRAMESET ROWS=100%>");
		if(g_sUA.indexOf("windows 95") > 0) { // Windows 95
			document.write("<FRAME SRC=\"Static_w95/V31site/default.htm" + location.search + "\">");
		}
		else { // Windows NT
			if(location.search == "" || location.search == null) {
				document.write("<FRAME SRC=\"scripts/redir.dll?\">");
			}
			else {
				document.write("<FRAME SRC=\"R1150/V31site/default.htm" + location.search + "\">");
			}
		}
		document.write("</FRAMESET>");
		document.close();
	} else {
		// not on v3, go there
		location.href = V3Site;
	}
	return false;
}
