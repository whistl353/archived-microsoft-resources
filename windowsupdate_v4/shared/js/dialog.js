var conSolidProgress = false;

var g_iTotalProgressMarks, g_iTotalCount, g_iTotalSize, g_iCompletedItems, g_iCompletedSize, g_iCompletedProgressMarks, g_iWorkingTimer, g_iConnectionSpeed;
var g_dStartTime, g_oProgressBar, g_aUpdateTitles, g_bDownloading;
var g_oParent, g_iPage, g_bProperClose;

var m_oItemXML;

function fnInitDialog(iPage){
	g_iPage = iPage;
	g_oParent = window.dialogArguments[0];
	g_bProperClose = false;
	window.focus();
	fnResizeDialog();
	if("object" == typeof(eDefaultButton)) eDefaultButton.focus();
	if(g_oParent.conBrowserVersion < 5.5) document.styleSheets[0].addRule("button", "width: auto !important;height: auto !important;");
	if(g_iPage == g_oParent.conDownloadPage) fnInitInstall();
	m_oItemXML = g_oParent.xmlNewXML(); // used in fnOnItemStart
}

function document.onkeydown(){
	if(window.event.keyCode == 27) window.close();
}

function window.onbeforeunload(){
	if("object" == typeof(window.dialogArguments)){
		g_oParent = window.dialogArguments[0];
		g_oParent.g_oPopup = null;
		if(g_iPage == g_oParent.conDownloadPage){
			if(!g_bProperClose) return g_oParent.g_bCorporate ? g_oParent.L_CancelDownload_Text :  g_oParent.L_CancelInstall_Text;
		}
	}
}

function window.onunload(){
	if("object" == typeof(window.dialogArguments)){
		g_oParent = window.dialogArguments[0];
		if(g_iPage == g_oParent.conDownloadPage){
			if(g_iConnectionSpeed != null && g_iConnectionSpeed > 0) g_oParent.g_iConnectionSpeed = g_iConnectionSpeed;
			g_oParent.fnEndInstallation(g_bProperClose);
			window.close(); // Make sure window closes if they refreshed.
		}
	}
}

function fnClose(){
	g_bProperClose = true;
	window.close();
}

function fnResizeDialog(){
	var iCurrentHeight, iNewHeight;

	iCurrentHeight = document.body.offsetHeight;
	iNewHeight = document.body.scrollHeight;
	if(iNewHeight > iCurrentHeight) window.dialogHeight = iNewHeight + 25 + "px";
}

/* EULA */

function fnInitEULA(sURL){
	var vUpdateTitles, iUpdateTitlesLen, sStr, i;

	vUpdateTitles = g_oParent.g_oInstallationXML.selectNodes("catalog/provider/item/description/descriptionText[eula/@href = '" + sURL + "']/title");
	iUpdateTitlesLen = vUpdateTitles.length;
	sStr = "";
	for(i = 0; i < iUpdateTitlesLen; i++) sStr += vUpdateTitles[i].text + "\n";
	eUpdateTitles.innerText = sStr;
}

function fnEnableEULA(){
	eAcceptEULA.disabled = false;
}

/* EULA */
/* DOWNLOAD & INSTALL */

function fnInitInstall(){
	var vUpdateTitles;

	g_iCompletedItems = 0;
	g_iCompletedSize = 0;
	g_iCompletedProgressMarks = 0;
	g_bDownloading = true;
	g_oProgressBar = eDownloadProgress;
	g_iTotalCount = window.dialogArguments[1];
	g_iTotalSize = window.dialogArguments[2];

	vUpdateTitles = g_oParent.g_oInstallationXML.selectNodes("catalog/provider/item/description/descriptionText/title");

	g_aUpdateTitles = g_oParent.fnArrayFromNodesText(vUpdateTitles);
	if(conSolidProgress){
		document.styleSheets[0].addRule("body.progress td.progressBar div span", "width: 0px;");
		eDownloadProgress.appendChild(document.createElement("span"));
		eInstallProgress.appendChild(document.createElement("span"));
		g_iTotalProgressMarks = g_oProgressBar.offsetWidth - 4;
	}else{
		g_iTotalProgressMarks = (g_oProgressBar.offsetWidth - 2)/9;
	}

	eDownloadSize.innerHTML = fnGetDownloadSizeText(0, g_iTotalSize);
	fnUpdateTimeRemaining();

	eStatusMessage.innerText = g_aUpdateTitles[0];
	g_oParent.setTimeout("fnStartDownload();", 0);
}

function fnUpdateTimeRemaining(){
	var iCurrentSpeed, iSizeRemaining, iMinutesRemaining;

	iCurrentSpeed = g_oParent.control_GetHistory("", "", "GetHistoricalSpeed", "");
	if(iCurrentSpeed != false && iCurrentSpeed != "0"){
		iSizeRemaining = g_iTotalSize - g_iCompletedSize;
		g_iConnectionSpeed = parseInt(iCurrentSpeed);
		iMinutesRemaining = (iSizeRemaining/g_iConnectionSpeed)/60;
		eDownloadTime.innerHTML = fnGetDownloadTimeText(iMinutesRemaining);
	}else{
		eDownloadTimeText.innerText = "";
	}
}


