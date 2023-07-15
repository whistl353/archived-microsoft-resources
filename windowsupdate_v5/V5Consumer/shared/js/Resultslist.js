var sExclusiveUpdates = "" ,sCriticalUpdates = "" ,sOptionalUpdates = "";   // variables to hold 3 different kind of updates
var aExclusiveUpdates ,aCriticalUpdates ,aOptionalUpdates ; 
var iExclusiveUpdates = 0,iCriticalUpdates =0 ,iOptionalUpdates =0 ; 
var iExUpdateInBasket = -1;// variable that holds the exclusive update that is in the basket;
var iExpanded = -1;
var sCompanyHeadStyle = ""; // varaible that sets the style for the company header(orange o r blue)
var sCompanyLineGrad = "";// variable that sets the grad for the company header under line
var sLastCompanyName = "";
var bExBasket = false; // variable to see if the exclusive update that is in the basket is from this category
var sExclusiveSelection = ""; // variable to know if any exclusive radio button is checked
var str = "" ;
var iCheckboxStatus = 0; // select all check box values 0 = normal unchecked, 1 = grayed checked, 2 = normal checked
var iTotalItems = 0; //Total items displayed in this page
var iTotalitemsSelected = 0; //Total items selected in this page

// Main control function for writing updates to the page
function fnWriteUpdates(sUp, bFirstcall) {
	var iEx;
	var sExpandUpdate; // variable to hold the update id that is previously expanded before reloanding the div	
	var sCheckother = ""; // variable to know if other radio button has to be checked
    
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
	if(iSubPage == parent.conResultsBasket && iCriticalUpdates > 0) {
		str += "<div class='solidDkBlue'></div><div class='gradDkBlue'>" + L_RListCriticalUpdates_Text + "</div>";
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
		if(iSubPage != parent.conExpressInstall) {
			str += "<br /><input value = '-1' " + sCheckother+ "  onclick = 'fnExclusiveSelection(-1)' align = 'absmiddle' id = 'ExclusiveSelection' name = 'ExclusiveSelection' type = 'radio'  >" + "\n" +
					"<span id='Radio-1' " + sCompanyHeadStyle + "><b>" + L_RListOtherUpdates_Text + "</b></span><br /><div class='gradGray'></div>" + "\n" +
					"<div  id = 'divOtherUpdates' >";
		}
	}	
	if(iSubPage == parent.conResultsHidden && iCriticalUpdates > 0) {
		str += "<div class='solidDkBlue'></div><div class='gradDkBlue'>" + L_RListCriticalUpdates_Text + "</div>";
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
		str +=  "<div class='solidLtBlue'></div><div class='gradLtBlue'>" + L_RListOptionalUpdates_Text + "</div>";
	}
	
	for(i = 0; i < iOptionalUpdates; i++) {
		j = aOptionalUpdates[i];
		fnNonExWrite(j);
	}
	if((iSubPage == parent.conResultsBasket || iSubPage == parent.conExpressInstall) && (iExclusiveUpdates > 0 || iCriticalUpdates > 0 || iOptionalUpdates > 0)) {
		document.all["eInstallLink"].disabled = false;
	}
	if(str == "") {
		str = L_RListNoUpdatesAvailable_Text;
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
	if((iExUpdateInBasket != -1) && !bExBasket) {
			eUpdatesContainer.disabled = true;
			SelectallSpan.disabled = true;
			sExclusiveHeading = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/info_16x.gif'></td><td align='left' valign='top'>" + L_RListSingleInstallation_Text + "</td></tr></table>";
			resultsPageInfo.innerHTML = sExclusiveHeading; 			
	} else {
		if(iSubPage == parent.conResultsBeta) {
			SelectallSpan.disabled = true;
			resultsPageInfo.innerHTML = "<table class='tblExclusiveSection' cellpadding=5 cellspacing=0><tr><td width=23 align='left' valign='top'><img src='shared/images/warning_icon.gif'></td><td align='left' valign='top'>" + L_RListBetaWarning1_Text + "" + L_RListBetaWarning2_Text + "</td></tr></table>";
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
function fnWriteUpdate(iUpdate,  bLastInGroup,bSUperceeded) {
	var sUpdate = parent.g_UpdateCol(iUpdate); //A single entry from the update array
	var sUpdateID = iUpdate;
	var bInBasket = parent.g_aUpdate[iUpdate].InBasket;
	var bIsHidden = parent.g_aUpdate[iUpdate].IsHidden;
	var bDownloaded = false; //sUpdate.IsDownloaded;
	var bExclusive = parent.g_aUpdate[iUpdate].RebootRequired;
	var bDriver;
	var sBottomStyle = "", sUpdateDescription;
	var sUpdateRTFLink, sUpdateTitle, sSizeText = "";
	var str = "";
	var vSize = "";
	var iSize = 0;
	var sDivClass = "";
	var sckBasket = "", ckDecl = "";
	var sSupercededText = ""
	var sDetailsClass; //for details drop down class
	sUpdateTitle = sUpdate.Title;
	if (sUpdateTitle == null) {
		if (parent.conDevServer) {
			document.write ("<span>Missing strings: " + sUpdateID + ", " + sUpdateGUID + "</span><br />" + "\n");
		}
		return "";
	}
	if (bDriver) {
		sUpdateDescription = "";
	} else 	{
		sUpdateDescription = sUpdate.Description;
	}
	if (! bDriver ){
		sUpdateDetails = "&nbsp;&nbsp;<a href='javascript:fnDisplayDetails(\"" + iUpdate + "\");' style='color:blue;text-decoration:underline' >" + L_RListReadMore_Text + "</a>";
	}
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
		sSizeText += "&nbsp;<img src='shared/images/info_16x.gif' title='" + L_RListInfoGifAlt_Text + "'>";
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
	if(iSubPage != parent.conResultsHidden && iSubPage != parent.conExpressInstall & !bSUperceeded){
		ckDecl = "<span id='Decl" + iUpdate + "' ";
		if( bInBasket ) ckDecl += " DISABLED ";
		ckDecl += "><input id='ckDecl" + iUpdate + "' name='ckDecl" + iUpdate + "' style='margin-left:-3px;' type='checkbox' ";
		ckDecl += "onClick='fnModifyHidden(" + iUpdate + ");' ";
		if( bIsHidden ) ckDecl += " CHECKED ";
		ckDecl += "><label FOR='ckDecl" + iUpdate + "'>" + L_RListHideThisUpdate_Text + "</label></span>";
	}
	if(bExclusive) {
		//code to select the first exclusive critical update
		if(((iExclusiveUpdates > 1 || iSubPage != parent.conResultsBasket) || (iExclusiveUpdates > 0 && iCriticalUpdates > 0 &&  iSubPage == parent.conResultsBasket))&& iSubPage != parent.conExpressInstall ){
			if(parent.g_aUpdate[iUpdate].InBasket && sExclusiveSelection == ""){
				sExclusiveSelection  = iUpdate;
				SExclusiveradioButton = "<input  value = '" + iUpdate + "' checked onclick = 'fnExclusiveSelection(" + iUpdate  + ")' align = 'absmiddle' id = 'ExclusiveSelection' name = 'ExclusiveSelection' type = 'radio'  >" 
			} else {
				SExclusiveradioButton = "<input  value = '" + iUpdate + "'  onclick = 'fnExclusiveSelection(" + iUpdate  + ")' align = 'absmiddle' id = 'ExclusiveSelection' name = 'ExclusiveSelection' type = 'radio'  >" 
			}
		} else {
			SExclusiveradioButton = "";
		}
		
		if(parent.g_aUpdate[iUpdate].IsCritical == 1) {
			sCompanyHeadStyle = "style = 'color:#ff6600'";
		} else {
			sCompanyHeadStyle = "style = 'color:#004ab5'"
		}
		
		str = "<div id='Ttl" + iUpdate + "' " + "class='" + sDivClass + "'>" + "\n" +
				"	<div " + " class='updateTitle'>" +  SExclusiveradioButton + "\n" +
				"	<span " + sCompanyHeadStyle + ">" + L_RListSingleInstallationTitle_Text + "<a " + sCompanyHeadStyle + " title = '" + L_RListClickForDescription_Text + "'  href='javascript:fnExpandDetails(" + iUpdate + ");' id = 'aTitle" + iUpdate +"'><b>" + sUpdateTitle + "</b></a>" +  sSupercededText + "</span></div>" + "\n" +
				"	<span id='Det" + iUpdate + "' class = '" + sDetailsClass +"' >" + "\n" + 
				"	" + L_RListDownloadSize_Text + sSizeText + "<br />" + "\n" +
				"	" + sUpdateDescription + sUpdateDetails + "<br />" + "\n" +
				"	" + ckDecl + "<br />" + "\n" +
				"   </span></div><div class = 'gradGray'></div>" + "\n";	
		
	} else{
		if(bInBasket) {
			iTotalitemsSelected++;
		}		
		str += "<div id='Ttl" + iUpdate + "' " + "class='" + sDivClass + "'>" + "\n" +
			"	<div " + " class='updateTitle'>" + sckBasket + "\n" +
			"   <a title = '" + L_RListClickForDescription_Text + "' href='javascript:fnExpandDetails(" + iUpdate + ");' id = 'aTitle" + iUpdate +"'>" + sUpdateTitle + "</a>" + sSupercededText + "</div>" + "\n" + 
			"	<span id='Det" + iUpdate + "' class = '" + sDetailsClass +"'>" + "\n"  +
			"	" + L_RListDownloadSize_Text + sSizeText + "<br />" + "\n" +
			"	" + sUpdateDescription + sUpdateDetails + "<br />" + "\n" +
			"	" + ckDecl + "<br />" + "\n" +
			"   </span></div><div class = 'gradGray'></div>" + "\n";
	}
	return str;	
}
	
function fnDisplaySuperceded(sSupercedingUpdates) {
	var aSupercedingUpdates = sSupercedingUpdates.split(",");
	var i;
	var str = "";
	for(i = 0; i < aSupercedingUpdates.length; i++) {
		str += fnWriteUpdate(aSupercedingUpdates[i], false, true)
	}
	eSuperceded.innerHTML = str;
}

//function to set the select all checkbox status
function fnSelectallCheckboxActivity() {
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
	var bIsHidden = parent.g_aUpdate[iUpdate].IsHidden;
	if(iExpanded != -1) {
		document.all["aTitle" + iExpanded].title = L_RListClickForDescription_Text;	
		document.all["Det" + iExpanded].style.display = "none";
		document.all["Ttl" + iExpanded].className = "gradNone";
		document.all["Ttl" + iExpanded].style.backgroundColor = "#ffffff";
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
		document.all["aTitle" + iExpanded].title = L_RListClickToHideDescription_Text;
		document.all["Det" + iUpdate].style.display = "block";
	}
}

//function that sets the exclusive update variable
function fnSetExInBasket() {
	var i;
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

//funtion that does the sorting,removes hidden updates if not in restore hidden updates page dividing into 3 kinds of updates
function fnSortArange(sUp) {
	var i, j, aUpdates, sUpdates, aUpdatesSort
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
		for(i = 0; i < aUpdatesSort.length; i++) {			
			j = aUpdatesSort[i];
			sUpdates = parent.g_aUpdate[j];			 
			aUpdatesSort[i] = sUpdates.CompanyOrder + parent.g_sDelim + sUpdates.Company.toUpperCase() + parent.g_sDelim + 
								sUpdates.ProductFamilyOrder + parent.g_sDelim + sUpdates.ProductFamily.toUpperCase() + parent.g_sDelim + 
								sUpdates.SortDate + parent.g_sDelim +
								sUpdates.ProductOrder + parent.g_sDelim + sUpdates.Product.toUpperCase() + parent.g_sDelim + j;
		} 
		aUpdatesSort = aUpdatesSort.sort();
		sUp = "";
		for(i = 0; i < aUpdatesSort.length; i++) {
			aUpdatesSort[i] = aUpdatesSort[i].split(parent.g_sDelim)[7];
			sUp += (aUpdatesSort[i] + ",");
		}
		if(sUp != "") {
			sUp = sUp.substring(0, sUp.length - 1);	
		}
		aUpdates = sUp.split(",");
		for(i = 0; i < aUpdates.length; i++) {
			j = aUpdates[i];
			if(!parent.g_aUpdate[j].IsHidden || iSubPage == parent.conResultsHidden) {
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
	if(iSubPage == parent.conResultsBasket || iSubPage == parent.conExpressInstall) {
		if(iCriticalUpdates == 0 && iExclusiveUpdates == 0 && iOptionalUpdates == 0) {
			ePageDesc.innerHTML = L_RListNoExpress_Text;
		}
		if(iCriticalUpdates > 0 && iExclusiveUpdates == 0 && iOptionalUpdates > 0) {
			ePageDesc.innerHTML = L_RListReviewCriticalNoExclusive_Text;
		}
		if(iCriticalUpdates > 0 && iExclusiveUpdates > 0 && iOptionalUpdates == 0) {
			ePageDesc.innerHTML = L_RListReviewCriticalExclusive_Text;
		}
		if(iCriticalUpdates > 0 && iExclusiveUpdates == 0 && iOptionalUpdates == 0) {
			ePageDesc.innerHTML = L_RListReviewCriticalBasket_Text;
		}
		if(iCriticalUpdates == 0 && iExclusiveUpdates > 0 && iOptionalUpdates == 0) {
			ePageDesc.innerHTML = L_RListReviewExclusiveNoCritical_Text;
		}
		if(iCriticalUpdates == 0 && iExclusiveUpdates == 0 && iOptionalUpdates > 0) {
			ePageDesc.innerHTML = L_RListBasketUpdatesAvailableDesc_Text;
		}
	}	
	// to add select all check box
	if(iOptionalUpdates >= 6 && (iSubPage != parent.conResultsBasket && iSubPage != parent.conExpressInstall && iSubPage != parent.conResultsHidden)) {
		SelectallSpan.innerHTML = "<br/><span onmousedown = 'fnSelectUpdates()'><input  onclick = 'return false' type = 'checkbox' id = 'SelectUpdates' name = 'SelectUpdates' ></span> Select all <br />";
	}
	iTotalItems = iOptionalUpdates;
	
}

// Service the decline check box
function fnModifyHidden(iUpdate) {
	if(document.all["ckDecl" + iUpdate].checked) {
		parent.g_UpdateCol(iUpdate).IsHidden = true;
		parent.g_aUpdate[iUpdate].IsHidden = true;
		document.all["Ttl" + iUpdate].className = "gradGrayBG";
	} else {
		parent.g_UpdateCol(iUpdate).IsHidden = false ;
		parent.g_aUpdate[iUpdate].IsHidden = false;
		document.all["Ttl" + iUpdate].className = "gradYellow";
	}
}

// Add and remove items to/from basket	
function fnModifyBasket(iUpdate) {
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
		}
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
	eBasketStats.innerHTML = "&nbsp;" + iSelected + ", " + sSizeText;
}

// function to select exclusive updates
function fnExclusiveSelection(iRadiovalue) {	
	if(iRadiovalue != -1) {
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
}

//function to diaplay the title & description of the page 
function fnSetResultsPageVariables(bUpdatesAvailable) {
	var PageTitle, PageSubTitle, PageDescription;
	switch(iSubPage) {
		case parent.conResultsCritical:
			PageTitle = L_RListCriticalUpdatesTitle_Text;
			PageSubTitle = ""; 
			PageDescription = (bUpdatesAvailable) ? L_RListReviewCritical_Text : L_RListNoUpdates_Text;
			break;
		case parent.conResultsProduct:
			PageTitle = L_RListProductTitle_Text;
			PageSubTitle = ""; 
			PageDescription = L_RListProductDescription_Text;
			if(iTocIndex != ""){
				PageTitle = parent.g_aToc[iTocIndex].resultHeaderText + " " + L_RListUpdates_Text;
			}
			break;
		case parent.conResultsBasket:
			PageTitle = "<img src='shared/images/icon_wu_installnow_32x.gif' align='absmiddle' style='margin : 0px 4px 0px 0px'>" + L_RListBasketTitle_Text;
			PageSubTitle = ""; 
			PageDescription = (bUpdatesAvailable) ? L_RListReviewCritical_Text : L_RListNoUpdates_Text;
			break;
		case parent.conResultsDrivers:
			PageTitle = L_RListDriversTitle_Text;
			PageSubTitle =  "";
			PageDescription = L_RListDriversDescription_Text;
			if(iTocIndex != ""){
				PageTitle = parent.g_aToc[iTocIndex].resultHeaderText + " " + L_RListUpdates_Text;
			}
			break; 
		case parent.conResultsBeta:
			PageTitle = L_RListBetaTitle_Text;
			PageSubTitle =  "";
			PageDescription = L_RListBetaDescription_Text;
			break;
		case parent.conResultsHidden:
			PageTitle = L_RListHiddenTitle_Text;
			PageSubTitle =  ""; 
			PageDescription = L_RListHiddenDescription_Text;
			break;
		case parent.conExpressInstall: // for express install
			PageTitle = "<img src='shared/images/icon_wu_installnow_32x.gif' align='absmiddle' style='margin : 0px 6px 0px 0px'>" + L_RListExpressTitle_Text; 
			PageSubTitle = "";
			PageDescription = "";
			break;
	}
	DivPageTitle.innerHTML = PageTitle;
	//if(PageSubTitle != "") eSubTitle.innerHTML = PageSubTitle;
	if(PageDescription != "") ePageDesc.innerHTML = PageDescription;
}

//function to display the section header
function fnSectionHeader() {
	var hdrText, hdrStyle, solidStyle, hdr;
	switch(iSubPage) {
		case parent.conResultsCritical:
			hdrStyle = "gradDkBlue";
			hdrText = L_RListCriticalUpdatesBar_Text;
			solidStyle = "solidDkBlue";
			break;
		case parent.conResultsProduct:
			hdrStyle = "gradLtBlue";
			hdrText = L_RListOptionalSoftwareUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conResultsDrivers:
			hdrStyle = "gradLtBlue";
			hdrText = L_RListOptionalHardwareUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conResultsBeta:
			hdrStyle = "gradLtBlue";
			hdrText = L_RListOptionalBetaUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conResultsHidden:
			hdrStyle = "gradLtBlue";
			hdrText = L_RListHiddenUpdatesBar_Text;
			solidStyle = "solidLtBlue";
			break;
		case parent.conExpressInstall:
			hdrStyle = "gradDkBlue";
			hdrText = L_RListCriticalUpdatesBar_Text;
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
var sUpdate = parent.g_UpdateCol(iUpdate); //A single entry from the update array
var oUpdateimage = sUpdate.Image
var sWindowName = "window" + iUpdate;
DetailsForm.UpdateID.value=fnScriptinjectionCheck(iUpdate);
DetailsForm.Title.value=fnScriptinjectionCheck(sUpdate.Title);
DetailsForm.Description.value=fnScriptinjectionCheck(sUpdate.Description);
if(oUpdateimage != null){
	DetailsForm.ProductImageURL.value=fnScriptinjectionCheck(sUpdate.Image.Source);
	DetailsForm.ProductImageAltText.value=fnScriptinjectionCheck(sUpdate.Image.AltText);
	DetailsForm.ProductImageHeight.value=fnScriptinjectionCheck(sUpdate.Image.Height);
	DetailsForm.ProductImageWidth.value=fnScriptinjectionCheck(sUpdate.Image.Width);
}
DetailsForm.CPUSpeed.value=sUpdate.RecommendedCpuSpeed;
DetailsForm.HardDisk.value=parent.fnFormatSize(sUpdate.RecommendedHardDiskSpace);
DetailsForm.Memory.value=parent.fnFormatSize(sUpdate.RecommendedMemory);
DetailsForm.SupportURL.value=fnScriptinjectionCheck(sUpdate.SupportUrl);
DetailsForm.PublishedDate.value=formatdate(sUpdate.LastDeploymentChangeTime);
DetailsForm.Size.value=parent.fnFormatSize(parent.g_aUpdate[iUpdate].Size)//"&lt;script&gt;alert('here')&lt;/script&gt;"//parent.g_aUpdate[iUpdate].Size;//"<script>alert('here')</script>"
DetailsForm.MoreInfo.value=fnScriptinjectionCheck(parent.g_aUpdate[iUpdate].RTFLink);
DetailsForm.action="ItemDetails.aspx?" +  parent.conQueryString;
window.open("about:blank", sWindowName, "directories=no,width=400,height=400,location=no,menubar=no,status=no,toolbar=no,resizable=no,scrollbars=yes,top = 100,left = 100");
DetailsForm.target=sWindowName;
DetailsForm.submit();
}
function fnScriptinjectionCheck(sText){
	if(sText.Length > 0) {
		sText = sText.Replace("<", "&lt;");
		Query = Query.Replace(">", "&gt;");
	}
	return sText;
}
function formatdate(sDate){
	vTimeStamp = vbsCDate(sDate);
	vTimeStamp = vbsFormatDateTime(sDate, 2);
	return vTimeStamp;
}
function fnInstallUpdates(){
	if(((iExclusiveUpdates > 1) || (iExclusiveUpdates == 1 && iCriticalUpdates > 0))&& parent.g_aUpdate[aExclusiveUpdates[0]].InBasket){
		parent.fnInstallUpdates(aExclusiveUpdates[0]);
	}else{
		parent.fnInstallUpdates(-1);
	}
}
