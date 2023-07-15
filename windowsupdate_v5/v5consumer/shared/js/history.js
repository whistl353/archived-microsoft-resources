//Copyright (c) Microsoft Corporation.  All rights reserved.
/* Global Constants*/
var g_bSortReverse, g_iLastSortBy, g_aSortOrder, g_aSortBy, g_aIgnoreCase, g_iFirstRow;
var g_oUpdateSearcher;
var g_aUpdateEvents;
var g_iRecordsPerView = 10 ; 
var g_oSelectedPageLink ;
var g_iSelectedPageLinkIndex ;
var g_iPaginLinksCount;
/* Global Constants*/

var g_iHistoryEventsCount ;
var conSortByText = 0;
var conSortByHTML = 1;
var conSortByValue = 2;


function fnInitHistory(iPage, iSubPage){  
	parent.fnTrace("fnInitHistory");
	var bUpdatesAvailable ;
	if(parent.document.readyState != "complete"){
		window.setTimeout("fnInitHistory();", 100); 
		return false;
	} 
	fnGetHistoryEventData(0); // gets history event data starting at index 0 of array.
	try {
		g_iHistoryEventsCount = g_oUpdateSearcher.GetTotalHistoryCount();
	}
	catch(e) {
		parent.fnDisplayErrorPage(e.number, true);
		return false ;
	}	 // decide what we want to do if this property fails
	g_iLastSortBy = 2;
	g_bSortReverse = true;
	fnInit(iPage, iSubPage);
	if(g_iHistoryEventsCount == 0){
		bUpdatesAvailable = false;
	}else{
		bUpdatesAvailable = true;
	}
	

	if(!bUpdatesAvailable){
		document.all["Title"].style.height = "90px" ;
		eNoUpdatesAvailable.style.height = "90px" ;
		eNoUpdatesAvailable.style.display = "block";
			
	}else{ 
		eUpdatesAvailable.style.display = "block";
		ePrint.style.visibility = "visible" ;
		eSortTableHeaderContainer.style.visibility = "visible";
		eSortTableContainer.style.visibility = "visible";
		fnWriteHistory(true);
		fnInitSortTable();
		fnHighlightCells(0);
		//fnAdjustColumns();
		//window.onresize = new Function("fnAdjustColumns();");
	}
}

/* This Function populates the array g_aUpdateEvents with chunks of history data in pieces of 10 starting with index iLowerLimit */

function fnGetHistoryEventData(iLowerLimit) {
	parent.fnTrace("fnGetHistoryEventData");
	try {
			g_oUpdateSearcher = parent.g_oControl.CreateObject("Microsoft.Update.Searcher");
			g_aUpdateEvents = parent.g_oControl.CreateObject("Microsoft.Update.UpdateColl");
			g_aUpdateEvents = g_oUpdateSearcher.QueryHistory(iLowerLimit,g_iRecordsPerView);
	}	
	catch(e){
			parent.fnDisplayErrorPage(e.number, true);
			return false ;
	}
}
	
/* Populates the History table*/

function fnWriteHistory(bFirstTimePlotTable){ 
	parent.fnTrace("fnWriteHistory");
	var iRecordsPerView = 10 ;
	if (bFirstTimePlotTable == null) bFirstTimePlotTable = false ; // Plot the table onload and onclick of paging links
	if (iRecordsPerView > g_aUpdateEvents.Count) iRecordsPerView = g_aUpdateEvents.Count ;
	fnPopulateTable(iRecordsPerView,g_aUpdateEvents,true);
	if (g_iHistoryEventsCount > 0 && bFirstTimePlotTable) fnPopulatePaging(); // don't plot paging when there is no history
}

