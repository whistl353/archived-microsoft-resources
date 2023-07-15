//Copyright (c) Microsoft Corporation.  All rights reserved.
var oMain, oUpdate, aUpdate;
var oDoc = document;
var oTable;
var Title = "", Description = "", LastDeploymentChangeTime = "", Size, sSizeText = "";
var ImageSource = null, ProductImageAltText, ProductImageWidth, ProductImageHeight;
var RecommendedCpuSpeed, RecommendedMemory, RecommendedHardDiskSpace;
var UninstallationNotes = "", SupportURL = "", MoreInfo = "", MoreInfoURL = ""; 
var UninstallationSteps = "";

function writeDetails() {
	if(document.location.host ==  window.opener.parent.location.host){
		oTable = DetailsTable;	
		if(ipage == 0){
			fnSetVariablesItemDetails();
			fnAddTitleDescImgSizeDate();
			fnAddSysRequirements();
			fnAddUNInstallationNotesURLs();
		}else if(ipage == 1){
			fnSetVariablesHistoryDetails();	
			fnAddTitleDescImgSizeDate();
			fnAddUNInstallationNotesURLs();
		}
			
	}
}

function fnSetVariablesItemDetails(){
	oMain = window.opener.parent;	
	oUpdate = oMain.g_UpdateCol(index);
	aUpdate = oMain.g_aUpdate[index];
	
	Title = oUpdate.Title;
	document.title = Title;
	Description = oUpdate.Description;	
	if(oUpdate.Image != null) {
		ImageSource = oUpdate.Image.Source;
		ProductImageAltText = oUpdate.Image.AltText;
		ProductImageWidth= oUpdate.Image.Width;
		ProductImageHeight= oUpdate.Image.Height;
	}
	if(oUpdate.UninstallationSteps.Count > 0){
		UninstallationSteps = "<ul>"
		for(i=0; i<oUpdate.UninstallationSteps.Count; i++){
			UninstallationSteps += "<li>" + oUpdate.UninstallationSteps.Item(i)
		}
	}
	LastDeploymentChangeTime = oUpdate.LastDeploymentChangeTime;
	Size = aUpdate.Size;
	RecommendedCpuSpeed = oUpdate.RecommendedCpuSpeed;
	RecommendedMemory = oUpdate.RecommendedMemory;
	RecommendedHardDiskSpace = oUpdate.RecommendedHardDiskSpace;
	
	UninstallationNotes = oUpdate.UninstallationNotes;
	SupportURL = oUpdate.SupportURL;
	if(oUpdate.MoreInfoUrls.Count > 0) {
		MoreInfo = "<ul>"
		for(i=0; i<oUpdate.MoreInfoUrls.Count; i++){
			MoreInfoURL =  oUpdate.MoreInfoUrls(i);
			MoreInfo += "<li>" + "<a class='sys-link-normal' target='moreinfo' href='" + MoreInfoURL + "' Title='" + MoreInfoURL + "'>" + oUpdate.MoreInfoUrls(i)  + "</a><br>";
		}
	} 
	var s = LastDeploymentChangeTime;
	LastDeploymentChangeTime = "";
	if(s != null && s != "") {
		s = new Date(s);
		/*s.toLocaleDateString()
		s.toDateString()
		s.toLocaleString()
		s.toString()*/
		LastDeploymentChangeTime = L_DateFormat_Text.replace("%YYYY", s.getFullYear());
		LastDeploymentChangeTime = LastDeploymentChangeTime.replace("%MM", s.getMonth() + 1);
		LastDeploymentChangeTime = LastDeploymentChangeTime.replace("%DD", s.getDate());
	}
	
	if(Size > 0) {
		Size = oMain.fnFormatSize(Size);
		if(aUpdate.sizeIsTypical) {
			sSizeText = L_RListDownloadSizeTypical_Text + Size;
		} else {
			sSizeText = L_RListDownloadSize_Text + Size;
		}
	}
}

function fnSetVariablesHistoryDetails(){
	oMain = window.opener;
	oUpdate = oMain.g_aUpdateEvents.Item(index);
	Title = oUpdate.Title;
	document.title = Title;
	Description = oUpdate.Description;
	UninstallationNotes = oUpdate.UninstallationNotes;
	SupportURL = oUpdate.SupportUrl;
}

