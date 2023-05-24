/* catalog variables */

var sBasketString = "";
var os_sBasket = "";
var software_sBasket = "";
var driver_sBasket = "";

/* catalog variables */

var g_oSelectedLink, g_oExpandedLink, g_oUserData;

function fnInitTOC(){
	g_oSelectedLink = (parent.g_bCorporate ? eCatalogWelcome : eWelcome);

	document.ondragstart = new Function("return false;");
	document.onselectstart = new Function("return false;");
	document.oncontextmenu = new Function("return false;");
	document.onmouseup = fnLinkNormal;
	document.ondragend = fnLinkNormal;

	window.setTimeout("fnSetAllLinksEffects();", 0);
}

function window.onbeforeunload(){
	if(g_oUserData != null) g_oUserData.save("oWindowsUpdate");
}

function fnSyncTOC(sURL, iPage, iSubPage){
	var oLink;

	parent.g_bCorporate = (sURL.indexOf("/catalog/") != -1) || (sURL.indexOf("corporate=true") != -1);

	fnSwitchTOC();

	if(iPage == parent.conErrorPage){
		oLink = parent.g_bCorporate ? eCatalogWelcome : eWelcome;
	}else if(iPage == parent.conSplashPage){
		if(iSubPage == parent.conSplashWelcome){
			oLink = eWelcome;
		}else{
			oLink = parent.g_bCorporate ? eCatalogWelcome : eAvailableUpdates;
		}
	}else if(iPage == parent.conResultsPage){
		if(iSubPage == parent.conResultsCritical){
			oLink = eCriticalUpdates;
		}else if(iSubPage == parent.conResultsBasket){
			oLink = parent.g_bCorporate ? eCatalogBasket : eBasketUpdates;
		}else if(iSubPage == parent.conResultsDrivers){
			oLink = eDriverUpdates;
		}else{
			oLink = document.all[parent.fnGetQueryString(sURL, "id")];
		}
	}else if(iPage == parent.conHistoryPage){
		oLink = parent.g_bCorporate ? eCatalogHistory : eHistory;
	}else if(iPage == parent.conPersonalizationPage){
		oLink = ePersonalization;
	}else if(iPage == parent.conStatusPage){
		oLink = eBasketUpdates;
	}else if(iPage == "CatalogBasket"){
		oLink = eCatalogBasket;
	}else{
		oLink = fnGetLinkFromURL(sURL);
	}

	if("object" == typeof(oLink)) fnLinkSelect(oLink);
}

function fnEnableCatalogLink(){
	var sCatalogLinkEnabled;

	sCatalogLinkEnabled = g_oUserData.getAttribute("bCatalogLink");
	if("object" == typeof(eCatalogLink)) eCatalogLink.style.display = (sCatalogLinkEnabled == "1" || (sCatalogLinkEnabled == null && parent.g_bOSIsServer)) ? "block" : "none";
}

function fnEnableHardwareSupportLink(sURL){
	fnEnableLink(eHardwareSupport, true);
	eHardwareSupport.href = sURL;
	eHardwareSupport.style.display = "inline";
}

/* LINK EVENTS */

function fnSetAllLinksEffects(){
	var vLinks, iLinksLen, i;

	vLinks = document.links;
	iLinksLen = vLinks.length;
	for(i = 0; i < iLinksLen; i++) fnSetLinkEffects(vLinks[i]);
}

function fnSetLinkEffects(oLink){
	oLink.onmouseup = new Function("if(window.event && window.event.button == 1) fnLinkSelect(this);");
	if(oLink.className == "sys-toppane-selection" && oLink != eWelcome) oLink.className = "sys-link-normal";
}

function fnEnableTOC(){
	eCatalogWelcome.href = "http://" + window.location.host + parent.conCatalogURL + "initial.asp";

	fnEnableLink(eCatalogOperatingSystems, true);
	eCatalogOperatingSystems.href =  "http://" + window.location.host + parent.conCatalogURL + "ossearch.asp";

	fnEnableLink(eCatalogHardwareDrivers, true);
	eCatalogHardwareDrivers.href = "http://" + window.location.host + parent.conCatalogURL + "corp_drivers.asp";

	eCatalogBasket.onclick = new Function("parent.fnDisplayBasketUpdates(true);return false;");
	fnEnableLink(eCatalogBasket, true);

	eCatalogHistory.onclick = new Function("parent.fnDisplayHistory(true);return false;");
	fnEnableLink(eCatalogHistory, true);

	eCatalogSwitchSites.onclick = new Function("parent.fnSwitchSites(false);return false;");
	fnEnableLink(eCatalogSwitchSites, true);

	eWelcome.onclick = new Function("parent.fnDisplaySplashPage(parent.conSplashWelcome);return false;");

	eAvailableUpdates.onclick = new Function("parent.fnScan();return false;");
	fnEnableLink(eAvailableUpdates, true);

	eBasketUpdates.onclick = new Function("parent.fnDisplayBasketUpdates(false);return false;");
	fnEnableLink(eBasketUpdates, true);

	eHistory.onclick = new Function("parent.fnDisplayHistory(false);return false;");
	fnEnableLink(eHistory, true);

	ePersonalization.onclick = new Function("parent.fnDisplayPersonalization();return false;");
	fnEnableLink(ePersonalization, true);

	eSwitchSites.onclick = new Function("parent.fnSwitchSites(true);return false;");
	fnEnableLink(eSwitchSites, true);
}