function fnPopulateTable(iRecordsPerView,aHistoryEvents,bParentPageTable){
	parent.fnTrace("fnPopulateTable");
	var oDate, iTimezoneOffset, sSource, oTable;
	var oDoc, sTimeStamp, sDate, i ;
	var oTR, oTD, oSpan, oB, oA, iResultCode;
	
	var L_StatusSucceeded_Text = parent.L_StatusSucceeded_Text;
	var L_StatusAborted_Text = parent.L_StatusAborted_Text;
	var L_StatusFailed_Text = parent.L_StatusFailed_Text;
	
	
	if (bParentPageTable) {
		oDoc = document;
		oTable = eSortTable;
	}	
	else {
		oDoc = window.frames('PrintAllFrame').document;
		oTable = oDoc.all('IframeTable');
	}
	for(i = 0; i < iRecordsPerView; i++){
		oUpdate = aHistoryEvents.Item(i); 
		sSource = oUpdate.ClientApplicationID.toLowerCase();
		oDate = new Date(oUpdate.Date);
		iTimezoneOffset = oDate.getTimezoneOffset();
		oDate = new Date(vbsDateAdd(-iTimezoneOffset,oDate.getVarDate() ))

		try {	
			sDate = oDate.toLocaleDateString();
		}
		catch(e){ // IE 5.01 doesn't support toLocaleDateString()
			sDate = oDate.toLocaleString();
		}

		sTimeStamp = oDate.getFullYear() + "-" + (oDate.getUTCMonth() +1) +"-" + oDate.getDate() + "T" + oDate.getHours() + ":" + oDate.getMinutes() + ":" + oDate.getSeconds();

		oTR = oDoc.createElement("tr");
		oTable.appendChild(oTR);
		
		// Update Name \\
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oA = oDoc.createElement("a");
		oTD.appendChild(oA);
		oA.innerText = parent.fnSanitize(oUpdate.Title);
		oA.href = "" ;
		oA.className = "sys-link-normal" ;
		oA.onclick = new Function("fnDisplayHistoryEventDetails(" + i + ");return false;"); 
		
		// Status \\
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oA = oDoc.createElement("a");
		oA.href = "" ;
		oA.className = "sys-link-normal" ;
		oA.onclick = new Function("fnDisplayFailedEventDetails(" + i + ");return false;"); 
		
		try {
			iResultCode= oUpdate.ResultCode;
		}
		catch(e){
			iResultCode = 4 ;
		}
		
		if (iResultCode != null ){
			switch (iResultCode){
				case 2:
					oTD.value = 2 ;
					oTD.innerText =  L_StatusSucceeded_Text ;
					break ;
				case 4:
					oTD.appendChild(oA);
					oTD.value = 4 ;
					oA.innerText =  L_StatusFailed_Text ;
					break ;
				case 5:
					oTD.value = 5 ;
					oTD.innerText =  L_StatusAborted_Text ;
					break ;
				default:
					oTD.appendChild(oA);
					oTD.value = 4 ;
					oA.innerText =  L_StatusFailed_Text ; 
			}
		}
		else {
			oTD.appendChild(oA);
			oTD.value = 4 ;
			oA.innerText =  L_StatusFailed_Text ;
		}	
		
		
		// date \\
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oTD.value = sTimeStamp;
		oTD.innerHTML = parent.fnSanitize(sDate);

		// Source \\
		switch (sSource){
				case "automaticupdates":
					sSource = parent.L_AutomaticUpdates_Text;
					break ;
				case "windowsupdate":
					sSource = parent.L_WindowsUpdate_Text;
					break ;
				case "managedserver":
					sSource = parent.L_ManagedServer_Text;
					break ;
				case "dynamicupdates":
					sSource = parent.L_DynamicUpdate_Text;
					break;
				case "devicemanager":
					sSource = parent.L_DeviceManager_Text;
					break;	
				default:
					sSource = parent.L_OtherSource_Text; 
						
		}
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oTD.value = sSource;
		oTD.innerText = sSource;
		
	}
}

