//Copyright (c) Microsoft Corporation.  All rights reserved.
var sExclusiveUpdates = "" ,sCriticalUpdates = "" ,sOptionalUpdates = "";   // variables to hold 3 different kind of updates
var aExclusiveUpdates ,aCriticalUpdates ,aOptionalUpdates ; 
var iExclusiveUpdates = 0,iCriticalUpdates =0 ,iOptionalUpdates =0 ; 
var iExUpdateInBasket = -1;// variable that holds the exclusive update that is in the basket;
var iExpanded = -1;
var sCompanyHeadStyle = ""; // varaible that sets the style for the company header(orange o r blue)
var sCompanyLineGrad = "";// variable that sets the grad for the company header under line
var sLastCompanyName = "", sUpdateDetails = "";
var bExBasket = false; // variable to see if the exclusive update that is in the basket is from this category
var sExclusiveSelection = ""; // variable to know if any exclusive radio button is checked
var str = "" ;
var iCheckboxStatus = 0; // select all check box values 0 = normal unchecked, 1 = grayed checked, 2 = normal checked
var iTotalItems = 0; //Total items displayed in this page
var iTotalitemsSelected = 0; //Total items selected in this page
var bMoveInProgress = false; // Set to indicate that an update select/deselect is in progress.
var sDeviceStatusImg = "", sDeviceStatusText = "";
var bHidden = false; //variable used to know if there are any hidden critical updates in case of express install
// Main control function for writing updates to the page
function fnWriteUpdates(sUp, bFirstcall) { 
	var iEx;
	var sExpandUpdate; // variable to hold the update id that is previously expanded before reloanding the div	
	var sCheckother = ""; // variable to know if other radio button has to be checked
    var sOther = "";
    var sHidden="";
    parent.fnTrace("fnWriteUpdates");
	if(parent.g_bInvalidPID) {
		parent.g_bInvalidPID = false;
		parent.fnDisplayErrorPage(parent.ERROR_INVALID_PID, false);
		return;
	}    
    //If you leave the site and use back button to get back this is the result
    if(parent.g_aUpdate.length == 0 && sUp != "") {
		window.location.href = window.location.href;
		return;
	}	
	str = "";		
	if(bFirstcall) {
		fnSortArange(sUp);
	}
	fnSetExInBasket();
	fnSetHiddenExpress();
	if(iSubPage != parent.conExpressInstall) parent.eTOC.fnUpdateTOCCount();
	if(iSubPage == parent.conResultsBasket && iCriticalUpdates > 0) {
		str += "<div class='solidDkBlue'></div><div class='gradDkBlue'>" + parent.L_RListCriticalUpdates_Text + "</div>";
	}
	if(iSubPage == parent.conResultsBasket && iExclusiveUpdates > 0) {
		str += "<hr style='color:#004AB5;height:2px;position:relative;'> "
	}
	for(i = 0; i < iExclusiveUpdates; i++) {
		if(iExUpdateInBasket == aExclusiveUpdates[i]) {
			bExBasket = true;
		}
		str += fnWriteUpdate(aExclusiveUpdates[i]);
	}
	if(sExclusiveSelection == "") {
		sCheckother = "checked";
	}
	if(((iExclusiveUpdates > 1 || (iExclusiveUpdates == 1 && iCriticalUpdates > 0)) && iSubPage == parent.conResultsBasket) || (iExclusiveUpdates > 0 && iSubPage != parent.conResultsBasket)) {
		if(iSubPage == parent.conResultsBasket || iSubPage == parent.conResultsCritical){
			sOther = parent.L_RListOtherCriticalUpdates_Text
		}else if(iSubPage == parent.conResultsProduct){
			sOther = parent.L_RListOtherOptionalUpdates_Text
		}else{
			sOther = parent.L_RListOtherUpdates_Text
		}
		if(iSubPage != parent.conExpressInstall) {
			str += "<br /><input value = '-1' " + sCheckother+ "  onclick = 'fnExclusiveSelection(-1)' align = 'absmiddle' id = 'ExclusiveSelection' name = 'ExclusiveSelection' type = 'radio'  >" + "\n" +
					"<span id='Radio-1' " + sCompanyHeadStyle + "><b>" + sOther + "</b></span><br /><div class='gradGray'></div>" + "\n" +
					"<div  id = 'divOtherUpdates' style='padding-left:25px'>";
		}
	}	
	if(iSubPage == parent.conResultsHidden && iCriticalUpdates > 0) {
		str += "<div class='solidDkBlue'></div><div class='gradDkBlue'>" + parent.L_RListCriticalUpdates_Text + "</div>";
	}
	sCompanyHeadStyle = "style = 'color:#ff6600'";
	sCompanyLineGrad = "class = 'gradOrg'";
	sLastCompanyName = "";
	for(i = 0; i < iCriticalUpdates; i++) {
		j = aCriticalUpdates[i];
		fnNonExWrite(j);
	}
	sLastCompanyName = "";
	sCompanyHeadStyle = "style = 'color:#004ab5'";	
	sCompanyLineGrad = "class = 'gradMedBlue'";
	if((iSubPage == parent.conResultsBasket || iSubPage == parent.conResultsHidden) && iOptionalUpdates > 0 ) { 
		str +=  "<div class='solidLtBlue'></div><div class='gradLtBlue'>" + parent.L_RListOptionalUpdates_Text + "</div>";
	}
	
	for(i = 0; i < iOptionalUpdates; i++) {
		j = aOptionalUpdates[i];
		fnNonExWrite(j);
	}
	if((iSubPage == parent.conResultsBasket || iSubPage == parent.conExpressInstall) && (iExclusiveUpdates > 0 || iCriticalUpdates > 0 || iOptionalUpdates > 0)) {
		document.all["eInstallLink"].disabled = false;
	}
	if(str == "") {
		str = parent.L_RListNoUpdatesAvailable_Text;
	}	
	if(iSubPage != parent.conResultsBasket) {
		str = fnSectionHeader() + str;
	}
	eUpdatesContainer.innerHTML = str;		
	fnWriteTotalSelected();
	//expand the first update except for express install
	if(iSubPage != parent.conExpressInstall){
		if(bFirstcall ) {
			if(iExclusiveUpdates > 0) 
				fnExpandDetails(aExclusiveUpdates[0]);
			else if(iCriticalUpdates > 0)		
				fnExpandDetails(aCriticalUpdates[0]);
			else if(iOptionalUpdates > 0)
				fnExpandDetails(aOptionalUpdates[0]);	
		} else {
			if(iExpanded != -1) {
				sExpandUpdate = iExpanded;
				iExpanded = -1;
				fnExpandDetails(sExpandUpdate);
			}
		}
	}
	//if there are any hidden updates in case of express install
	if(bHidden){
		sHidden = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RListHiddenCriticalPresent1_Text + "<a href=\"javascript:parent.fnDisplayHiddenUpdates()\" style = \"text-decoration: underline\" >" +  parent.L_RListHiddenCriticalPresent2_Text + "</a>" + parent.L_RListHiddenCriticalPresent3_Text + "</td></tr></table>";
		resultsPageInfo.innerHTML = sHidden;
		//ePageDesc.innerHTML ="";
	}
	if((iExUpdateInBasket != -1) && !bExBasket) {
			eUpdatesContainer.disabled = true;
			SelectallSpan.disabled = true;
			sExclusiveHeading = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RListSingleInstallation_Text + "</td></tr></table>";
			//resultsPageInfo.innerHTML = sExclusiveHeading;
			ePageDesc.innerHTML =sExclusiveHeading;
	} else {
		if(iSubPage == parent.conResultsBeta) {
			SelectallSpan.disabled = true;
			resultsPageInfo.innerHTML = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/warning_icon.gif'></td><td align='left' valign='top'>" + parent.L_RListBetaWarning1_Text + "" + parent.L_RListBetaWarning2_Text + "</td></tr></table>";
		}
	}
		
	// to disable the other updates div if any of the exclusive updates are selected in this category
	if(sExclusiveSelection != "" && typeof(divOtherUpdates) == "object") {	
		divOtherUpdates.disabled = true;
		SelectallSpan.disabled = true;
	} else if(typeof(SelectUpdates) == "object") { // to keep track of select all check box activity
		fnSelectallCheckboxActivity();
	}
}

