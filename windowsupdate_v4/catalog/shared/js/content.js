

/*for sorting the results*/
var g_iFirstRow=1 //no of TR after the end of data
var conSortByText = 0;
var conSortByHTML = 1;
var conSortByValue = 2;
iCols=1
g_aSortOrder = new Array(iCols);
	g_aSortByValue = new Array(iCols);
	g_aIgnoreCase = new Array(iCols);
	g_bSortReverse=false
	
function sortitems()
{
if (sortselect.value == "0")
	fnSortTable(sortselect.value,false)
else
	fnSortTable(sortselect.value,true)
}
function fnSortTable(iSortBy,bSortReverse){
	var vRows, iRowsLen, oRow, bIgnoreCase, iSortByValue, oSortImage, aValues, sBaseValue, sCompareValue, sGreatestValue, bBaseIsGreater, i, j, k;
	var iBaseValue, iGreatestValue, iCompareValue;
	g_bSortReverse=bSortReverse
	vRows = eSortTable.rows;
	iRowsLen = vRows.length;
	bIgnoreCase = true;
	iSortByValue = iSortBy;

	if (iRowsLen > 2 )
	{
		// store values \\
		aValues = new Array(iRowsLen - g_iFirstRow);
	
		for(i = 0; i < iRowsLen - g_iFirstRow; i++){
			var oCell = vRows[i].children[0];
			if(iSortByValue == conSortByHTML){
				sBaseValue = oCell.children[0].innerHTML;
			}else if(iSortByValue == conSortByValue){
				sBaseValue = oCell.value;
			}else{
				sBaseValue = oCell.children[0].innerText;
			}
		/*code to remove blue bar at the end*/
		vRows[i].children[0].children[2].style.display="block"
		vRows[i].children[0].children[3].style.display="block"
		/*code to remove blue bar at the end*/
			if(bIgnoreCase) sBaseValue = sBaseValue.toLowerCase();
			aValues[i] = sBaseValue;
		}
		// sort \\
	
		for(iBaseValue = 0; iBaseValue < iRowsLen - g_iFirstRow; iBaseValue++){
			sBaseValue = aValues[iBaseValue];

			sGreatestValue = sBaseValue;
			iGreatestValue = iBaseValue;

			for(iCompareValue = iBaseValue + 1; iCompareValue < iRowsLen -1; iCompareValue++){
				sCompareValue = aValues[iCompareValue];

				bBaseIsGreater = g_bSortReverse ? (sGreatestValue < sCompareValue) : (sGreatestValue > sCompareValue);
				
				if(bBaseIsGreater){
					sGreatestValue = sCompareValue;
					iGreatestValue = iCompareValue;
				}
			}

			if(iGreatestValue != iBaseValue){
				eSortTable.moveRow(iGreatestValue , iBaseValue );
				fnMoveInArray(aValues, iGreatestValue, iBaseValue);
				
			}			
		}
		/*code to remove blue bar at the end*/
				
		vRows = eSortTable.rows	
		if(vRows[iRowsLen-2].children[0].children[2].children[0].tagName == "IMG")
			vRows[iRowsLen-2].children[0].children[2].style.display="none"
							
		else
			vRows[iRowsLen-2].children[0].children[3].style.display="none"
						
					
					
			
		/*code to remove blue bar at the end*/	
	}
	else
	{
		if(vRows[0].children[0].children[2].children[0].tagName == "IMG"){
			vRows[0].children[0].children[2].style.display="none"
			}
		else{
			vRows[0].children[0].children[3].style.display="none"
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
/*sorting funtions ends*/	

		
	/*functions to move,remove div*/
		
		function fnAddUpdate(oAddButton, sType){
			if (!parent.g_bDownloading){
				if (typeof(eMoveDiv) == "object")
					eMoveDiv.removeNode(true);
				window.clearTimeout(g_oMovDivTimer)
				eViewBasket.disabled = false;
				var oDiv = oAddButton.parentElement.parentElement;
				var oRemoveButton = oAddButton.nextSibling; 
				oAddButton.disabled = true;
				oRemoveButton.disabled = false;			
				fnMoveDiv(oDiv,1,1);
				eBasketStats.innerHTML = parseInt(eBasketStats.innerHTML) + 1;		
				parent.g_iCatalogBasketCount=parseInt(eBasketStats.innerHTML) ;
				parent.fnUpdateTOCBasket()	
				parent.frames['eTOC'].sBasketString = parent.frames['eTOC'].sBasketString + oDiv.id + ",";
				oDiv.className = "updateDisabled";
				switch(sType){
					case 'os':
						parent.frames['eTOC'].os_sBasket = parent.frames['eTOC'].os_sBasket + oDiv.id + ",";
						break;
					case 'driver' : 
						parent.frames['eTOC'].driver_sBasket = parent.frames['eTOC'].driver_sBasket + oDiv.id + ",";
						break;
					case 'software':
						parent.frames['eTOC'].software_sBasket = parent.frames['eTOC'].software_sBasket + oDiv.id + ",";
						break;
				}
			}		
			
		}
		
		
		function fnRemoveUpdate(oRemoveButton, sType, bCalledFromEmptyBasket ){
			if (!parent.g_bDownloading){
				if(!bCalledFromEmptyBasket){
					window.clearTimeout(g_oMovDivTimer)
					if (typeof(eMoveDiv) == "object")
						eMoveDiv.removeNode(true);
				}
				if( 1 == eBasketStats.innerText )
				{
					eViewBasket.disabled = true;
				}
				var oDiv = oRemoveButton.parentElement.parentElement;
				var oAddButton = oRemoveButton.previousSibling;
				var replacestring = oDiv.id + ","
				if( !bCalledFromEmptyBasket )
				{
					oAddButton.disabled = false;
					oRemoveButton.disabled = true;
					fnMoveDiv(oDiv, -1, 0);
					eBasketStats.innerHTML = parseInt( eBasketStats.innerHTML ) - 1;
					parent.g_iCatalogBasketCount=parseInt(eBasketStats.innerHTML);
					parent.fnUpdateTOCBasket()
					parent.frames["eTOC"].sBasketString = parent.frames["eTOC"].sBasketString.replace( replacestring, "" );
				}
				switch( sType ){
					case 'os':
						parent.frames['eTOC'].os_sBasket = parent.frames['eTOC'].os_sBasket.replace( replacestring  , "" );
						break;
					case 'driver' : 
						parent.frames['eTOC'].driver_sBasket = parent.frames['eTOC'].driver_sBasket.replace( replacestring  , "" );
						break;
					case 'software':
						parent.frames['eTOC'].software_sBasket = parent.frames['eTOC'].software_sBasket.replace( replacestring  , "" );
						break;
				}
				oDiv.className = "update"
			}
		}
		
		
		function fnRemoveFromBasket(oRemoveButton, sType){
			window.clearTimeout(g_oMovDivTimer)
					if (typeof(eMoveDiv) == "object")
						eMoveDiv.removeNode(true);
			if (!parent.g_bDownloading){	
				var oDiv = oRemoveButton.parentElement.parentElement;
				var replacestring = oDiv.id + ","
				fnMoveDiv(oDiv, 1, -1);
				parent.g_iCatalogBasketCount=parent.g_iCatalogBasketCount-1 ;				
				parent.fnUpdateTOCBasket()	
				parent.frames["eTOC"].sBasketString = parent.frames["eTOC"].sBasketString.replace( replacestring, "" );
				fnRemoveUpdate( oRemoveButton, sType, true );
				totalbasketsize = totalbasketsize - parseInt( oDiv.children[0].innerText );
				var basketarray=parent.frames["eTOC"].sBasketString.split(",");
				var sbasketstatus
				if ( totalbasketsize > 0)
					sbasketstatus=GetDownloadSizeText( totalbasketsize );
				else
					sbasketstatus=GetDownloadSizeText( 0 );
				eBasketStats.innerHTML = (basketarray.length - 1) + " = " + sbasketstatus;	
				
						
				if (basketarray.length - 1 <=0){
					//eViewBasket.disabled = true;
					noreviewandinstall.style.display="block"
					reviewandinstall.style.display="none";
					noupdates.style.display="block";
					updatesdisplay.style.display="none"
					txtform.dnow.disabled=true
					txtform.txtPathname.disabled=true
					txtform.browseb.disabled=true
				}
				var xmlid=""
				var divid=oDiv.id
				var idarray=divid.split(".")
				for (i=0;i<idarray.length-1;i++){
					if(i==idarray.length-2) 
						xmlid=xmlid+idarray[i] 
					else
						xmlid=xmlid+idarray[i] + "." 
				}
				var indexno
				var indexbool=false
				objnodes=xmlDoc.selectNodes("catalog/provider/item/identity/@itemID");
				for (i=0 ;i< objnodes.length ;i++){
					//alert(objnodes.item(i).text)
					if(objnodes.item(i).text == xmlid) {
						
						indexno=i
						indexbool=true;
					}
				}
				if (indexbool){
					//objnodes1=xmlDoc.selectNodes("catalog/provider");
					objnodes1=xmlDoc.documentElement.childNodes.item(indexno);
					//alert(objnodes1.xml)
					//alert(xmlDoc.xml)
					obdepnodes=xmlDoc.selectNodes("catalog/provider/item[identity/@itemID='" + xmlid + "']/dependencies/identity/@itemID")
					for (i=0 ;i< obdepnodes.length ;i++){
						//alert(obdepnodes.item(i).text)
						
						objdepnodes = xmlDoc.selectSingleNode("/catalog/provider[item/identity/@itemID='" + obdepnodes.item(i).text + "']")
						xmlDoc.documentElement.removeChild(objdepnodes);				
					}
					
					//alert(obdepnodes.length)
					xmlDoc.documentElement.removeChild(objnodes1);
				}
				//alert(xmlDoc.xml)
				
				
			}			
		}
		
		var g_oMovDivTimer, g_oDiv, g_iStage;
		var g_oMoveDivStyle;
		 
		function fnMoveDiv(oDiv, iStep, iStage){
			if (!parent.g_bDownloading){
				var iStartLeft, iStartTop, iFinishLeft, iStartWidth, iStartHeight, iDistance, iSteps;
				var oDocBody = document.body;
				var iTop = fnGetDistance(oDiv, "top") - eUpdatesContainer.scrollTop;
				//alert(eUpdatesContainer.scrollTop)
				var iLeft = fnGetDistance(oDiv, "left");
				var iWidth = oDiv.offsetWidth;
				var iHeight = oDiv.offsetHeight;
			
				var oSourceObject = eBasketStats;
				var iSourceObjectTop = fnGetDistance(oSourceObject, "top") + .5*oSourceObject.offsetHeight;
				var iSourceObjectLeft = fnGetDistance(oSourceObject, "left") + .5*oSourceObject.offsetWidth;
			
				var oMoveDiv = oDiv.cloneNode(true);
				oDocBody.insertBefore(oMoveDiv);
				oMoveDiv.id = "eMoveDiv";
				oMoveDiv.className = "update";
			
				g_oDiv = oDiv;
				g_iStage = iStage;
			
				if(iStep == 1){
					iStartTop = iTop;
					iStartLeft = oDocBody.offsetWidth - iWidth - 10;
					iFinishTop = iSourceObjectTop;
					iFinishLeft = iSourceObjectLeft;
				}
				else{
					iFinishLeft = oDocBody.offsetWidth - iWidth - 10;
					iStartTop = iSourceObjectTop;
					iStartLeft = iSourceObjectLeft;
					iFinishTop = iTop;
				}
				iSteps = 10;
				if(iStep == 1){
					iStartWidth = iWidth;
					iStartHeight = iHeight;
				}else{
					iStartWidth = iWidth/iSteps;
					iStartHeight = iHeight/iSteps;
				}
			
				g_oMoveDivStyle = eMoveDiv.style;
				g_oMoveDivStyle.left = iStartLeft;
				g_oMoveDivStyle.top = iStartTop;
				g_oMoveDivStyle.width = iStartWidth;
				g_oMoveDivStyle.height = iStartHeight;
				var iLeftInc = (iFinishLeft - iStartLeft)/iSteps;
				var iTopInc = (iFinishTop - iStartTop)/iSteps;
				var iWidthInc = iStep*iWidth/iSteps;
				var iHeightInc = iStep*iHeight/iSteps;
				g_oMovDivTimer = fnMove(iWidthInc, iHeightInc, iLeftInc, iTopInc, 0, iSteps);
			}
		}
		
		
		function fnMove(iWidthInc, iHeightInc, iLeftInc, iTopInc, i, iMax){ 
			if (!parent.g_bDownloading){
				g_oMoveDivStyle.posTop += iTopInc;
				g_oMoveDivStyle.posWidth -= iWidthInc;
				g_oMoveDivStyle.posHeight -= iHeightInc;
				g_oMoveDivStyle.posLeft += iLeftInc;
				if(g_oMoveDivStyle.posHeight == 0) g_oMoveDivStyle.posHeight = -1; /* IE5.5 BUG */
				if(++i < iMax){
					g_oMovDivTimer = window.setTimeout("fnMove(" + iWidthInc + ", " + iHeightInc + ", " + iLeftInc + ", " + iTopInc + ", " + i + ", " + iMax + ")", 25);
				}else{
					fnEndMove();
				}
			}
		}
			
		function fnEndMove(){
			window.clearTimeout(g_oMovDivTimer);
			eMoveDiv.removeNode(true);
			if (g_iStage==-1){
			
				row=g_oDiv.parentElement.parentElement
				row.removeNode(true);
				aRows = eSortTable.rows	
				ilastelement=aRows.length - 2
				
				if(ilastelement >= 0 )	
					aRows[ilastelement].children[0].children[2].style.display="none"
				
			}
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
		
		conKB = 1024;
		conMB = 1048576;
		g_iConnectionSpeed =parent.g_iConnectionSpeed;;
		function GetDownloadSizeText(iSize){
			sSize = FormatSize(iSize);
			iMinutes = GetDownloadTime(iSize);
			iHours = 0;
			if (iMinutes >= 60 ){
				iHours = Math.round(iMinutes/60) 
				iMinutes = iMinutes - iHours*60;

				if (iHours == 1) 
					sHours = Hour
				else
					sHours = Hours
				
			}
			
			if (iMinutes > 0 && iMinutes < 1.5) 
				sMinutes = Minute
			else
				sMinutes = Minutes
			
			bLessThan = (iMinutes > 0 && iMinutes < 1);

			if (bLessThan)
				iMinutes = 1;
			else
				iMinutes = Math.round(iMinutes);
			sDownloadSizeText=sSize
			if(iMinutes>0){
				if (iHours > 0 ){
					sDownloadSizeText = sDownloadSizeText + ", " + iHours + " " + sHours + " " + iMinutes + " " + sMinutes;	
				}else{
					sLessThan=""
					if (bLessThan){ 
						sLessThan = "&lt; ";
					}
					sDownloadSizeText = sDownloadSizeText + ", " + sLessThan + iMinutes + " " + sMinutes;
				}
			}
			sDownload =  " <b>" + sDownloadSizeText + "</b>";
			
			return sDownload;
		}


		function FormatSize(iSize){
			if (iSize >= conMB) {
				Size = Math.round(iSize/conMB) + " " + MB
			}else{
				Size = Math.round(iSize/conKB) + " " + KB
			}
			return Size;
		}

		function GetDownloadTime(iSizeKB){
			if (parent.g_iConnectionSpeed == 0){
				iDownloadTime = 0;
			}
			else{
				iDownloadTime = (iSizeKB/parent.g_iConnectionSpeed)/60;
			}
			return iDownloadTime;
		}


/*showing dependencies*/
function fnShowDependencies(oLink,bshow){
	var oSpan = oLink.parentElement;
	var oDetailsdiv=oSpan.nextSibling
	if(bshow){
		oLink.innerText=parent.L_DependenciesHide_Text + " <<"; 
		//oLink.style.color = "white";
		oLink.style.textDecoration = "none";
		oLink.onclick = new Function("fnShowDependencies(this, false);");
		//oSpan.style.backgroundColor = "#264D9B";
		oDetailsdiv.style.display="block"
	}
	else{
		oLink.innerText=parent.L_DependenciesShow_Text + " >>"; 
		//oLink.style.color = "white";
		oLink.style.textDecoration = "none";
		oLink.onclick = new Function("fnShowDependencies(this, true);");
		//oSpan.style.backgroundColor = "#264D9B";
		oDetailsdiv.style.display="none"
	}
}



/* show show more */

function fnDisplayRTF(sRTFURL){ // dialog with all update data
	var iTop, iLeft;

	iTop = (document.body.clientHeight - 400)/2;
	iLeft = (document.body.clientWidth - 400)/2;
	window.open(sRTFURL, "_blank", "directories=no,width=400,height=400,left=" + iLeft + ",top=" + iTop + ",location=no,menubar=yes,status=no,toolbar=no,resizable=yes,scrollbars=yes");
}
		
/* function to underline text side of the image*/
function imgancmover(imgmover){
	//alert(imgmover.parentElement.parentElement.children[1].children[0].tagName)
	var linkafterimg=imgmover.parentElement.parentElement.children[1].children[0]
	linkafterimg.style.textDecoration="underline"
	}
function imgancmout(imgmout){
	//alert(imgmout.parentElement.parentElement.children[1].children[0].tagName)
	var linkafterimg=imgmout.parentElement.parentElement.children[1].children[0]
	linkafterimg.style.textDecoration="none"
	}
		
	function fnRemoveDuplicates(aArray){
		var iArrayLen, aReturnArray, iReturnArrayLen, vValue, bFound, i, j;

		iArrayLen = aArray.length;
		aReturnArray = [];

		for(i = 0; i < iArrayLen; i++){
			vValue = aArray[i];
			bFound = false;
			iReturnArrayLen = aReturnArray.length;

			for(j = 0; j < aReturnArray.length; j++){
				if(vValue == aReturnArray[j]){
					bFound = true;
					break;
				}
			}

			if(!bFound) aReturnArray[iReturnArrayLen] = vValue;
		}

		return aReturnArray;
	}
	
	
	function removefromxml(seula){
		aremoveeulas=xmlDoc.selectNodes("catalog/provider/item/description/descriptionText[eula/@href = '" + seula + "']")
		for (i=0;i<aremoveeulas.length;i++){
			id=aremoveeulas.item(i).parentNode.parentNode.firstChild.getAttribute("itemID")
			osbasket=parent.frames['eTOC'].os_sBasket
			osbasketarray=osbasket.split(",")
			for(j=0;j<osbasketarray.length-1;j++){
				if(osbasketarray[j].search(id)>=0 ){
					remos_sBasket=remos_sBasket+osbasketarray[j] + ","
				}
			}
			driverbasket=parent.frames['eTOC'].driver_sBasket
			driverbasketarray=driverbasket.split(",")
			for(j=0;j<driverbasketarray.length;j++){
				if(driverbasketarray[j].search(id)>=0 ){
							
					remdriver_sBasket=remdriver_sBasket + driverbasketarray[j]+","
				}
			}
			xmlDoc.documentElement.removeChild(aremoveeulas.item(i).parentNode.parentNode.parentNode);
		}
		
	}
	
	function fnArrayFromNodesText(vNodes){
		var iArrayLen, aArray, i;

		iArrayLen = vNodes.length;
		aArray = new Array(iArrayLen);
		for(i = 0; i < iArrayLen; i++) aArray[i] = vNodes[i].text;
		return aArray;
	}
	
	
	function fnDisplayEULA(aUpdateTitles, sURL){
		var sWidth;
		//if(g_oPopup) g_oPopup.close();
		//alert(aUpdateTitles)
		g_bEULAAccepted = false;
		if(navigator.userAgent.indexOf("MSIE 6") > 0) {
			sWidth = "420";
		}else{
			sWidth = "380"
		}
		g_oInstallationXML = xmlDoc
		g_oPopup = window.showModalDialog("eula.asp?titles=" + aUpdateTitles.join("|@|") + "&url=" + sURL ,[window], "dialogWidth:" + sWidth + "px;dialogHeight:450px;help:no;scroll:auto;status:no;");
		return g_bEULAAccepted;
	}
	
	
	
	
	