function fnDisplayHistoryEventDetails(iUpdateIndex){
	parent.fnTrace("fnDisplayHistoryEventDetails");	
	var sWindowName = "window" +  iUpdateIndex;
	var sURL = "itemdetails.aspx?iPage=1&index=" + iUpdateIndex + "&"  +  parent.conQueryString;
	window.open(sURL, sWindowName, "directories=no,width=400,height=400,location=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes,top = 100,left = 100");
}

function fnDisplayFailedEventDetails(iUpdateIndex){
	parent.fnTrace("fnDisplayFailedEventDetails");
	var sWindowName = "window1" +  iUpdateIndex;
	var oUpdate = g_aUpdateEvents.Item(iUpdateIndex);
	var sURL = "itemdetails.aspx?iPage=2&index=" + iUpdateIndex + "&ErrorCode=" + oUpdate.UnmappedResultCode + "&" +  parent.conQueryString;
	window.open(sURL, sWindowName, "directories=no,width=400,height=250,location=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes,top = 100,left = 100");
	
}			
/* This creates the paging section at the bottom of table*/
function fnPopulatePaging(){
	parent.fnTrace("fnPopulatePaging");	
	var i, oDoc, oSpan, oA,iUpperLimit, iLowerLimit, j ;
	j = 1 ;
	oDoc = document;
	
	if (g_iHistoryEventsCount > g_iRecordsPerView) { // Create  Previous link only if there are more records than g_iRecordsPerView
		oSpan = oDoc.createElement("span");
		ePagingContainer.appendChild(oSpan);
		oSpan.className = "SpanNoPadding" ;
		oSpan.dir = (parent.conRTL)? "rtl" : "ltr" ;
		oA = oDoc.createElement("a");
		oSpan.appendChild(oA);
		oSpan1 = oDoc.createElement("span");
		oSpan.appendChild(oSpan1);
		oSpan1.innerHTML = "&nbsp;&nbsp;&nbsp;"
		oA.innerHTML = "&lt;&lt;" + parent.L_Previous_Text ;
		oA.href = "" ;
		oA.id = "ePagingLinkPrevious";
		oA.onclick = new Function("fnDisplayPreviousSet();return false;");
		oA.className = "sys-link-normal:hover" ;
		oA.style.display = "none" ;
	} 
	
	if (g_iHistoryEventsCount > g_iRecordsPerView) {
		for (i = 1 ; i <= g_iHistoryEventsCount ; i = i + g_iRecordsPerView){  //creates paging links
		
				iLowerLimit = i;
				oSpan = oDoc.createElement("bdo");
				ePagingContainer.appendChild(oSpan);
				//oSpan.className = "SpanPadding" ;
				//oSpan.style.unicodeBidi = "bidi-override" ;
				//oSpan.style.direction = "rtl" ;
				oSpan.dir = (parent.conRTL)? "rtl" : "ltr" ;				
				oA = oDoc.createElement("a");
				oSpan.appendChild(oA);
				oSpan1 = oDoc.createElement("span");
				oSpan.appendChild(oSpan1);
				oSpan1.innerHTML = "&nbsp;&nbsp;&nbsp;"
				iUpperLimit = (g_iHistoryEventsCount > i+9)?(i+9) : g_iHistoryEventsCount ; //for paging links like 11 to 20 or 11 to 15
				//oA.style.unicodeBidi = "embed" ;
				//oA.style.direction = "ltr" ;
				oA.id = "ePagingLink" + j ;
				oA.href = "" ;
				oA.LowerLimit = iLowerLimit;
				oA.onclick = new Function("fnLinkSelect(this);return false;");
				oA.className = "sys-link-normal:hover" ;
				if (parent.conRTL) {
					iUpperLimit = fnRtlCorrection(iUpperLimit);
					iLowerLimit = fnRtlCorrection(iLowerLimit); 		
				}
		
				oA.innerText = iLowerLimit +  "-" + iUpperLimit ; //parent.L_to_Text

				if (i >= 40 ) { // only display the links till 40 records and hide rest of them.
					oSpan.style.display = "none" ;
					oSpan.id = "Hidden" ;
				}
				if (i == 1){
					oA.style.fontWeight = "bold" ;
					oA.style.textDecoration = "none";
					oA.style.cursor = "default";
					g_oSelectedPageLink = oA ;
					g_iSelectedPageLinkIndex = 1 ;
				}	
				j++ ;
			
		}
		g_iPaginLinksCount = j -1 ; // total number of paging links (hidden + visible) on the page
	}	
	
	 if (g_iHistoryEventsCount > g_iRecordsPerView) { //Display Next link only if there are more records than g_iRecordsPerView
		oSpan = oDoc.createElement("span");
		ePagingContainer.appendChild(oSpan);
		//oSpan.className = "SpanPadding" ;		
		oSpan.dir = (parent.conRTL)? "rtl" : "ltr" ;
		oA = oDoc.createElement("a");
		oSpan.appendChild(oA);
		oSpan1 = oDoc.createElement("span");
		oSpan.appendChild(oSpan1);
		oSpan1.innerHTML = "&nbsp;&nbsp;&nbsp;"
		oA.innerHTML  = parent.L_Next_Text + "&gt;&gt;" ;
		oA.href = "" ;
		oA.onclick = new Function("fnDisplayNextSet();return false;");
		oA.id = "ePagingLinkNext";
		oA.className = "sys-link-normal:hover" ;
	}
	 
	
}