// Write a non-exclusive update
function fnNonExWrite(iUpdate){
	parent.fnTrace("fnNonExWrite");
	sUpdates = parent.g_aUpdate[iUpdate];
	sCompanyName = sUpdates.Company + " - ";
	if(sUpdates.ProductFamily != "") {
		sCompanyName += sUpdates.ProductFamily + " - ";
	} 
	sCompanyName += sUpdates.Product;
	if( sCompanyName != sLastCompanyName ) {
		str += fnWriteCompanyName(sCompanyName);
		sLastCompanyName = sCompanyName;
	}			
	str += fnWriteUpdate(iUpdate);
}

//Write company name
function fnWriteCompanyName(sCompanyName) {
	var str = "<div class='updateTitle' style='margin-top:8px;margin-bottom:-8px;'><span " + sCompanyHeadStyle + "><b>" + sCompanyName + "</b></span></div><br/><div " + sCompanyLineGrad + " ></div>" + "\n"
	return str;
}

// function writes the single updates
function fnWriteUpdate(iUpdate,  bLastInGroup,bSUperseded) {
	var sUpdate = parent.g_UpdateCol(iUpdate); //A single entry from the update array
	var sUpdateID = iUpdate;
	var bInBasket = parent.g_aUpdate[iUpdate].InBasket;
	var bIsHidden = parent.g_aUpdate[iUpdate].IsHidden;
	var bDownloaded = false; //sUpdate.IsDownloaded;
	var bExclusive = parent.g_aUpdate[iUpdate].RebootRequired;
	var bDriver;
	var sBottomStyle = "", sUpdateDescription, styAlign = "";
	var sUpdateRTFLink, sUpdateTitle, sSizeText = "";
	var str = "";
	var vSize = "";
	var iSize = 0, sDLText;
	var sDivClass = "";
	var sckBasket = "", ckDecl = "", sExclusiveRadioButton = "";
	var sSupersededText = "";
	var sAdjust;
	var sDetailsClass; //for details drop down class
	if(parent.conRTL)  {
		sAdjust = "style=\"margin-top:-18px;padding-right:25px;\"";
	} else {
		sAdjust = "style=\"margin-top:-18px;padding-left:25px;\"";
	}
	parent.fnTrace("fnWriteUpdate");
	sUpdateTitle = parent.fnSanitize(sUpdate.Title);
	if (sUpdateTitle == null) {
		if (parent.conDevServer) {
			document.write ("<span>Missing strings: " + sUpdateID + ", " + sUpdateGUID + "</span><br />" + "\n");
		}
		return "";
	}
	bDriver = parent.g_aUpdate[iUpdate].IsDriver;
	if (bDriver) {
		fnDeviceStatusCode(parent.g_UpdateCol(iUpdate).DeviceProblemNumber);
		if(sDeviceStatusImg.length > 0) {
			sDeviceStatusImg = "<span><img title=\"" + sDeviceStatusTxt + "\" src=\"shared/images/" + sDeviceStatusImg + "\">&nbsp;" + sDeviceStatusTxt + "</span><br /><br />";
		}
	} 
	sUpdateDescription = parent.fnSanitize(sUpdate.Description);
	sUpdateDetails = "&nbsp;&nbsp;<a href='javascript:fnDisplayDetails(\"" + iUpdate + "\");' style='color:blue;text-decoration:underline' >" + parent.L_RListReadMore_Text + "</a>";
	if(bDownloaded) {
		vSize = "0";
	} else {
		vSize = parent.g_aUpdate[iUpdate].Size;
		if (vSize == null) {
			vSize = "1000";
		}
	}
	iSize = parseInt(vSize);
	sSizeText = parent.fnGetDownloadSizeText(iSize);
	if(iSize == 0) {
		sSizeText += "&nbsp;<img src='shared/images/info_16x.gif' title='" + parent.L_RListInfoGifAlt_Text + "'>";
	}		
	sDivClass = "update";
	if (bLastInGroup) sDivClass = "lastupdate";
	sDetailsClass = "spanDetailsBasket";
	if(!bExclusive && iSubPage != parent.conExpressInstall) {
		sDetailsClass = "spanDetails";
		// Check box for selecting the update into the basket
		sckBasket = "<input  type='checkbox' id='ckBasket" + iUpdate + "' ";
		sckBasket += "onClick='fnModifyBasket(" + iUpdate + ");'";
		if( bInBasket ) {
			sckBasket += " CHECKED";
		}
		sckBasket += ">"
	}
	// Check box to decline the update
	if(iSubPage != parent.conResultsHidden && iSubPage != parent.conExpressInstall & !bSUperseded){
		ckDecl = "<span id='Decl" + iUpdate + "' ";
		if( bInBasket ) ckDecl += " DISABLED ";
		ckDecl += "><input id='ckDecl" + iUpdate + "' name='ckDecl" + iUpdate + "' style='margin-left:-3px;' type='checkbox' ";
		ckDecl += "onClick='fnModifyHidden(" + iUpdate + ");' ";
		if( bIsHidden ) ckDecl += " CHECKED ";
		ckDecl += "><label FOR='ckDecl" + iUpdate + "'>" + parent.L_RListHideThisUpdate_Text + "</label></span>";
	}
	if(parent.g_aUpdate[iUpdate].sizeIsTypical) {
		sDLText = parent.L_RListDownloadSizeTypical_Text;
	} else {
		sDLText = parent.L_RListDownloadSize_Text;
	}
	if(bExclusive) {
		//code to select the first exclusive critical update
		if(((iExclusiveUpdates > 1 || iSubPage != parent.conResultsBasket) || (iExclusiveUpdates > 0 && iCriticalUpdates > 0 &&  iSubPage == parent.conResultsBasket))&& iSubPage != parent.conExpressInstall ){
			if(parent.g_aUpdate[iUpdate].InBasket && sExclusiveSelection == ""){
				sExclusiveSelection  = iUpdate;
				sExclusiveRadioButton = "<input  value = '" + iUpdate + "' checked onclick = 'fnExclusiveSelection(" + iUpdate  + ")' align = 'absmiddle' id = 'ExclusiveSelection' name = 'ExclusiveSelection' type = 'radio'  >" 
			} else {
				sExclusiveRadioButton = "<input  value = '" + iUpdate + "'  onclick = 'fnExclusiveSelection(" + iUpdate  + ")' align = 'absmiddle' id = 'ExclusiveSelection' name = 'ExclusiveSelection' type = 'radio'  >" 
			}
		} else {
			sExclusiveRadioButton = "";
		}
		
		if(parent.g_aUpdate[iUpdate].IsCritical == 1) {
			sCompanyHeadStyle = "style = 'color:#ff6600'";
		} else {
			sCompanyHeadStyle = "style = 'color:#004ab5'"
		}
		if(sckBasket != "" || sExclusiveRadioButton != "") {
			styAlign = sAdjust;
		}
		str = "<div id=\"Ttl" + iUpdate + "\" " + "class=\"" + sDivClass + "\">" + "\n" +
				"	<div " + " class=\"updateTitle\">" +  sExclusiveRadioButton + "\n" +
				"	<div " + styAlign + " " + sCompanyHeadStyle + ">" + parent.L_RListSingleInstallationTitle_Text + 
				"	<a " + sCompanyHeadStyle + " title = \"" + parent.L_RListClickForDescription_Text + "\"  href=\"javascript:fnExpandDetails(" + iUpdate + ");\" id = \"aTitle" + iUpdate +"\"><b>" + sUpdateTitle + "</b></a>" +  sDeviceStatusImg + sSupersededText + "</div></div>" + "\n" +
				"	<span id=\"Det" + iUpdate + "\" class = \"" + sDetailsClass +"\" >" + "\n" + 
				"	" + sDLText + sSizeText + "<br />" + "\n" +
				"	" + sUpdateDescription + sUpdateDetails + "<br />" + "\n" +
				"	" + ckDecl + "<br />" + "\n" +
				"   </span></div><div class = \"gradGray\"></div>" + "\n";
	
	} else {
		if(bInBasket) {
			iTotalitemsSelected++;
		}
		if(sckBasket != "" || sExclusiveRadioButton != "") {
			styAlign = sAdjust;
		}		
		str += "<div id=\"Ttl" + iUpdate + "\" " + "class=\"" + sDivClass + "\">" + "\n" +
			"	<div " + " class=\"updateTitle\">" + sckBasket + "\n" +
			"   <a title = \"" + parent.L_RListClickForDescription_Text + "\" href=\"javascript:fnExpandDetails(" + iUpdate + ");\" id = \"aTitle" + iUpdate +"\"><div " + styAlign + ">" + sUpdateTitle + "</div></a>" + sSupersededText + "</div>" + "\n" + 
			"	<span id=\"Det" + iUpdate + "\" class = \"" + sDetailsClass +"\">" + sDeviceStatusImg + "\n" + 
			"	" + sDLText + sSizeText + "<br />" + "\n" +
			"	" + sUpdateDescription + sUpdateDetails + "<br />" + "\n" +
			"	" + ckDecl + "<br />" + "\n" +
			"   </span></div><div class = \"gradGray\"></div>" + "\n";
	}
	return str;	
}
	
