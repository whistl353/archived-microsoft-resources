var g_oLastMenuDivStyle, g_iFadeTimer, g_iMenuLeft, g_iMenuRight, g_iMenuBottom;

function window.onload(){
	document.ondragstart = new Function("return false;");
	document.oncontextmenu = new Function("return false;");
}

function fnShowMenu(oMenuLink, oMenuDiv){
	var iMenuTop, iOffscreenWidth, oMenuDivStyle;

	window.clearTimeout(g_iFadeTimer);
	fnHideMenu();
	oMenuDivStyle = oMenuDiv.style;

	if(parent.conRTL){
		if(parent.conBrowserVersion < 5.5 && parent.conLangCode == "he"){
			g_iMenuLeft = eMSMenuPane.offsetWidth*2 - oMenuLink.offsetLeft - oMenuDiv.offsetWidth - 22;
		}else if(parent.conLangCode == "he" && oMenuLink == oMenuLink.parentElement.lastChild){
			g_iMenuLeft = 12 + oMenuLink.offsetWidth - oMenuDiv.offsetWidth + 6; /* Hack for IE6 RTL bug */
		}else{
			g_iMenuLeft = oMenuLink.offsetLeft + oMenuLink.offsetWidth - oMenuDiv.offsetWidth + 6;
		}
		if(g_iMenuLeft < 0) g_iMenuLeft = 0;
	}else{
		g_iMenuLeft = 360 + oMenuLink.offsetLeft + eMSMenuPane.offsetLeft - 12;
		iOffscreenWidth = (g_iMenuLeft + oMenuDiv.offsetWidth) - document.body.offsetWidth;
		if(iOffscreenWidth > 0) g_iMenuLeft -= iOffscreenWidth;
	}

	iMenuTop = eMSMenuPane.offsetHeight;
	g_iMenuRight = g_iMenuLeft + oMenuDiv.offsetWidth;
	g_iMenuBottom = iMenuTop + oMenuDiv.offsetHeight;

	oMenuDivStyle.left = g_iMenuLeft;
	oMenuDivStyle.top = iMenuTop;
	oMenuDivStyle.filter = "alpha(opacity=100)";
	oMenuDivStyle.visibility = "visible";
	g_oLastMenuDivStyle = oMenuDivStyle;
}

function fnFadeMenu(){
	var iCursorLeft, iCursorTop, bInsideToolbar, bInsideMenu;

	if(g_oLastMenuDivStyle != null){
		iCursorLeft = window.event.clientX;
		iCursorTop = window.event.clientY;

		bInsideToolbar = ((iCursorLeft > eMSMenuPane.offsetLeft + 26) && (iCursorLeft < document.body.offsetWidth - 12) && (iCursorTop > 2));
		bInsideMenu = ((iCursorLeft > g_iMenuLeft) && (iCursorLeft < g_iMenuRight) && (iCursorTop < g_iMenuBottom));

		if(!bInsideToolbar || !bInsideMenu){
			g_oLastMenuDivStyle.filter = "alpha(opacity=50)";
			g_iFadeTimer = window.setTimeout("fnHideMenu();", 50);
		}
	}
}

function fnHideMenu(){
	if(g_oLastMenuDivStyle != null){
		g_oLastMenuDivStyle.filter = "alpha(opacity=0)";
		g_oLastMenuDivStyle.visibility = "hidden";
		g_oLastMenuDivStyle = null;
	}
}