/* This corrects the rendering of paging links for rtl languages */
function fnRtlCorrection(iUpperLimit){

	var iPerfectDivisor, iRemainder ;	
	if (iUpperLimit >= g_iRecordsPerView ){
		iPerfectDivisor = Math.floor(iUpperLimit/g_iRecordsPerView);
		iRemainder = iUpperLimit - (g_iRecordsPerView * iPerfectDivisor);
		iUpperLimit = iRemainder.toString() + iPerfectDivisor.toString();
	}
	return iUpperLimit;
}


/* When paging link Next is clicked */
function fnDisplayNextSet(){
	parent.fnTrace("fnDisplayNextSet");	
	var oNextLink ;
	oNextLink = document.all["ePagingLink" + (g_iSelectedPageLinkIndex + 1)] ;
	
	if (oNextLink != null) {
		if (oNextLink.parentElement.id != "Hidden"){
			fnLinkSelect(oNextLink);
		}
		else {
			oNextLink.parentElement.style.display = "inline" ;
			oNextLink.parentElement.id = "Visible" ;
			document.all["ePagingLink" + (g_iSelectedPageLinkIndex - 3)].parentElement.style.display = "none" ;
			document.all["ePagingLink" + (g_iSelectedPageLinkIndex - 3)].parentElement.id = "Hidden" ;
			fnLinkSelect(oNextLink);
		}
	}	
	
	
}

/* When paging link Previous is clicked */
function fnDisplayPreviousSet(){
	parent.fnTrace("fnDisplayPreviousSet");	
	var oPrevLink ;
	oPrevLink = document.all["ePagingLink" + (g_iSelectedPageLinkIndex - 1)] ;
	if (oPrevLink != null){
		if (oPrevLink.parentElement.id != "Hidden"){
			fnLinkSelect(oPrevLink);
		}
		else {
			oPrevLink.parentElement.style.display = "inline" ;
			oPrevLink.parentElement.id = "Visible" ;
			document.all["ePagingLink" + (g_iSelectedPageLinkIndex + 3)].parentElement.style.display = "none" ;
			document.all["ePagingLink" + (g_iSelectedPageLinkIndex + 3)].parentElement.id = "Hidden" ;
			fnLinkSelect(oPrevLink);
		}
	}
	
}