function fnDisplaySuperseded(sSupersedingUpdates) {
	var aSupersedingUpdates = sSupersedingUpdates.split(",");
	var i;
	var str = "";
	parent.fnTrace("fnDisplaySuperseded");
	for(i = 0; i < aSupersedingUpdates.length; i++) {
		str += fnWriteUpdate(aSupersedingUpdates[i], false, true)
	}
	eSuperseded.innerHTML = str;
}

//function to set the select all checkbox status
function fnSelectallCheckboxActivity() {
	parent.fnTrace("fnSelectallCheckboxActivity");
	if((iOptionalUpdates >= 6) && (iSubPage != parent.conResultsBasket && iSubPage != parent.conExpressInstall && iSubPage != parent.conResultsHidden)){
		if(iTotalitemsSelected == iTotalItems) {		
			iCheckboxStatus = 2;
			SelectUpdates.disabled = false;
			SelectUpdates.checked = true;
		} else if(iTotalitemsSelected != 0) {		
			SelectUpdates.disabled = true;
			iCheckboxStatus = 1;
			SelectUpdates.checked = true; 
		} else {
			SelectUpdates.disabled = false;		
			iCheckboxStatus = 0;
			SelectUpdates.checked = false;
		}
	}
}

//function used to select all the updates in particular page with check box
function fnSelectUpdates() {
	var i, iUpdate, bBasket;
	parent.fnTrace("fnSelectUpdates");
	if (!SelectallSpan.disabled) {
		if(iCheckboxStatus != 2) {
			bBasket = true;
			iCheckboxStatus = 2;
		} else {
			bBasket = false;
			iCheckboxStatus = 0;
		}
		for(i = 0; i < iOptionalUpdates; i++) {
			iUpdate = aOptionalUpdates[i];
			parent.g_aUpdate[iUpdate].InBasket = bBasket;
			parent.g_aUpdate[iUpdate].IsHidden = false;
			parent.g_UpdateCol(iUpdate).IsHidden = false;
		}
	}
	sExclusiveSelection = ""; // set this blank	
	iTotalitemsSelected = 0;
	fnWriteUpdates(sUpdates,false);	
}

