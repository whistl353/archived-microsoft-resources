//Copyright (c) Microsoft Corporation.  All rights reserved.
var g_oSelectedLink, g_oUserData;
var eWelcome;

function fnInitTOC(){
	eWelcome = parent.eToolbar.document.all("eHome");
	g_oSelectedLink = eWelcome ;
	fnInitUserData();
	document.onselectstart = new Function("return false;");
	document.onmouseup = fnLinkNormal;
	document.ondragend = fnLinkNormal;
	if (eWelcome != null) fnEnableLink(eWelcome, false);
	fnEnableLink(eBasketUpdates, false); 
	window.setTimeout("fnSetAllLinksEffects();", 0);
}

function window.onbeforeunload(){
	try{
		if(g_oUserData != null) g_oUserData.save("oWindowsUpdate");
	}catch(e){}
}

function fnSyncTOC(sURL, iPage, iSubPage){ 
	var oLink, sLinkId ;  
	var re = new RegExp("LinkId=(\\w+)");
	
	if(iPage == parent.conErrorPage){
		oLink = eWelcome;
	}else if(iPage == parent.conSplashPage){
		if(iSubPage == parent.conSplashWelcome){
			oLink = eWelcome;
			parent.g_bSPMode = false;// set this to false to make sure that users are offered SP page instead of regular results page
		}
	}else if(iPage == parent.conResultsPage){ 
		if(iSubPage == parent.conResultsCritical){
			oLink = (parent.g_aToc.length > 0)? document.all["critical"][1] : eWelcome ;
		}else if(iSubPage == parent.conResultsBasket){
			oLink = eBasketUpdates;
		}else if(iSubPage == parent.conResultsBeta){
			oLink = (parent.g_aToc.length > 0)? document.all["beta"][1] : eWelcome;
		}else if(iSubPage == parent.conResultsHidden){
			oLink = eHidden ;
		}else if(iSubPage == parent.conResultsDrivers){
			if (re.exec(sURL)!= null) sLinkId = RegExp.$1 ;
			oLink = (parent.g_aToc.length > 0)? document.all[sLinkId][1] : eWelcome;
		}else if(iSubPage == parent.conResultsProduct){
			if (re.exec(sURL)!= null) sLinkId = RegExp.$1 ;
			oLink = (parent.g_aToc.length > 0)? document.all[sLinkId][1] : eWelcome;	
		}
		
	}else if(iPage == parent.conHistoryPage){
		oLink = eHistory;
	}else if(iPage == parent.conPersonalizationPage){
		oLink = eAdvancedSettings;
	}else if(iPage == parent.conStatusPage){
		oLink = eBasketUpdates;
	}else if(iPage == parent.conSupportPage){
		oLink = eSupport;
	}else if(iPage == parent.conAdministratorsPage){
		oLink = eAdmin;	
	}else{
		oLink = fnGetLinkFromURL(sURL);
	}
	//alert(iPage + "\n" + sURL);
	if("object" == typeof(oLink) && oLink != null ) fnLinkSelect(oLink);
	else  {
		if (g_oSelectedLink){
			g_oSelectedLink.className = "sys-link-normal";	
			g_oSelectedLink = null;
		}	
	}	
}

function fnEnableBetaTree(){
	var sBetaTreeEnabled,oNodes  ;
	sBetaTreeEnabled = g_oUserData.getAttribute("bBetaLink"); 
	oNodes = document.all(parent.conCategoryBeta);
	if(oNodes != null){
		if (sBetaTreeEnabled == 1){
			oNodes[0].style.display = "block" ;
		}
		else {
			oNodes[0].style.display = "none" ;
		}
	}	 
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
	for(i = 0; i < iLinksLen; i++){
		if (vLinks[i].id != "eHardwareSupport" ) fnSetLinkEffects(vLinks[i]);
	}	
		
}

function fnSetLinkEffects(oLink){ 
	oLink.onmouseup = new Function("if(window.event && window.event.button == 1) fnLinkSelect(this);");
}

function fnEnableTOC(){
	fnEnableLink(eWelcome, true);
	eWelcome.onclick = new Function("parent.fnDisplaySplashPage(parent.conSplashWelcome);return false;"); 
	fnEnableLink(eHistory, true);
		
}

function fnDisableTOC(){ 
	fnEnableLink(eWelcome, true);
	eWelcome.onclick = new Function("parent.fnDisplaySplashPage(parent.conSplashInstallingControl);return false;");
	fnEnableLink(eHistory, false);
	fnEnableLink(eAdvancedSettings, false);
}

