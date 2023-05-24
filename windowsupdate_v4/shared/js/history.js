var g_oInstallationXML;

function fnInitHistory(iPage, iSubPage){
	var sXML, oXML;

	if(parent.document.readyState != "complete"){
		window.setTimeout("fnInitHistory();", 100);
		return false;
	}

	if(parent.g_bCorporate){
		g_iLastSortBy = 0;
		g_bSortReverse = true;
		sXML = parent.control_GetHistory("", "", "IU_CORP_SITE", "");
	}else{
		g_iLastSortBy = 1;
		g_bSortReverse = true;
		sXML = parent.control_GetHistory("", "", "", "");
	}

	if(sXML == "" || sXML == false){
		bUpdatesAvailable = false;
	}else{
		fnInit(iPage, iSubPage);

		oXML = parent.xmlNewXML();
		oXML.loadXML(sXML);

		if(parent.g_bSaveXML) top.fnSaveXML(sXML, "History");

		if(parent.g_bCorporate){
			bUpdatesAvailable = true;
		}else{
			bUpdatesAvailable = (oXML.documentElement.selectNodes("itemStatus[description/@hidden != '1']").length > 0);
		}
	}

	if(!bUpdatesAvailable){
		eNoUpdatesAvailable.style.display = "block";
		eSortTableHeaderContainer.style.visibility = "hidden";
		eSortTableContainer.style.visibility = "hidden";
	}else{
		eUpdatesAvailable.style.display = "block";
		eSortTableHeaderContainer.style.visibility = "visible";
		eSortTableContainer.style.visibility = "visible";

		g_oInstallationXML = oXML.documentElement;

		fnWriteHistory();
		fnInitSortTable();
		fnHighlightCells(1);
		fnAdjustColumns();
		window.onresize = new Function("fnAdjustColumns();");
	}
}