// function to expand the details
function fnExpandDetails(iUpdate) {
	parent.fnTrace("fnExpandDetails");
	var bIsHidden = parent.g_aUpdate[iUpdate].IsHidden;
	if(iExpanded != -1) {
		document.all["aTitle" + iExpanded].title = parent.L_RListClickForDescription_Text;	
		if(document.all["Det" + iExpanded].style != null) {
			document.all["Det" + iExpanded].style.display = "none";
			document.all["Ttl" + iExpanded].className = "gradNone";
		}
	}
	if(iExpanded == iUpdate) {
		iExpanded = -1;
	} else {
		if(bIsHidden) {
			document.all["Ttl" + iUpdate].className = "gradGrayBG";
		} else {
			document.all["Ttl" + iUpdate].className = "gradYellow";
		}
		iExpanded = iUpdate;
		document.all["aTitle" + iExpanded].title = parent.L_RListClickToHideDescription_Text;
		if(document.all["Det" + iUpdate].style != null) document.all["Det" + iUpdate].style.display = "block";
	}
}

//function that sets the exclusive update variable
function fnSetExInBasket() {
	var i;
	parent.fnTrace("fnSetExInBasket");
	if(iSubPage == parent.conExpressInstall && iExclusiveUpdates >= 1){
		iExUpdateInBasket = aExclusiveUpdates[0];
	}else {
		for(i = 0; i < parent.g_aUpdate.length; i++) {
			if(parent.g_aUpdate[i].InBasket && parent.g_aUpdate[i].RebootRequired) {
				iExUpdateInBasket = i;		
				break;
			}		
		}
	}
}
//function that sets the variable if any critical updates are hidden in express install
function fnSetHiddenExpress(){
	parent.fnTrace("fnSetHiddenExpress");
	if(iSubPage == parent.conExpressInstall || iSubPage == parent.conResultsCritical || iSubPage == parent.conResultsBasket){
		for(i = 0; i < parent.g_aUpdate.length; i++) {
			if(parent.g_aUpdate[i].IsCritical && parent.g_aUpdate[i].IsHidden) {
				bHidden = true;		
				break;
			}		
		}
	}
}
//funtion that does sorting,removes hidden updates if not in restore hidden updates page dividing into 3 kinds of updates
function fnSortArange(sUp) {
	var i, j, aUpdates, sUpdates, aUpdatesSort;
	parent.fnTrace("fnSortArange");
	if(iSubPage == parent.conResultsBasket || iSubPage == parent.conExpressInstall) {
		sUp = "";
		for(i = 0; i < parent.g_aUpdate.length; i++) {
			if(parent.g_aUpdate[i].InBasket) {
				sUp += (i + ",");
			}
		}
		if(sUp != "" ) {
			sUp = sUp.substring(0, sUp.length - 1);
		}
	}
	if(sUp != "") {
		aUpdatesSort = sUp.split(",");	
		var sCriticality 	;
		for(i = 0; i < aUpdatesSort.length; i++) {			
			j = aUpdatesSort[i];
			sUpdates = parent.g_aUpdate[j];	
			sCriticality = "1"	;
			if(parent.g_aUpdate[j].IsCritical ){
				sCriticality = "0";
			}	
			sCriticality = sUpdates.DownloadPriority + sCriticality;	 
			aUpdatesSort[i] = sCriticality + parent.g_sDelim + sUpdates.CompanyOrder + parent.g_sDelim + sUpdates.Company.toUpperCase() + parent.g_sDelim + 
								sUpdates.ProductFamilyOrder + parent.g_sDelim + sUpdates.ProductFamily.toUpperCase() + parent.g_sDelim + 
								sUpdates.ProductOrder + parent.g_sDelim + sUpdates.Product.toUpperCase() + parent.g_sDelim +
								sUpdates.SortDate + parent.g_sDelim + j;
		} 
		aUpdatesSort = aUpdatesSort.sort();
		sUp = "";
		for(i = 0; i < aUpdatesSort.length; i++) {
			aUpdatesSort[i] = aUpdatesSort[i].split(parent.g_sDelim)[8];
			sUp += (aUpdatesSort[i] + ",");
		}
		if(sUp != "") {
			sUp = sUp.substring(0, sUp.length - 1);	
		}
		aUpdates = sUp.split(",");
		for(i = 0; i < aUpdates.length; i++) {
			j = aUpdates[i];
			if((!parent.g_aUpdate[j].IsHidden && !parent.g_UpdateCol(j).IsMandatory ) || iSubPage == parent.conResultsHidden) {
				if(parent.g_aUpdate[j].RebootRequired) { 
					sExclusiveUpdates += j + ",";
				} else if(parent.g_aUpdate[j].IsCritical == 1) {
					sCriticalUpdates += j + ","; 
				} else {
					sOptionalUpdates += j + ","; 
				}
			}
				
		}
		if(sExclusiveUpdates != "" ) {
			sExclusiveUpdates = sExclusiveUpdates.substring(0, sExclusiveUpdates.length - 1);
			aExclusiveUpdates = sExclusiveUpdates.split(",");
			iExclusiveUpdates = aExclusiveUpdates.length;
		}
		if(sCriticalUpdates != "" ){
			sCriticalUpdates = sCriticalUpdates.substring(0, sCriticalUpdates.length - 1);
			aCriticalUpdates =  sCriticalUpdates.split(",");
			iCriticalUpdates = aCriticalUpdates.length;
		}
		if(sOptionalUpdates != "" ){
			sOptionalUpdates = sOptionalUpdates.substring(0, sOptionalUpdates.length - 1);
			aOptionalUpdates =  sOptionalUpdates.split(",");
			iOptionalUpdates = aOptionalUpdates.length;
		}
	}	
	if(iExclusiveUpdates > 0 && iSubPage == parent.conExpressInstall) {
		iExclusiveUpdates = 1;
		for(i = 0; i < parent.g_aUpdate.length; i++) {
			parent.g_aUpdate[i].InBasket = false;
		}
		parent.g_aUpdate[aExclusiveUpdates[0]].InBasket = true;
		iCriticalUpdates = 0;
		iOptionalUpdates = 0;
		sup = aExclusiveUpdates[0];
	}
	//function to write page titles
	fnSetResultsPageVariables();
	// to add select all check box
	if(iOptionalUpdates >= 6 && (iSubPage != parent.conResultsBasket && iSubPage != parent.conExpressInstall && iSubPage != parent.conResultsHidden)) {
		SelectallSpan.innerHTML = "<br/><span onmouseup = 'fnSelectUpdates()'><input  onclick = 'return false' type = 'checkbox' id = 'SelectUpdates' name = 'SelectUpdates' ></span> Select all <br />";
	}
	iTotalItems = iOptionalUpdates;
	
}