function fnEnableLink(oLink, bEnable){  
	if(bEnable == null) bEnable = true;

	if(bEnable){
		if (oLink.getAttribute("url")!= null)	oLink.href = oLink.getAttribute("url");
		else oLink.href = "" ;
		oLink.className = "sys-link-normal";
		oLink.disabled = false ;
		if (oLink.id != "eHardwareSupport" ) fnSetLinkEffects(oLink);
	}else{
		if(g_oSelectedLink == oLink) g_oSelectedLink = null;
		oLink.removeAttribute("href");
		oLink.className = "sys-link-disabled";
		oLink.disabled = true ;
		
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
		if(oLink.innerText == g_oSelectedLink.innerText){
			 if (typeof(oLink.getAttribute("ID")) == "string" && typeof(g_oSelectedLink.getAttribute("ID")) == "string" ){
				if (oLink.getAttribute("ID") == g_oSelectedLink.getAttribute("ID")) return false ; // if the same link is selected again
			 }
			 else { 
				return false;
			 }	
		}
		else if (g_oSelectedLink.getAttribute("ID") == oLink.getAttribute("ID") && window.event == null ){ 
			return false ;
		}
		g_oSelectedLink.className = "sys-link-normal";
	}

	oLink.className = "sys-toppane-selection sys-link-normal";
	g_oSelectedLink = oLink;
	
}

/* LINK EVENTS */
/* DETECTION */

function fnInitDetectUpdates(){
	if("object" != typeof(eAvailableUpdatesDiv)){
		window.setTimeout("fnInitDetectUpdates();", 50);
		return false;
	}
	if (eAvailableUpdatesDiv.style.display == "block"){
		eAvailableUpdatesDiv.style.display = "none";
		parent.sTOC = "<ul class='RootUL'>";
	}
	if(parent.g_bDetectedItems){ // already scanned
		fnEnableLink(eBasketUpdates, false);
		parent.g_iConsumerBasketCount = 0;
		eBasketUpdates.children[1].innerText = "";
		eBasketUpdates.style.fontWeight = "";
	}
	
	
}

/* DETECTION */
/* TOC NAVIGATING */
// Expands and collapses the TOC category tree
function fnClickTOCtree(oLink){ 
	var bExpanding , sId, oUlChildren, sTocIndex ; 
	try { 
		var oSelectedNode = oLink.parentNode.parentNode ;
			 
		if (typeof(oSelectedNode) == "object" && oSelectedNode.tagName == 'LI' && oSelectedNode.getAttribute("LeafNode") != "true" ){
			if (oSelectedNode.nextSibling != null && oSelectedNode.nextSibling.childNodes.length != 0 && oSelectedNode.nextSibling.id == "U" + oSelectedNode.id ){ 
				if(bExpanding == null) bExpanding = (oSelectedNode.nextSibling.currentStyle.display == "none");
				if (bExpanding){ // expand the node 
					oLink.children[0].src = oLink.children[0].src.replace("_collapsed", "_expanded"); 
					oUlChildren = oSelectedNode.parentNode.getElementsByTagName("UL");
					fnHideUlContainers(oUlChildren);
					oSelectedNode.nextSibling.style.display = 'block';
					fnDisplayUpdates(oSelectedNode);
				}
				else {  // collapse the node 
					oLink.children[0].src = oLink.children[0].src.replace("_expanded", "_collapsed"); 
					oUlChildren = oSelectedNode.nextSibling.getElementsByTagName("UL") ;
					fnHideUlContainers(oUlChildren);
					oSelectedNode.nextSibling.style.display = 'none';	
					fnDisplayUpdates(oSelectedNode);
				}	
			}
			else { // when "critical" section is clicked
				oUlChildren = oSelectedNode.parentNode.getElementsByTagName("UL");
				fnHideUlContainers(oUlChildren);
				fnDisplayUpdates(oSelectedNode);
			}	
		}
		else if(typeof(oSelectedNode) == "object" && oSelectedNode.getAttribute("LeafNode") == "true"){
			
			oUlChildren = oSelectedNode.parentNode.getElementsByTagName("UL");
			fnHideUlContainers(oUlChildren);
			sId = fnGetCategoryValue(oSelectedNode) ;
			sTocIndex = oSelectedNode.getAttribute("TocIndex") ;
			if (sTocIndex == null) sTocIndex = "" ;
			parent.fnPostData(oSelectedNode.getAttribute("UpdateArrayIndexes"), parent.conConsumerURL + "resultslist.aspx?" + parent.conQueryString + "&id=" + sId + "&LinkId=" + oSelectedNode.getAttribute("ID") + "&TocIndex=" + sTocIndex);
		}
	}
	catch(e){
	}
	
} 