function fnWriteHistory(){
	var L_StatusComplete_Text = parent.L_StatusComplete_Text;
	var L_StatusInProgress_Text = parent.L_StatusInProgress_Text;
	var L_StatusFailed_Text = parent.L_StatusFailed_Text;
	var L_StatusCanceled_Text = parent.L_StatusCanceled_Text;
	var L_Details_Text = parent.L_Details_Text;
	var L_ReadMore_Text = parent.L_ReadMore_Text;
	var L_ReadMoreNotEnglish_Text = parent.L_ReadMoreNotEnglish_Text;
	var L_Location_Text = parent.L_Location_Text;
	var L_FailedToDownload_Text = parent.L_FailedToDownload_Text;
	var L_CanceledDownload_Text = parent.L_CanceledDownload_Text;
	var L_SourceIUSite_Text = parent.L_SourceIUSite_Text;
	var L_SourceCDM_Text = parent.L_SourceCDM_Text;
	var L_SourceWUV3_Text = parent.L_SourceWUV3_Text;
	var L_SourceAU_Text = parent.L_SourceAU_Text;
	var L_SourceOther_Text = parent.L_SourceOther_Text;

	var vUpdates, iUpdatesLen, oUpdate, oDoc, bCorporate,  sSource, sTimeStamp, sDate, oInstallStatusValue, bSuccessful, sQS, oDetails, sPlatform, i, j;
	var oTitle, sTitle, oDownloadPath, sDownloadPath, oManufacturer, sManufacturer, oReadMore, sReadMore, oSize, sSize, oDatePosted, sDatePosted, oSuite, sSuite, oProductType, sProductType;
	var oTR, oTD, oSpan, oB, oBr, oText, oA,stimestampcat, sURL, oRegExp;

	oDoc = document;
	bCorporate = parent.g_bCorporate;

	if(parent.g_bCorporate){
		vUpdates = g_oInstallationXML.selectNodes("itemStatus")
		parent.g_oInstallationXML = g_oInstallationXML
	}else{
		vUpdates = g_oInstallationXML.selectNodes("itemStatus[description/@hidden != '1']")
	}

	iUpdatesLen = vUpdates.length;
	for(i = 0; i < iUpdatesLen; i++){
		oUpdate = vUpdates[i];

		sSource = oUpdate.selectSingleNode("client").text.toLowerCase();
		if(!parent.g_bCorporate && sSource == "iu_corp_site") continue;
		sTimeStamp = oUpdate.getAttribute("timestamp");
		if(sTimeStamp == null) sTimeStamp = oUpdate.getAttribute("timeStamp");
		sDate = sTimeStamp.substr(0, 10);
		sDate = parent.vbsToLocaleDateString(sDate);
		oTR = oDoc.createElement("tr");
		eSortTable.appendChild(oTR);

		if(!parent.g_bCorporate){
			// status \\
			oTD = oDoc.createElement("td");
			oTR.appendChild(oTD);

			if(sSource == "cdm"){
				oInstallStatusValue = oUpdate.selectSingleNode("downloadStatus[@value = 'COMPLETE']/@value");
			}else{
				oInstallStatusValue = oUpdate.selectSingleNode("installStatus[@value = 'COMPLETE' or @value = 'IN_PROGRESS']/@value");
			}

			if(oInstallStatusValue != null){
				if(oInstallStatusValue.text == "COMPLETE"){
					oTD.value = 0;
					oTD.innerText = L_StatusComplete_Text;
				}else{
					oTD.value = 1;
					oTD.innerText = L_StatusInProgress_Text;
				}
			}else if(oUpdate.selectSingleNode("downloadStatus[@errorCode = '-2147467260']") != null || oUpdate.selectSingleNode("installStatus[@errorCode = '-2147467260']")){
				oTD.value = 2;
				oTD.innerText = L_StatusCanceled_Text;
			}else{
				oTD.value = 3;
				oTD.innerText = L_StatusFailed_Text;
			}
		}

		// date \\
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);

		oTD.value = sTimeStamp;
		oTD.innerText = sDate;

		// description \\
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);

		oTitle = oUpdate.selectSingleNode("description/descriptionText/title");
		sTitle = (oTitle == null || oTitle.text == "") ? parent.L_HistoryNoTitle_Text : oTitle.text;

		oB = oDoc.createElement("b");
		oTD.appendChild(oB);

		oB.innerText = sTitle;

		if(parent.g_bCorporate){
			oDownloadPath = oUpdate.selectSingleNode("downloadPath");
			sDownloadPath = (oDownloadPath == null) ? "" : oDownloadPath.text;
			oManufacturer = oUpdate.selectSingleNode("identity/publisherName");
			sManufacturer = (oManufacturer == null) ? "" : oManufacturer.text;
			oReadMore = oUpdate.selectSingleNode("description/descriptionText/details");
			sReadMore = (oReadMore == null) ? "" : oReadMore.getAttribute("href")
			oSize = oUpdate.selectSingleNode("description/size");
			sSize = (oSize == null) ? "" : oSize.text;
			stimestampcat=oUpdate.getAttribute("timestamp");
			oDatePosted = oUpdate.selectSingleNode("description");
			sDatePosted = oDatePosted.getAttribute("timestamp")
			sDatePosted = sDatePosted.substring(0, 10);
			sDatePosted = parent.vbsToLocaleDateString(sDatePosted);

			if(oDownloadPath != null){
				oBr = oDoc.createElement("br");
				oTD.appendChild(oBr);

				bSuccessful = (oUpdate.selectSingleNode("downloadStatus[@value = 'COMPLETE']") != null);

				if(bSuccessful){
					oText = oDoc.createTextNode(L_Location_Text + " " );
					oTD.appendChild(oText);
					sURL = oDownloadPath.text;
					oSpan = oDoc.createElement("span");
					oTD.appendChild(oSpan);
					oSpan.innerText = sURL;
					oSpan.title = sURL;
					/*if(sURL.indexOf("javascript:") == -1){
						oA = oDoc.createElement("a");
						oTD.appendChild(oA);
						oA.innerText = sURL;
						oA.href = sURL;
						oA.title = sURL;
						oA.target = "path";
						oA.className = "sys-link-normal"
					}*/
				}else{
					oText = oDoc.createTextNode(L_Location_Text + " ");
					oSpan = oDoc.createElement("span");
					oTD.appendChild(oText);
					oTD.appendChild(oSpan);
					oSpan.innerText = L_FailedToDownload_Text;
					if(oUpdate.selectSingleNode("downloadStatus/@errorCode").text == "-2147467260") oSpan.innerText = L_CanceledDownload_Text;
					sDownloadPath = oSpan.innerText;
					oSpan.className = "sys-color-body-alert";
				}
			}

			oSuite = oUpdate.selectSingleNode("platform/suite");
			sSuite = (oSuite == null) ? "" : oSuite.text;
			oProductType = oUpdate.selectSingleNode("platform/productType");
			sProductType = (oProductType == null) ? "" : oProductType.text;

			oBr = oDoc.createElement("br");
			oTD.appendChild(oBr);
			sPlatform = oUpdate.selectSingleNode("platform/@name").text + "." + oUpdate.selectSingleNode("platform/version/@major").text + "." + oUpdate.selectSingleNode("platform/version/@minor").text
			sPlatform += "." + oUpdate.selectSingleNode("platform/processorArchitecture").text + "." + sProductType + "." + sSuite + "." + oUpdate.selectSingleNode("platform/version/@build").text
			sPlatform += "." + oUpdate.selectSingleNode("platform/version/@servicePackMajor").text  + "." + oUpdate.selectSingleNode("platform/version/@servicePackMinor").text

			sQS = "&size=" + sSize + "&platform=" + sPlatform + "&stimestamp=" + stimestampcat;
			sQS = parent.fnEscapeString(sQS);
			sURL = oUpdate.selectSingleNode("identity/@itemID").text + sQS;

			if(sURL.indexOf("'") == -1 && sURL.indexOf("%") == -1){
				oA = oDoc.createElement("a");
				oTD.appendChild(oA);
				oA.innerText = L_Details_Text;
				oA.href = "";
				oA.onclick = new Function("parent.fnDisplayDetails('" + sURL + "');return false;");
				oA.className = "sys-link-normal"
			}
		}else{
			oDetails = oUpdate.selectSingleNode("description/descriptionText/details/@href");

			if(oDetails != null){
				sURL = oDetails.text;

				oRegExp = new RegExp("^http://[a-z0-9_\./]+$", "gi");

				if(oRegExp.test(sURL)){
					oBr = oDoc.createElement("br");
					oTD.appendChild(oBr);

					oA = oDoc.createElement("a");
					oTD.appendChild(oA);

					oA.innerText = L_ReadMore_Text;
					oA.href = "";
					oA.onclick = new Function("parent.fnDisplayDetails('" + sURL + "');return false;");
					oA.className = "sys-link-normal";

					if(parent.conLangCode != "en"){
						oText = oDoc.createTextNode(" " + L_ReadMoreNotEnglish_Text);
						oTD.appendChild(oText);
					}
				}
			}
		}

		if(!parent.g_bCorporate){
			// source \\
			oTD = oDoc.createElement("td");
			oTR.appendChild(oTD);

			if(sSource == "iu_site"){
				oTD.innerText = L_SourceIUSite_Text;
			}else if(sSource == "cdm"){
				oTD.innerText = L_SourceCDM_Text;
			}else if(sSource == "wu_v3"){
				oTD.innerText = L_SourceWUV3_Text;
			}else if(( sSource == "au") || (sSource == "aus") ){
				oTD.innerText = L_SourceAU_Text;
			}else{
				oTD.innerText = L_SourceOther_Text;
			}
		}
	}
}