// Service the decline check box
function fnModifyHidden(iUpdate) { 
	if(bMoveInProgress){
		 window.setTimeout("fnModifyHidden(" + iUpdate + ")",20);
	}
	parent.fnTrace("fnModifyHidden");
	if(parent.g_aUpdate[iUpdate].InBasket)return;
	if(document.all["ckDecl" + iUpdate].checked) {
		parent.g_UpdateCol(iUpdate).IsHidden = true;
		parent.g_aUpdate[iUpdate].IsHidden = true;
		document.all["Ttl" + iUpdate].className = "gradGrayBG";
	} else {
		parent.g_UpdateCol(iUpdate).IsHidden = false ;
		parent.g_aUpdate[iUpdate].IsHidden = false;
		document.all["Ttl" + iUpdate].className = "gradYellow";
	}
	parent.eTOC.fnUpdateTOCCount();
}

// Add and remove items to/from basket	
function fnModifyBasket(iUpdate) {
	parent.fnTrace("fnModifyBasket");
	if(document.all["ckBasket" + iUpdate].checked) {
		parent.g_aUpdate[iUpdate].InBasket = true;
		iTotalitemsSelected++;
		if(iSubPage != parent.conResultsHidden) {
			document.all["ckDecl" + iUpdate].checked = false;
			document.all["Decl" + iUpdate].disabled = true;
		}
		if (document.all["Det" + iUpdate].style.display == "block") {
			document.all["Ttl" + iUpdate].className = "gradYellow";
			
		} else {
			document.all["Ttl" + iUpdate].style.backgroundColor = "#ffffff";
		}
		if(parent.g_aUpdate[iUpdate].IsHidden) {
			parent.g_UpdateCol(iUpdate).IsHidden = false;
			parent.g_aUpdate[iUpdate].IsHidden = false;
		}
		fnMoveDiv(document.all["Ttl" + iUpdate], 1, iUpdate);		
		parent.eTOC.fnUpdateTOCCount();
	} else {
		parent.g_aUpdate[iUpdate].InBasket= false;
		iTotalitemsSelected--;
		if(iSubPage != parent.conResultsHidden) {
			document.all["Decl" + iUpdate].disabled = false;
		} else {
			parent.g_UpdateCol(iUpdate).IsHidden = true;
			parent.g_aUpdate[iUpdate].IsHidden = true;
			if(iExpanded == iUpdate) {
				document.all["Ttl" + iUpdate].className  = "gradGrayBG";
			}
			parent.eTOC.fnUpdateTOCCount();
		}
		fnMoveDiv(document.all["Ttl" + iUpdate], -1, iUpdate);
	}
	fnSelectallCheckboxActivity();
	if(iSubPage == parent.conResultsBasket){
		if (iTotalitemsSelected == 0){
			document.all["eInstallLink"].disabled = true
		}
		else {
			document.all["eInstallLink"].disabled = false
		}
    }
	fnWriteTotalSelected();
}