function fnDisableTOC(iErrorPage, sErrorDetails){
	if(sErrorDetails == null) sErrorDetails = "";

	eCatalogWelcome.onclick = new Function("parent.g_bCorporate=true;parent.fnDisplayErrorPage(" + iErrorPage + ", false, '" + sErrorDetails + "');return false;");
	eCatalogSwitchSites.onclick = new Function("parent.g_bCorporate=false;parent.fnDisplayErrorPage(" + iErrorPage + ", false, '" + sErrorDetails + "');return false;");
	fnEnableLink(eCatalogOperatingSystems, false);
	fnEnableLink(eCatalogHardwareDrivers, false);
	fnEnableLink(eCatalogBasket, false);
	fnEnableLink(eCatalogHistory, false);

	eWelcome.onclick = new Function("parent.g_bCorporate=false;parent.fnDisplayErrorPage(" + iErrorPage + ", false, '" + sErrorDetails + "');return false;");
	eSwitchSites.onclick = new Function("parent.g_bCorporate=true;parent.fnDisplayErrorPage(" + iErrorPage + ", false, '" + sErrorDetails + "');return false;");
	fnEnableLink(eAvailableUpdates, false);
	fnEnableLink(eBasketUpdates, false);
	fnEnableLink(eHistory, false);
	fnEnableLink(ePersonalization, false);
}

function fnSwitchTOC(){
	if(parent.g_bCorporate && eCatalogTitle.currentStyle.display == "none"){
		eCatalogTitle.style.display = "inline";
		eCatalogDiv1.style.display = "block";
		eCatalogDiv2.style.display = "block";
		eCatalogDiv3.style.display = "block";
		eConsumerTitle.style.display = "none";
		eConsumerDiv1.style.display = "none";
		eConsumerDiv2.style.display = "none";
		eConsumerDiv3.style.display = "none";
	}else if(!parent.g_bCorporate && eConsumerTitle.currentStyle.display == "none"){
		eCatalogTitle.style.display = "none";
		eCatalogDiv1.style.display = "none";
		eCatalogDiv2.style.display = "none";
		eCatalogDiv3.style.display = "none";
		eConsumerTitle.style.display = "inline";
		eConsumerDiv1.style.display = "block";
		eConsumerDiv2.style.display = "block";
		eConsumerDiv3.style.display = "block";
	}
}

function fnEnableLink(oLink, bEnable){
	if(bEnable == null) bEnable = true;

	if(bEnable){
		oLink.href = "";
		oLink.className = "sys-link-normal";
		fnSetLinkEffects(oLink);
	}else{
		if(g_oSelectedLink == oLink) g_oSelectedLink = null;
		oLink.removeAttribute("href");
		oLink.className = "sys-link-disabled";
		oLink.onclick = null;
		oLink.onmouseup = null;
	}
}

function fnLinkNormal(oLink){
	var oEvent;

	oEvent = window.event;
	if(oLink == null){
		oLink = oEvent.srcElement;
		if(oLink.tagName.toLowerCase() != "a" || oLink.className == "sys-link-disabled") return false;
	}else if(oEvent != null && oLink.contains(oEvent.fromElement) && oLink.contains(oEvent.toElement)){
		return false;
	}else if(oLink.className != "sys-toppane-selection"){
		oLink.className = "sys-link-normal";
	}
}

function fnLinkSelect(oLink){
	if(g_oSelectedLink){
		if(oLink.innerText == g_oSelectedLink.innerText) return false;
		g_oSelectedLink.className = "sys-link-normal";
	}

	oLink.className = "sys-toppane-selection sys-link-normal";
	g_oSelectedLink = oLink;
	g_oExpandedLink = null;
}

/* LINK EVENTS */
/* DETECTION */

function fnInitDetectUpdates(){
	if("object" != typeof(eAvailableUpdates)){
		window.setTimeout("fnInitDetectUpdates();", 50);
		return false;
	}

	eAvailableUpdates.children[0].src = "/shared/images/toc_expanded.gif";
	eAvailableUpdates.children[1].innerText = parent.L_ScanForAvailableUpdates_Text + " ... 0%";
	eAvailableUpdates.onclick = new Function("parent.g_bCorporate=false;fnExpandNode(this, null);return false;");
	eAvailableUpdatesDiv.style.display = "block";
}

/* DETECTION */
/* TOC NAVIGATING */

function fnExpandNode(oLink, bExpanding){
	var oBulletImage, oChildDiv;

	if(g_oExpandedLink == null){
		g_oExpandedLink = oLink;
	}else if(g_oExpandedLink.innerText == oLink.innerText){
		oBulletImage = oLink.firstChild;
		oChildDiv = oLink.nextSibling.nextSibling;
		if(bExpanding == null) bExpanding = (oChildDiv.currentStyle.display == "none");

		if(bExpanding){
			oChildDiv.style.display = "block";
			oBulletImage.src = oBulletImage.src.replace("_collapsed", "_expanded");
		}else{
			oChildDiv.style.display = "none";
			oBulletImage.src = oBulletImage.src.replace("_expanded", "_collapsed");
		}
	}
}

/* TOC NAVIGATING */
/* USERDATA */

function fnInitUserData(){
	g_oUserData = eUserData;

	try{
		g_oUserData.load("oWindowsUpdate");
	}catch(e){
		g_oUserData = null;
	}
}

/* USERDATA */
/* general */

function fnGetLinkFromURL(sURL){
	var vLinks, iLinksLen, i;

	vLinks = document.links;
	iLinksLen = vLinks.length;
	for(i = 0; i < iLinksLen; i++) if(vLinks[i].href == sURL) return vLinks[i];
}

/* general */