function fnAdjustColumns(){
	var oTD = eSortTableHeader.firstChild.lastChild;

	if(eSortTableContainer.scrollHeight >= eSortTableContainer.offsetHeight){
		eSortTableHeaderContainer.style.overflowY = "scroll";
		oTD.style.borderRightWidth = "0px";
		oTD.firstChild.style.borderRightWidth = "0px";
	}else{
		eSortTableHeaderContainer.style.overflowY = "auto";
		oTD.style.borderRightWidth = "";
		oTD.firstChild.style.borderRightWidth = "";
	}
}

function fnHighlightCells(iStart){
	if(iStart == null) iStart = 0;

	var vRows, iRowsLen, bHighlight, iFinish, i;

	vRows = eSortTable.rows;
	iRowsLen = vRows.length;
	bHighlight = false;
	iFinish;

	iFinish = iStart + 30;
	if(iFinish > iRowsLen) iFinish = iRowsLen;

	for(i = iStart; i < iFinish; i++){
		vRows[i].className = bHighlight ? "sys-table-cell-bgcolor2" : "sys-table-cell-bgcolor1";
		bHighlight = !bHighlight;
	}

	if(iFinish < iRowsLen) window.setTimeout("fnHighlightCells(" + iFinish + ");", 0);
}

/* sorttable */

var conSortByText = 0;
var conSortByHTML = 1;
var conSortByValue = 2;

var g_bSortReverse, g_iLastSortBy, g_aSortOrder, g_aSortByValue, g_aIgnoreCase, g_iFirstRow;