// function that writes the total sizes
function fnWriteTotalSelected() {
	var iSelected = 0, iSize = 0, sSizeText, i;
	parent.fnTrace("fnWriteTotalSelected");
	for(i = 0; i < parent.g_aUpdate.length; i++) {
		if(parent.g_aUpdate[i].InBasket) {
			iSelected++;
			if(parent.g_aUpdate[i].IsDownloaded == false) {
				iSize += parent.g_aUpdate[i].Size;
			}
		}
	}
	if (iSize == null) {
			iSize = "1000";
	}
	parent.g_iConsumerBasketCount = iSelected;
	parent.fnUpdateTOCBasket();
	iSize = parseInt(iSize);
	sSizeText = parent.fnGetDownloadSizeText(iSize);
	eBasketStats.innerHTML = "&nbsp;" + iSelected + " " + parent.L_RListItems_Text + ", " + sSizeText;
}

// function to select exclusive updates
function fnExclusiveSelection(iRadiovalue) {
	var bAlreadyInBasket = false;
	parent.fnTrace("fnExclusiveSelection");	
	if(iRadiovalue != -1) {
		bAlreadyInBasket = parent.g_aUpdate[iRadiovalue].InBasket;
		for(i = 0; i < parent.g_aUpdate.length; i++) {
			parent.g_aUpdate[i].InBasket = false; 
		}	
		if(iSubPage==parent.conResultsHidden){
			for(j = 0; j < aExclusiveUpdates.length; j++) {
				parent.g_aUpdate[aExclusiveUpdates[j]].IsHidden = true;
				parent.g_UpdateCol(aExclusiveUpdates[j]).IsHidden = true;
			}
		}
		
		parent.g_aUpdate[iRadiovalue].InBasket = true; 
		parent.g_aUpdate[iRadiovalue].IsHidden = false; 
		parent.g_UpdateCol(iRadiovalue).IsHidden = false;
	} else {
		SelectallSpan.disabled = false;
		for(i = 0; i < parent.g_aUpdate.length; i++) {			
			if(iSubPage==parent.conResultsCritical && parent.g_aUpdate[i].IsCritical && !parent.g_aUpdate[i].IsHidden){
				parent.g_aUpdate[i].InBasket = true;
			}
			if(parent.g_aUpdate[i].RebootRequired) {
				parent.g_aUpdate[i].InBasket = false;
			}
		}
	}// to set the select all check box status to unchecked state
	iCheckboxStatus = 0;
	iTotalitemsSelected = 0;
	if(typeof(SelectUpdates) == "object") {
		SelectUpdates.checked = false;
	}
	sExclusiveSelection = ""; // set this blank
	fnWriteUpdates(sUpdates, false);
	fnMoveDiv(document.all["Ttl" + iRadiovalue], 1, iRadiovalue);
}
function fnStartInstallUpdates(){
	parent.fnTrace("fnStartInstallUpdates");
	if(((iExclusiveUpdates > 1) || (iExclusiveUpdates == 1 && iCriticalUpdates > 0))&& parent.g_aUpdate[aExclusiveUpdates[0]].InBasket){
		parent.fnInstallUpdates(aExclusiveUpdates[0]);
	}else{
		parent.fnInstallUpdates(-1);
	}
}