function fnOnProgress(sProgress){
	var vProgress, iTotal, iCompleted, iPercentComplete;

	if(g_iWorkingTimer) window.clearTimeout(g_iWorkingTimer);

	if(sProgress != ""){
		vProgress = sProgress.split(":");
		iTotal = parseInt(vProgress[0]);
		iCompleted = parseInt(vProgress[1]);

		if(g_bDownloading){
			g_iTotalSize = iTotal;
			g_iCompletedSize = iCompleted;

			eDownloadSize.innerHTML = fnGetDownloadSizeText(g_iCompletedSize, g_iTotalSize);
		}

		iPercentComplete = (iCompleted/iTotal)*100;

		if(conSolidProgress){
			g_oProgressBar.firstChild.style.width = iPercentComplete + "%";
		}else{
			while(g_iCompletedProgressMarks < g_iTotalProgressMarks && (g_iCompletedProgressMarks/g_iTotalProgressMarks)*100 <= iPercentComplete) fnIncrementProgress(g_oProgressBar);
		}
	}

	if(conSolidProgress){
		g_iWorkingTimer = window.setInterval("fnLookBusy(2000);", 2000);
	}else{
		g_iWorkingTimer = window.setTimeout("fnLookBusy();", (g_iCompletedProgressMarks/g_iTotalProgressMarks)*400000);
	}
}

function fnOnItemStart(sOpType, sItemXML)
{
	m_oItemXML.loadXML(sItemXML);
	if(null != m_oItemXML)
	{
		// Get the ID of the current item
		var oUpdateIDNode = m_oItemXML.selectSingleNode("item/identity/@itemID");

		if(null != oUpdateIDNode)
		{
			// Lookup the title
			var oUpdateTitleNode = g_oParent.g_oInstallationXML.selectSingleNode("catalog/provider/item[identity/@itemID='" + oUpdateIDNode.text + "']/description/descriptionText/title");

			if(null != oUpdateTitleNode)
			{
				eStatusMessage.innerText = oUpdateTitleNode.text;
			}
		}
	}

	g_iCompletedItems++;

	if("DownloadUUID" == sOpType && g_iCompletedItems < g_iTotalCount){
		fnUpdateTimeRemaining();
	}

}

function fnShowProgressComplete(){
	if(conSolidProgress){
		g_oProgressBar.firstChild.style.width = "100%";
	}else{
		while(g_iCompletedProgressMarks < g_iTotalProgressMarks) fnIncrementProgress(g_oProgressBar);
	}
}

function fnOnOperationComplete(){
	if(g_iWorkingTimer) window.clearTimeout(g_iWorkingTimer);

	fnShowProgressComplete();

	if(g_oParent.g_bCorporate){
		g_bProperClose = true;
		window.close();
	}else if(g_bDownloading){
		eDownloadSize.innerHTML = fnGetDownloadSizeText(g_iTotalSize, g_iTotalSize);
		eDownloadTime.innerHTML = fnGetDownloadTimeText(0);

		eCancelButton.disabled = true;
		eWindowMessage.innerText = g_oParent.L_ProgressInstallDesc_Text;
		eStatusMessage.innerText = g_oParent.L_ProgressPreparingToInstall_Text;
		g_oProgressBar = eInstallProgress;

		g_bDownloading = false;
		g_iCompletedItems = 0;
		g_iCompletedProgressMarks = 0;

		g_oParent.setTimeout("fnOnOperationComplete();", 0);
	}else{
		g_bProperClose = true;
		window.close();
	}
}

function fnLookBusy(i){
	fnIncrementProgress(g_oProgressBar);

	if(!conSolidProgress){
		g_iWorkingTimer = window.setTimeout("fnLookBusy();", (g_iCompletedProgressMarks/g_iTotalProgressMarks)*400000);
	}
}

function fnIncrementProgress(oParent){
	if(g_iCompletedProgressMarks >= g_iTotalProgressMarks) return false;
	g_iCompletedProgressMarks++;
	if(conSolidProgress){
		oParent.firstChild.style.posWidth++;
	}else{
		oParent.appendChild(document.createElement("span"));
	}
}

function fnGetDownloadSizeText(iCompletedSize, iTotalSize){
	return g_oParent.fnFormatSize(iCompletedSize) + "/" + g_oParent.fnFormatSize(iTotalSize);
}

function fnGetDownloadTimeText(iMinutes){
	var sSize, sDownloadSizeText, iMinutes, iHours, sHours, sMinutes, bLessThan, sLessThan;

	iHours = 0;

	if(iMinutes >= 60){
		iHours = Math.floor(iMinutes/60);
		iMinutes = Math.round(iMinutes%60);
		sHours = (iHours == 1) ? g_oParent.L_Hour_Text : g_oParent.L_Hours_Text;
	}else{
		bLessThan = (iMinutes > 0 && iMinutes < 1);
		iMinutes = bLessThan ? 1 : Math.round(iMinutes);
	}

	sMinutes = (iMinutes > 0 && iMinutes < 1.5) ? g_oParent.L_Minute_Text : g_oParent.L_Minutes_Text;

	if(iHours > 0){
		sDownloadSizeText = iHours + " " + sHours + " " + iMinutes + " " + sMinutes;
	}else{
		sLessThan = bLessThan ? " &lt; " : "";
		sDownloadSizeText = sLessThan + iMinutes + " " + sMinutes;
	}

	return sDownloadSizeText;
}

/* DOWNLOAD & INSTALL */