/* When any paging link is clicked , delete the rows of existing table and replot the table*/
function fnDisplayRecords(oLink){
	var oDateImage;
	parent.fnTrace("fnDisplayRecords");	
	var iRowLen, oRows, oLink ;
	oRows = eSortTable.rows ;
	iRowLen = oRows.length ;
	for(i = 0; i < iRowLen; i++) eSortTable.deleteRow(oRows[i]);
	document.images["eCol" + g_iLastSortBy].style.visibility = "hidden";;
	oDateImage = document.images["eCol2"];
	oDateImage.style.filter = "";
	oDateImage.style.visibility = "visible";
	fnGetHistoryEventData(oLink.LowerLimit - 1); //Get new history data corresponding to the paging link clicked
	fnWriteHistory(false);
	fnHighlightCells(0);
} 

/* Bolds the selected link and hide/display Next/Previous links */
function fnLinkSelect(oLink){
	var re = new RegExp("ePagingLink(\\d+)");
	 
	if(g_oSelectedPageLink){ 
		if(oLink.innerText == g_oSelectedPageLink.innerText){
			return false ;
		}
		g_oSelectedPageLink.style.fontWeight = "normal";
		g_oSelectedPageLink.style.textDecoration = "underline";
		g_oSelectedPageLink.style.cursor = "auto";
	}
	oLink.style.fontWeight = "bold";
	oLink.style.textDecoration = "none";
	oLink.style.cursor = "default";
	g_oSelectedPageLink = oLink;
	fnDisplayRecords(oLink);
	if (re.exec(oLink.id)!= null) g_iSelectedPageLinkIndex = RegExp.$1 ;
	g_iSelectedPageLinkIndex = new Number(g_iSelectedPageLinkIndex).valueOf();
	if (g_iSelectedPageLinkIndex > 1){
		if (ePagingLinkPrevious.style.display == "none"){
			ePagingLinkPrevious.style.display = "inline" ;
			//ePagingLinkPrevious.parentElement.className = "SpanPadding" ;
		}	
	}	
	else {
		ePagingLinkPrevious.style.display = "none" ;
		ePagingLinkPrevious.parentElement.className = "SpanNoPadding" ;
	}	
	
	if (g_iSelectedPageLinkIndex < g_iPaginLinksCount){
		if (ePagingLinkNext.style.display == "none"){
			ePagingLinkNext.style.display = "inline" ;
			//ePagingLinkNext.parentElement.className = "SpanPadding" ;
		}	
	}	
	else  {
		ePagingLinkNext.style.display = "none" ;
		ePagingLinkNext.parentElement.className = "SpanNoPadding" ;
	}
	
}

			
function fnAdjustColumns(){ 
	parent.fnTrace("fnAdjustColumns");
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

/*Changes the background color of table rows*/
function fnHighlightCells(iStart){
	parent.fnTrace("fnHighlightCells");
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
function fnInitSortTable(){
	parent.fnTrace("fnInitSortTable");
	var vColHeaders, oColHeaderLink, bApplyStyles, iCols, i, oDateImage;
	
	oDateImage = document.images["eCol2"];
	oDateImage.style.visibility = "visible";
	
	vColHeaders = eSortTableHeader.firstChild.children;
	eSortTableHeader.firstChild.onselectstart = new Function("return false;");
	bApplyStyles = (eSortTableHeader.applystyles != "false");
	g_iFirstRow = eSortTableHeader.firstrow;
	g_iFirstRow = (g_iFirstRow == null) ? 0 : parseInt(g_iFirstRow);
	iCols = vColHeaders.length;
	g_aSortOrder = new Array(iCols);
	g_aSortBy = new Array(iCols);
	g_aIgnoreCase = new Array(iCols);
	for(i = 0; i < iCols; i++){
		g_aSortOrder[i] = i;
		oColHeaderLink = vColHeaders[i].firstChild;

		if(oColHeaderLink.sortby == "html"){
			g_aSortBy[i] = conSortByHTML;
		}else if(oColHeaderLink.sortby == "value"){
			g_aSortBy[i] = conSortByValue;
		}else{
			g_aSortBy[i] = conSortByText;
		}

		g_aIgnoreCase[i] = (oColHeaderLink.ignorecase == "true");
	}
}

function fnSortTable(iSortBy){
	parent.fnTrace("fnSortTable");
	var vRows, iRowsLen, oRow, bIgnoreCase, iSortByValue, oSortImage, aValues, sBaseValue, sCompareValue, sGreatestValue, bBaseIsGreater, i, j, k;
	var iBaseValue, iGreatestValue, iCompareValue, oCell;

	vRows = eSortTable.rows;
	iRowsLen = vRows.length;
	bIgnoreCase = g_aIgnoreCase[iSortBy];
	iSortByValue = g_aSortBy[iSortBy];

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

/* Prints all the history by pulling all the history items in hidden iframe*/
function fnPrintAll(){
	parent.fnTrace("fnPrintAll");
	var oDoc, oTable, oTbody, oParentTable, oTR, oTH, oThead, oChildNodes, oColGroup, oCol ;
	var aAllUpdateEvents = parent.g_oControl.CreateObject("Microsoft.Update.UpdateColl");
	
	aAllUpdateEvents = g_oUpdateSearcher.QueryHistory(0,g_iHistoryEventsCount);
	oDoc = window.frames('PrintAllFrame').document;
	oChildNodes = oDoc.body.childNodes;
	if (oChildNodes.length > 0) oDoc.body.removeChild(oChildNodes(0)); // removes all HTML from the body
	//TABLE \\		
	oTable = oDoc.createElement("table");
	oDoc.body.appendChild(oTable);
	oTable.width = "97%";
	oTable.className = "sys-table-color-border" ;
	oTable.style.font = "messagebox";
	oTable.border = "1px solid #6681D9";
	oTable.cellSpacing = "0";
	
	// COLGROUP\\ 
	oColGroup = oDoc.createElement("colgroup");
	oTable.appendChild(oColGroup);
	oCol = oDoc.createElement("col");
	oColGroup.appendChild(oCol);
	oCol.width = "42%" ;
	oCol.className = "sys-table-color-border";
	oCol = oDoc.createElement("col");
	oColGroup.appendChild(oCol);
	oCol.width = "12%" ;
	oCol.className = "sys-table-color-border";
	oCol = oDoc.createElement("col");
	oColGroup.appendChild(oCol);
	oCol.width = "25%" ;
	oCol.className = "sys-table-color-border";
	oCol = oDoc.createElement("col");
	oColGroup.appendChild(oCol);
	oCol.width = "21%" ;
	oCol.className = "sys-table-color-border"; 
	
	// THEAD\\
	oThead = oDoc.createElement("tHead");
	oTable.appendChild(oThead);
	oTR = oDoc.createElement("tr");
	oThead.appendChild(oTR);
	oTH = oDoc.createElement("th");
	oTR.appendChild(oTH);
	oTH.innerText = parent.L_UpdateName_Text;
	oTH = oDoc.createElement("th");
	oTR.appendChild(oTH);
	oTH.innerText = parent.L_Status_Text;
	oTH = oDoc.createElement("th");
	oTR.appendChild(oTH);
	oTH.innerText = parent.L_Date_Text;
	oTH = oDoc.createElement("th");
	oTR.appendChild(oTH);
	oTH.innerText = parent.L_Source_Text;
	
	// TBODY\\
	oTbody = oDoc.createElement("tBody");
	oTable.appendChild(oTbody);
	oTbody.id = "IframeTable";
	oTbody.name = "IframeTable";
	fnPopulateTable(g_iHistoryEventsCount,aAllUpdateEvents,false); 
	document.frames['PrintAllFrame'].window.focus() ;
	document.frames['PrintAllFrame'].window.print() ;
}