//function to diaplay the title & description of the page 
function fnSetResultsPageVariables() {
	var PageTitle, PageSubTitle, PageDescription;
	parent.fnTrace("fnSetResultsPageVariables");
	switch(iSubPage) {
		case parent.conResultsCritical:
			PageTitle = parent.L_RListCriticalUpdatesTitle_Text;
			PageSubTitle = parent.L_RList100_Text;
			if(iExclusiveUpdates == 0 && iCriticalUpdates == 0){
				PageDescription = parent.L_RList101_Text;
			}else if(iExclusiveUpdates == 1 && iCriticalUpdates == 0){
				PageDescription = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList103_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates > 1 && iCriticalUpdates == 0){
				PageDescription = parent.L_RList105a_Text + "<p><table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList105b_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates > 0 && iCriticalUpdates > 0){
				PageDescription = parent.L_RList102a_Text +  "<p><table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList102b_Text + "</td></tr></table>";
			}else{
				PageDescription = parent.L_RList104_Text;
			}
			customBnr.style.display = "block";
			break;
		case parent.conResultsProduct:
			PageTitle = parent.L_RListProductTitle_Text;
			PageSubTitle = parent.L_RList200_Text;
			if(iExclusiveUpdates == 0 && iOptionalUpdates == 0){
				PageDescription = parent.L_RList201_Text;
			}else if(iExclusiveUpdates == 1 && iOptionalUpdates == 0){
				PageDescription = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList203_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates > 1 && iOptionalUpdates == 0){
				PageDescription = parent.L_RList205a_Text +  "<p><table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList205b_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates > 0 && iOptionalUpdates > 0){
				PageDescription = parent.L_RList202a_Text +  "<p><table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList202b_Text + "</td></tr></table>";
			}else{
				PageDescription = parent.L_RList204_Text;
			}
			if(iTocIndex != ""){
				PageTitle = parent.g_aToc[iTocIndex].resultHeaderText + " " + parent.L_RListUpdates_Text;
			}
			customBnr.style.display = "block";
			break;
		case parent.conResultsDrivers:
			PageTitle = parent.L_RListDriversTitle_Text;
			PageSubTitle = parent.L_RList200_Text;
			if(iExclusiveUpdates == 0 && iOptionalUpdates == 0){
				PageDescription = parent.L_RList201_Text;
			}else if(iExclusiveUpdates == 1 && iOptionalUpdates == 0){
				PageDescription = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList203_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates > 1 && iOptionalUpdates == 0){
				PageDescription = parent.L_RList205a_Text +  "<p><table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList205b_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates > 0 && iOptionalUpdates > 0){
				PageDescription = parent.L_RList202a_Text +  "<p><table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList202b_Text + "</td></tr></table>";
			}else{
				PageDescription = parent.L_RList204_Text;
			}
			if(iTocIndex != ""){
				PageTitle = parent.g_aToc[iTocIndex].resultHeaderText + " " + parent.L_RListUpdates_Text;
			}
			customBnr.style.display = "block";
			break;
		case parent.conResultsBasket:
			PageTitle = ""; 
			PageSubTitle = parent.L_RList300_Text;
			if(iExclusiveUpdates == 0 && iOptionalUpdates == 0 && iCriticalUpdates == 0){
				PageDescription = parent.L_RList301_Text;
			}else if(iOptionalUpdates	> 0){
				if(iCriticalUpdates >0 ){
					PageDescription = parent.L_RList304_Text;
				}else{
					PageDescription = parent.L_RList303_Text;
				}
			}else if(iCriticalUpdates > 0 ){
				PageDescription = parent.L_RList302_Text;
			}else if(iExclusiveUpdates > 0){
				if(parent.g_aUpdate[aExclusiveUpdates[0]].IsCritical == 1){
					PageDescription = parent.L_RList302_Text;
				}else{
					PageDescription = parent.L_RList303_Text;
				}
			}
			basketBnr.style.display = "block";
			break;		
		case parent.conResultsBeta:
			PageTitle = parent.L_RListBetaTitle_Text;
			PageSubTitle = parent.L_RList600_Text;
			PageDescription = parent.L_RListBetaDescription_Text;
			customBnr.style.display = "block";
			break;
		case parent.conResultsHidden:
			PageTitle = parent.L_RListHiddenTitle_Text;
			PageSubTitle = parent.L_RList400_Text;
			if(iExclusiveUpdates == 0 && iOptionalUpdates == 0 && iCriticalUpdates == 0){
				PageDescription= parent.L_RList401_Text;
			}else if(iExclusiveUpdates > 0 && (iOptionalUpdates >0 || iCriticalUpdates > 0)){
				PageDescription= "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList405_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates >1 ){
				PageDescription= "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList403_Text + "</td></tr></table>";
			}else if(iExclusiveUpdates == 1){
				PageDescription= "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + parent.L_RList402_Text + "</td></tr></table>";
			}else{
				PageDescription= parent.L_RList404_Text; 
			}
			break;
		case parent.conExpressInstall: // for express install
			PageTitle = "";
			PageSubTitle = parent.L_RList500_Text;
			if(iExclusiveUpdates > 0 || iCriticalUpdates >0){
				PageDescription= parent.L_RList501_Text;
			}else{
				PageDescription= parent.L_RList502_Text;
			}
			expressBnr.style.display = "block";
			break;
	}
	if(PageTitle == ""){
		DivPageTitle.style.display = "none";
	}else{
		DivPageTitle.innerHTML = PageTitle;
	}
	if(PageSubTitle != "") eSubTitle.innerHTML = PageSubTitle;
	if(PageDescription != "") ePageDesc.innerHTML = PageDescription;	
}

//function to display the section header
function fnSectionHeader() {
	var hdrText, hdrStyle, solidStyle, hdr;
	parent.fnTrace("fnSectionHeader");
	switch(iSubPage) {
		case parent.conResultsCritical:
			hdrStyle = "gradDkBlue";
			hdrText = parent.L_RListCriticalUpdatesBar_Text;
			solidStyle = "solidDkBlue";
			break;
		case parent.conResultsProduct:
			hdrStyle = "gradLtBlue";
			hdrText = parent.L_RListOptionalSoftwareUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conResultsDrivers:
			hdrStyle = "gradLtBlue";
			hdrText = parent.L_RListOptionalHardwareUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conResultsBeta:
			hdrStyle = "gradLtBlue";
			hdrText = parent.L_RListOptionalBetaUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conResultsHidden:
			hdrStyle = "gradLtBlue";
			hdrText = parent.L_RListHiddenUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conExpressInstall:
			hdrStyle = "gradDkBlue";
			hdrText = parent.L_RListCriticalUpdatesBar_Text;
			solidStyle = "solidDkBlue";
			break;
		default:

	}
	hdr = "<div class='" + solidStyle + "'></div>"
	hdr += "<div class='" + hdrStyle + "'>" + hdrText + "</div>";
	if( iSubPage == parent.conResultsBasket) hdr = "";
		return hdr;
}
function fnDisplayDetails(iUpdate)
{
	parent.fnTrace("fnDisplayDetails");
	var sWindowName = "window" + iUpdate;
	var sURL= "itemdetails.aspx?iPage=0&index=" + iUpdate + "&"  +  parent.conQueryString;
	window.open(sURL, sWindowName, "directories=no,width=400,height=400,location=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes,top = 100,left = 100");
	
}

function fnDeviceStatusCode(iDeviceProblemNumber) {

	//Config manager status codes of interest
	var CM_PROB_FAILED_INSTALL = 28; // (0x0000001C)   // install failed
	var CM_PROB_NOT_CONFIGURED = 1;  // (0x00000001)   // no config for device
	var CM_PROB_DISABLED = 22;       // (0x00000016)   // devinst is disabled
	
	switch(iDeviceProblemNumber) {
		case 0:
			break;
		
		case CM_PROB_NOT_CONFIGURED:
		case CM_PROB_FAILED_INSTALL:
			sDeviceStatusImg = "device_unknown.gif";
			sDeviceStatusTxt = parent.L_RListDeviceUnknown_Text;
			break;
			
		case CM_PROB_DISABLED:
			sDeviceStatusImg = "device_disabled.gif";
			sDeviceStatusTxt = parent.L_RListDeviceDisabled_Text;
			break;
			
		default:
			sDeviceStatusImg = "device_problem.gif";
			sDeviceStatusTxt = parent.L_RListDeviceProblem_Text;
			break;
	}
}

var g_oMovDivTimer, g_oDiv;
var g_oMoveDivStyle;