function fnInitSortTable(){
	var vColHeaders, oColHeaderLink, bApplyStyles, iCols, i;

	vColHeaders = eSortTableHeader.firstChild.children;
	eSortTableHeader.firstChild.onselectstart = new Function("return false;");
	bApplyStyles = (eSortTableHeader.applystyles != "false");
	g_iFirstRow = eSortTableHeader.firstrow;
	g_iFirstRow = (g_iFirstRow == null) ? 0 : parseInt(g_iFirstRow);
	iCols = vColHeaders.length;
	g_aSortOrder = new Array(iCols);
	g_aSortByValue = new Array(iCols);
	g_aIgnoreCase = new Array(iCols);
	for(i = 0; i < iCols; i++){
		g_aSortOrder[i] = i;
		oColHeaderLink = vColHeaders[i].firstChild;

		if(oColHeaderLink.sortby == "html"){
			g_aSortByValue[i] = conSortByHTML;
		}else if(oColHeaderLink.sortby == "value"){
			g_aSortByValue[i] = conSortByValue;
		}else{
			g_aSortByValue[i] = conSortByText;
		}

		g_aIgnoreCase[i] = (oColHeaderLink.ignorecase == "true");
	}
}

function fnSortTable(iSortBy){
	var vRows, iRowsLen, oRow, bIgnoreCase, iSortByValue, oSortImage, aValues, sBaseValue, sCompareValue, sGreatestValue, bBaseIsGreater, i, j, k;
	var iBaseValue, iGreatestValue, iCompareValue, oCell;

	vRows = eSortTable.rows;
	iRowsLen = vRows.length;
	bIgnoreCase = g_aIgnoreCase[iSortBy];
	iSortByValue = g_aSortByValue[iSortBy];

	g_bSortReverse = (!g_bSortReverse && iSortBy == g_iLastSortBy) || (g_bSortReverse && iSortBy != g_iLastSortBy);

	// set sortImage \\
	oSortImage = document.images["eCol" + iSortBy];
	oSortImage.style.filter = g_bSortReverse ? "" : "flipV()";
	oSortImage.style.visibility = "visible";

	if(iSortBy != g_iLastSortBy){
		oSortImage = document.images["eCol" + g_iLastSortBy];
		oSortImage.style.visibility = "hidden";
	}

	// store values \\
	aValues = new Array(iRowsLen - g_iFirstRow);
	for(i = 0; i < iRowsLen - g_iFirstRow; i++){
		oCell = vRows[i + g_iFirstRow].children[iSortBy];

		if(iSortByValue == conSortByHTML){
			sBaseValue = oCell.innerHTML;
		}else if(iSortByValue == conSortByValue){
			sBaseValue = oCell.value;
		}else{
			sBaseValue = oCell.innerText;
		}

		if(bIgnoreCase) sBaseValue = sBaseValue.toLowerCase();

		aValues[i] = sBaseValue;
	}

	// sort \\
	for(iBaseValue = 0; iBaseValue < iRowsLen - g_iFirstRow; iBaseValue++){
		sBaseValue = aValues[iBaseValue];

		sGreatestValue = sBaseValue;
		iGreatestValue = iBaseValue;

		for(iCompareValue = iBaseValue + 1; iCompareValue < iRowsLen; iCompareValue++){
			sCompareValue = aValues[iCompareValue];

			bBaseIsGreater = g_bSortReverse ? (sGreatestValue < sCompareValue) : (sGreatestValue > sCompareValue);

			if(bBaseIsGreater){
				sGreatestValue = sCompareValue;
				iGreatestValue = iCompareValue;
			}
		}

		if(iGreatestValue != iBaseValue){
			eSortTable.moveRow(iGreatestValue + g_iFirstRow, iBaseValue + g_iFirstRow);
			fnMoveInArray(aValues, iGreatestValue, iBaseValue);
		}
	}

	g_iLastSortBy = iSortBy;
}

function fnMoveInArray(aArray, iIndexFrom, iIndexTo){
	var sMoveValue, i;

	sMoveValue = aArray[iIndexFrom];

	if(iIndexFrom > iIndexTo){
		for(i = iIndexFrom; i > iIndexTo; i--) aArray[i] = aArray[i - 1];
	}else if(iIndexFrom < iIndexTo){
		for(i = iIndexFrom; i < iIndexTo; i++) aArray[i] = aArray[i + 1];
	}

	aArray[iIndexTo] = sMoveValue;
}