function fnAddTitleDescImgSizeDate(){
	oTR = oDoc.createElement("tr");
	oTable.appendChild(oTR);
	oTD = oDoc.createElement("td");
	oTR.appendChild(oTD);
	if(ImageSource != null){
		oImg = oDoc.createElement("img"); 
		oTD.appendChild(oImg);
		oImg.width = ProductImageWidth;
		oImg.height = ProductImageHeight;
		oImg.src = ImageSource;
		oImg.alt = ProductImageAltText;
		oImg.align = "left"
		oImg.style.verticalAlign="super";		
		oImg.style.marginRight="15px";		
	}
	if (Title != ""){
		oDiv = oDoc.createElement("div");
		oTD.appendChild(oDiv);
		oDiv.style.fontWeight = "bold";
		oDiv.innerText = Title;
	}
	if ( LastDeploymentChangeTime  != ""){  
		oDiv = oDoc.createElement("div");
		oTD.appendChild(oDiv);
		oDiv.innerText = L_PublishedDate_Text + " " + LastDeploymentChangeTime;		
	}
	if(sSizeText  != "" ){
		oDiv = oDoc.createElement("div");
		oTD.appendChild(oDiv);
		oDiv.innerText = sSizeText;
	}
	if ( Description  != ""){
		oTR = oDoc.createElement("tr");
		oTable.appendChild(oTR);
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oBR = oDoc.createElement("br");
		oTD.appendChild(oBR);
		oTD.innerText = Description
	}
}

function fnAddSysRequirements(){
	oTR = oDoc.createElement("tr");
	oTable.appendChild(oTR);
	oTD = oDoc.createElement("td");
	oTR.appendChild(oTD);
	oSpan = oDoc.createElement("span");
	oTD.appendChild(oSpan);
	oSpan.style.fontWeight = "bold";
	oSpan.innerText = L_SystemRequirements_Text;
	oBR = oDoc.createElement("br");
	oTD.appendChild(oBR);
	oSpan = oDoc.createElement("span");
	oTD.appendChild(oSpan);
	if(RecommendedCpuSpeed == 0){
		oSpan.innerText = L_RecommendedCPU_Text + ": " + L_DataNotAvailable_Text;
	}else{
		oSpan.innerText = L_RecommendedCPU_Text + ": " + RecommendedCpuSpeed + " MHz";
	}
	oBR = oDoc.createElement("br");
	oTD.appendChild(oBR);
	oSpan = oDoc.createElement("span");
	oTD.appendChild(oSpan);
	if(RecommendedMemory == 0){
		oSpan.innerText = L_RecommendedMemory_Text + ": " + L_DataNotAvailable_Text;
	}else{
		oSpan.innerText = L_RecommendedMemory_Text + ": " + RecommendedMemory + " MB";
	}
	oBR = oDoc.createElement("br");
	oTD.appendChild(oBR);
	oSpan = oDoc.createElement("span");
	oTD.appendChild(oSpan);
	if(RecommendedHardDiskSpace == 0){
		oSpan.innerText = L_RecommendedSpace_Text + ": " + L_DataNotAvailable_Text;
	}else{
		oSpan.innerText = L_RecommendedSpace_Text + ": " + RecommendedHardDiskSpace + " MB";
	}
}

function fnAddUNInstallationNotesURLs(){
	if (UninstallationNotes  != "")	{
		oTR = oDoc.createElement("tr");
		oTable.appendChild(oTR);
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oSpan = oDoc.createElement("span");
		oTD.appendChild(oSpan);
		oSpan.style.fontWeight = "bold";
		oSpan.innerText = L_HowToUnInstall_Text;
		oBR = oDoc.createElement("br");
		oTD.appendChild(oBR);
		oSpan = oDoc.createElement("span");	
		oTD.appendChild(oSpan);
		oSpan.innerText = UninstallationNotes;		
	}
	if(UninstallationSteps != ""){
		oBR = oDoc.createElement("br");
		oTD.appendChild(oBR);
		oSpan = oDoc.createElement("span");	
		oTD.appendChild(oSpan);
		oSpan.innerHTML = UninstallationSteps;	
	}
	if(SupportURL != "") {
		oTR = oDoc.createElement("tr");
		oTable.appendChild(oTR);
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oSpan = oDoc.createElement("span");
		oTD.appendChild(oSpan);
		oSpan.style.fontWeight = "bold";
		oSpan.innerText = L_SupportInformation_Text;
		oBR = oDoc.createElement("br");
		oTD.appendChild(oBR);
		oSpan = oDoc.createElement("span");
		oTD.appendChild(oSpan);
		oA = oDoc.createElement("a");
		oSpan.appendChild(oA);
		oA.innerText = SupportURL;
		oA.href = SupportURL ;
		oA.className = "sys-link-normal" ;
		oA.target = "support";			
	}
	if(MoreInfo != ""){
		oTR = oDoc.createElement("tr");
		oTable.appendChild(oTR);
		oTD = oDoc.createElement("td");
		oTR.appendChild(oTD);
		oSpan = oDoc.createElement("span");
		oTD.appendChild(oSpan);
		oSpan.style.fontWeight = "bold";
		oSpan.innerText = L_MoreInformation_Text;
		oBR = oDoc.createElement("br");
		oTD.appendChild(oBR);
		oSpan = oDoc.createElement("span");
		oTD.appendChild(oSpan);
		oSpan.innerHTML = MoreInfo;
		
	}
}