/* hides the collection of "<UL>" elements passed as parameter */
function fnHideUlContainers(oUlChildren) {
	var oUlChildrenLength, j ;
	oUlChildrenLength = oUlChildren.length ;
	for (j = 0; j < oUlChildrenLength ; j++) {
		if (oUlChildren[j].style.display == 'block'){
			oUlChildren[j].previousSibling.children[0].children[0].children[0].src = oUlChildren[j].previousSibling.children[0].children[0].children[0].src.replace("_expanded", "_collapsed");
			oUlChildren[j].style.display = 'none' ;
		}	
	}	
} 


/* Display updates on the results page when a node in TOC category tree is selected */
function fnDisplayUpdates(oSelectedNode){
	var sUpdateArrayIndexes, sId, sTocIndex ;
	sUpdateArrayIndexes = oSelectedNode.getAttribute("UpdateArrayIndexes");
	if (sUpdateArrayIndexes != null){
		sId = fnGetCategoryValue(oSelectedNode) ;
		sTocIndex = oSelectedNode.getAttribute("TocIndex") ;
		if (sTocIndex == null) sTocIndex = "" ;
		parent.fnPostData(sUpdateArrayIndexes, parent.conConsumerURL + "resultslist.aspx?" + parent.conQueryString + "&id=" + sId + "&LinkId=" + oSelectedNode.getAttribute("ID") + "&TocIndex=" + sTocIndex);
	}	
}



/*Gets the category id for selected node e.g "critical" , "beta" , "optional" etc   */
function fnGetCategoryValue(oUpdateCategory){
	var sId, re, aMatches  ;
	if (typeof(oUpdateCategory) == "object") {
		try {
			sId = oUpdateCategory.getAttribute("ID") ;
			re = new RegExp("(\\D+)\\d*","i")
			aMatches = re.exec(sId);
			if (aMatches != null ) sId = RegExp.$1 ;
		}
		catch (e){
			return "" ;
		}	
		 
		if (sId == parent.conCategoryCritical){
			sId = parent.conResultsCritical ;
		} 
		else if (sId == parent.conCategoryBeta){
			sId = parent.conResultsBeta ; 
		}
		else if (sId == parent.conCategoryHardware){
			sId = parent.conResultsDrivers ; 
		}
		else {
			sId = parent.conResultsProduct ;
		}
	}
	return sId ;	
} 
/* TOC NAVIGATING */
/* USERDATA */

function fnInitUserData(){
	g_oUserData = eUserData ;
	
	try{
		g_oUserData.load("oWindowsUpdate");
	}catch(e){
		//g_oUserData = null;
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
function fnUpdateTOCCount(){ 
	var oCriticalLink, oSoftwareLink , oHardwareLink , oBetaLink ;  
	var sCriticalUpdates ,sSoftwareUpdates,sHardwareUpdates,sBetaUpdates;
	var iCriticalCount = 0, iSoftwareCount = 0, iHardwareCount = 0, iBetaCount= 0;
	try { 
		if((!parent.g_bExpressScan) && (parent.g_aUpdate.length > 0) ){
			oCriticalLink = document.all[parent.conCategoryCritical][1]
			oSoftwareLink = document.all[parent.conCategorySoftware][1]
			oHardwareLink = document.all[parent.conCategoryHardware][1]
			oBetaLink = document.all[parent.conCategoryBeta][1]
			
			sCriticalUpdates = parent.fnGetCategoryLevelUpdates(parent.conCategoryCritical,null);
			sBetaUpdates = parent.fnGetCategoryLevelUpdates(parent.conCategoryBeta,null);
			sHardwareUpdates = parent.fnGetCategoryLevelUpdates("optional",parent.conHardware); 
			sSoftwareUpdates = parent.fnGetCategoryLevelUpdates("optional",parent.conSoftware); 
			
			if(sCriticalUpdates != "")	iCriticalCount = parent.fnGetActualCategoryLevelUpdateCount(sCriticalUpdates);
			if(sBetaUpdates != "")	iBetaCount = parent.fnGetActualCategoryLevelUpdateCount(sBetaUpdates);
			if(sHardwareUpdates != "")	iHardwareCount = parent.fnGetActualCategoryLevelUpdateCount(sHardwareUpdates);
			if(sSoftwareUpdates != "")	iSoftwareCount = parent.fnGetActualCategoryLevelUpdateCount(sSoftwareUpdates);
			oCriticalLink.childNodes(2).innerText ="(" + iCriticalCount + ")";
			oSoftwareLink.childNodes(2).innerText ="(" + iSoftwareCount + ")";
			oHardwareLink.childNodes(2).innerText ="(" + iHardwareCount + ")";
			oBetaLink.childNodes(2).innerText ="(" + iBetaCount + ")";
		}
	} catch(e) {}
}