function fnMoveDiv(oDiv, iStep, iUpd){
	parent.fnTrace("fnMoveDiv");
    if(oDiv == null) return;
	if(bMoveInProgress) return;
	bMoveInProgress = true;
    var iStartLeft, iStartTop, iFinishLeft, iStartWidth, iStartHeight, iDistance, iSteps;
    
	if(iUpd != iExpanded) fnExpandDetails(iUpd);

    var oDocBody = document.body;
    var iTop = fnGetDistance(oDiv, "top") - eUpdatesContainer.scrollTop;
    
    var iLeft = fnGetDistance(oDiv, "left");
    var iWidth = oDiv.offsetWidth;
    var iHeight = oDiv.offsetHeight;

    var oSourceObject = eInstallLink;
    var iSourceObjectTop = fnGetDistance(oSourceObject, "top") + oSourceObject.offsetHeight;
    var iSourceObjectLeft = fnGetDistance(oSourceObject, "left") + oSourceObject.offsetWidth;
    
	var oMoveDiv = oDiv.cloneNode(true);
	oMoveDiv.style.display = "none";
	oDocBody.insertBefore(oMoveDiv);
	oMoveDiv.id = "eMoveDiv";
	oMoveDiv.style.border = "1px SOLID BLACK";
	
    g_oDiv = oDiv;
    if(iStep == 1){
        iStartTop = iTop;
        iStartLeft = oDocBody.offsetWidth - iWidth - 10;
        iFinishTop = iSourceObjectTop - 30;
        iFinishLeft = iSourceObjectLeft;
    }
    else{
        iFinishLeft = oDocBody.offsetWidth - iWidth - 10;
        iStartTop = iSourceObjectTop;
        iStartLeft = iSourceObjectLeft;
        iFinishTop = iTop + 20;
    }
    iSteps = 15;
    if(iStep == 1){
        iStartWidth = iWidth;
        iStartHeight = iHeight;
    }else{
       iStartWidth = iWidth/iSteps;
       iStartHeight = iHeight/iSteps;
    }
	try {
		g_oMoveDivStyle = eMoveDiv.style;
		g_oMoveDivStyle.position = "absolute";   //added sb
		g_oMoveDivStyle.overflow = "hidden";	 //added sb
		g_oMoveDivStyle.left = iStartLeft;
		g_oMoveDivStyle.top = iStartTop;
		g_oMoveDivStyle.width = iStartWidth;
		g_oMoveDivStyle.height = iStartHeight;
		var iLeftInc = (iFinishLeft - iStartLeft)/iSteps;
		var iTopInc = (iFinishTop - iStartTop)/iSteps;
		var iWidthInc = iStep*iWidth/iSteps;
		var iHeightInc = iStep*iHeight/iSteps;
		fnMove(iWidthInc, iHeightInc, iLeftInc, iTopInc, 0, iSteps)
	}
	catch(e) {
	}
}

function fnMove(iWidthInc, iHeightInc, iLeftInc, iTopInc, i, iMax){
	var iDivWidth = g_oMoveDivStyle.posWidth - iWidthInc;
 	var iDivLeft =  g_oMoveDivStyle.posLeft + iLeftInc;

	if(iDivLeft + iDivWidth > document.body.clientWidth) {
		iDivWidth = document.body.clientWidth - iDivLeft - 100;
	}
	g_oMoveDivStyle.posTop += iTopInc;
   	g_oMoveDivStyle.posWidth = iDivWidth;
    g_oMoveDivStyle.posHeight -= iHeightInc;
    g_oMoveDivStyle.posLeft += iLeftInc;
    g_oMoveDivStyle.display = "block";
 
    if(g_oMoveDivStyle.posHeight == 0) g_oMoveDivStyle.posHeight = -1; /* IE5.5 BUG */
    if(++i < iMax){
        g_oMovDivTimer = window.setTimeout("fnMove(" + iWidthInc + ", " + iHeightInc + ", " + iLeftInc + ", " + iTopInc + ", " + i + ", " + iMax + ")", 20);
    }else{
        fnEndMove();
    }
}
    
function fnEndMove(){
	parent.fnTrace("fnEndMove");
    window.clearTimeout(g_oMovDivTimer);
    window.setTimeout("fnRemoveDiv()",20)
}

function fnRemoveDiv() {
	eMoveDiv.removeNode(true);
    bMoveInProgress = false;
}

function fnGetDistance(oObj, sDistanceTo){
	var i, bFindBottom, bFindRight, bFindLeft, bFindTop;

	bFindBottom = (sDistanceTo == "bottom");
	bFindRight = (sDistanceTo == "right");
	bFindLeft = (sDistanceTo == "left" || bFindRight);
	bFindTop = (sDistanceTo == "top" || bFindBottom);

	if(bFindRight){
		i = oObj.offsetWidth;
	}else if(bFindBottom){
		i = oObj.offsetHeight;
	}else{
		i = 0;
	}

	while("object" == typeof(oObj) && oObj.tagName.toLowerCase() != "body"){
		i += bFindTop ? oObj.offsetTop : oObj.offsetLeft;
		oObj = oObj.offsetParent;
	}

	return i;
}

// Ping  back to WER servers if the user doesn't install the applicable WER update \\
function fnPingUninstalledUpdateInfo(){
	var iUpdateCount, i;
	parent.fnTrace("fnPingUninstalledUpdateInfo");
	if ('undefined' != typeof(parent.conWerMode)){ //WER scenario
		iUpdateCount = parent.g_aUpdate.length;
		for(i = 0; i < iUpdateCount; i++) {
			if(parent.g_aUpdate[i].InBasket && parent.g_UpdateCol(i).Identity.UpdateID == parent.sWerUpdateId) {
				parent.g_aQueryString[1] = "IssueType=UserNoInstall";
				fnPingServer(parent.g_aQueryString,"//go.microsoft.com/fwlink/?LinkId=23428"); 
			}
		}	
	}
}
