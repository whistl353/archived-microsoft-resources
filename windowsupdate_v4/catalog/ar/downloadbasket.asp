
<script language="javascript">

/*function window::onResize() {
	fnPositionCopyrightLink()
}*/
function window::onload(){
	
if(!parent.conDevServer){
		document.ondragstart = new Function("return false;");
		document.oncontextmenu = new Function("return false;");
	}
	//document.oncontextmenu = new Function("return false;");
}
function checkrightclick(){
event.cancelBubble=true;
return true;
}
/*function fnPositionCopyrightLink(){
	eCopyright.style.position = "static";
	var tmr = window.setTimeout("fnPCL()",1000);
	eCopyright.style.display = "none";
}*/


function fnPCL() {
	var iContentHeight, iAvailableHeight;
	
	eCopyright.style.position = "static";
	iContentHeight = document.body.scrollHeight;
	iAvailableHeight = document.body.offsetHeight;

	if(iContentHeight <= (iAvailableHeight - 25)){
		eCopyright.style.position = "absolute";
		eCopyright.style.top = "auto";
		eCopyright.style.bottom = "0px";
	}else{
		eCopyright.style.position = "static";
	}
	eCopyright.style.display = "block"
	//window.status = "contentHeight=" + iContentHeight + ", AvailableHeight=" + iAvailableHeight + ", position=" + eCopyright.style.position
}


/* for sorting the the language*/
function sortlanguage(selectname,formname){
	var iTxt = new Array();
	var sTxt = new Array();
	var nLang = 25;

	iTxt[0]="ÇáÚÑÈíÉ" + "@" + "ar|1256"
	//iTxt[1]="ÏÚã ááÛÉ ÇáÚÑÈíÉ" + "@" + "en_arabic|1252"
	iTxt[1]="ÊÑßí" + "@" + "tr|1254"
	iTxt[2]="Õíäí ãÈÓøØ " + "@" + "zhcn|936"
	iTxt[3]="Õíäí ÊŞáíÏí " + "@" + "zhtw|950"
	iTxt[4]="ÇáÊÔíßíÉ" + "@" + "cs|1250"
	iTxt[5]="ÇáÏÇäãÇÑßíÉ" + "@" + "da|1252"
	iTxt[6]="ÇáåæáäÏíÉ" + "@" + "nl|1252"
	iTxt[7]="ÇáÅäßáíÒíÉ" + "@" + "en|1252"
	iTxt[8]="ÇáİäáäÏíÉ" + "@" + "fi|1252"
	iTxt[9]="ÇáİÑäÓíÉ" + "@" + "fr|1252"
	iTxt[10]="ÇáÃáãÇäíÉ" + "@" + "de|1252"
	iTxt[11]="ÇáíæäÇäíÉ" + "@" + "el|1253"
	//iTxt[12]="IBM íæäÇí" + "@" + "el_ibm|869"
	iTxt[12]="ÓæíÏí" + "@" + "sv|1252"
	iTxt[13]="ÇáÚÈÑíÉ" + "@" + "he|1255"
	//iTxt[14]="ÏÚã ááÛÉ ÇáÚÈÑíÉ" + "@" + "en_hebrew|1252"
	iTxt[14]="ÇÓÈÇäí" + "@" + "es|1252"
	iTxt[15]="ÇáåäÛÇÑíÉ" + "@" + "hu|1250"
	iTxt[16]="ÇáÅíØÇáíÉ" + "@" + "it|1252"
	iTxt[17]="ÇáíÇÈÇäíÉ" + "@" + "ja|932"
	iTxt[18]="NEC íÇÈÇäí" + "@" + "nec|932"
	iTxt[19]="ÇáßæÑíÉ" + "@" + "ko|949"
	iTxt[20]="ÇáäÑæíÌíÉ" + "@" + "no|1252"
	iTxt[21]="ÇáÈæáæäíÉ" + "@" + "pl|1250"
	iTxt[22]="ÈÑÊÛÇáí (ÇáÈÑÇÒíá)" + "@" + "ptbr|1252"
	iTxt[23]="ÈÑÊÛÇáí (ŞíÇÓí)" + "@" + "pt|1252"
	iTxt[24]="ÑæÓí" + "@" + "ru|1251"
	//iTxt[25]="ÓáæİÇßí" + "@" + "sk|1250"
	//iTxt[26]="Óáæİíäí" + "@" + "sl|1250"
	
	
	//iTxt[29]="ÏÚã ááÛÉ ÇáÊÇíáÇäÏíÉ" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="ar"
	
	s += "<select NAME='" + selectname + "' ID='" + selectname + "' onchange='sethiddendata(" + selectname + "," + formname + ")'>"
	for(i=0; i < nLang; i++) {	
		a = jTxt[i].split("@")
		aa=a[1].split("|")
		if (aa[0].toLowerCase( )== lan.toLowerCase( )){
			s += "<option VALUE=" + a[1] + " Selected>" + a[0] + "</option>"
		}
		else{
			s += "<option VALUE=" + a[1] + ">" + a[0] + "</option>"
		}
		
	}
	s += "</select>"	
	
	languagecont.innerHTML=s
	HSelLang = eval(formname + ".HSelLang")
	if (HSelLang.value != 0 ){
		selecttext=eval(formname + "."  + selectname)		
		selecttext.value=HSelLang.value
	}
	
}


/*for sorting the the language*/

function sethiddendata(selectname,formname){
	HSelLang = eval(formname.name + ".HSelLang")	
	HSelLang.value=selectname.value	
}

</script><html dir='rtl'>
<head>
<title>Microsoft Windows Update</title>
<meta NAME="robots" CONTENT="noindex">
<meta http-equiv="Content-Type" content="text/html;charset=windows-1256" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'>
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="/catalog/shared/css/content.css">
<link rel="stylesheet" type="text/css" href="hcp://system/css/shared.css" />

<script language="jscript">

function selectlink(){
	var vLinks =parent.frames["eTOC"].document.links;
	var iLinksLen = vLinks.length;
	for(i = 0; i < iLinksLen; i++)
		vLinks[i].className = "";
	parent.frames["eTOC"].eCorporateBasket.className="selected";
}

</script>


	<script language="JScript" type="text/javascript" src="/catalog/shared/js/content.js"></script>
	<script language="JScript">
		var sType = "driver";
		var g_textboxcheckTimer;

		function sizebutton(){
		checkKey()
		g_textboxcheckTimer = window.setInterval("checkKey()", 500);
		if(totalbasketsize <= 0)  {
			noreviewandinstall.style.display="block"
			reviewandinstall.style.display="none";
		}

		aRows = eSortTable.rows

			ilastelement=aRows.length - 2
			//alert(vRows[ilastelement].children[0].children[1].children[8].innerHTML)
			if (ilastelement >= 0){
				aRows[ilastelement].children[0].children[2].style.display="none";
			}

 			return;
			var buttonarray=document.all.tags("button")
			var addlength=addspan.offsetWidth + 10
			var removelength=removespan.offsetWidth + 10
			for (i=0;i<buttonarray.length;i++){
				if(buttonarray[i].innerHTML == "ÅÖÇİÉ")
					buttonarray[i].style.width = addlength
				if(buttonarray[i].innerHTML == "ÅÒÇáÉ")
					buttonarray[i].style.width = removelength
			}

		}
		function cleartimer(){
			window.clearInterval(g_textboxcheckTimer);
		}
	</script>
</head>
<body onbeforeunload="cleartimer();" onload="sizebutton();parent.eTOC.fnSyncTOC(window.location.href, &quot;CatalogBasket&quot;, -1)" class="results" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;" style="overflow:hidden">
<form name="basketform" id="basketform" action="downloadbasket.asp" method="post">
	<input type="hidden" name="os_sBasket" id="os_sBasket">
	<input type="hidden" name="driver_sBasket" id="driver_sBasket">
	<input type="hidden" name="location" id="location">
</form>
<table cellspacing="0" cellpadding="0" border="0">
	<tbody>
	<tr><td height="1"><span class="8pt sys-font-body sys-color-body" id="addspan" name="addspan" style="visibility:hidden;height=1;overflow;hidden">ÅÖÇİÉ</span><span class="8pt sys-font-body sys-color-body" name="removespan" id="removespan" style="visibility:hidden;height=1;overflow;hidden">ÅÒÇáÉ</span></td></tr>
		<tr>
			<td valign="top" height="40em">
				<div>
					<div valign="middle" style="background-color:#Ffffcc;padding-top:3;padding-bottom:5;padding-left:10">
						<nobr><img src="/catalog/shared/images/basket32_icon.gif" class="icon32" alt="View items in basket" / WIDTH="32" HEIGHT="32">
						<span class="title sys-font-heading3 sys-rhp-color-title">ÊÍãíá ÇáÓáÉ</span></nobr>
					</div>
				</div></td>
		</tr>
		<tr>
			<td valign="top">
				<div name="reviewandinstall"id="reviewandinstall">
					<div   class="8pt sys-font-body sys-color-body"><b>ãÑÇÌÚÉ æÊÍãíá ÇáÊÍÏíËÇÊ ÇáãÍÏÏÉ ÇáÎÇÕÉ Èß</b></div>
					<div  class="8pt sys-font-body sys-color-body"><!--<img src="/catalog/images/ts.gif" height="1" width="56">-->ÍÏÏ ãæŞÚ ÇáÊÍãíá ÇáĞí ÊÑíÏå æãä Ëã ÇäŞÑ İæŞ <b>ÇáÊÍãíá ÇáÂä</b>. áÅÒÇáÉ ÚäÕÑ ãä ÇáÓáÉ, ÇäŞÑ İæŞ <b>ÅÒÇáÉ</b>.</div>
				</div>
				<div name="noreviewandinstall"id="noreviewandinstall" style="display:none">
					<div   class="8pt sys-font-body sys-color-body"><b><b>áÇ íæÌÏ ÊÍÏíËÇÊ İí ÇáÓáÉ ÇáÎÇÕÉ Èß</b></b></div>
					<div  class="8pt sys-font-body sys-color-body"><!--<img src="/catalog/images/ts.gif" height="1" width="56">-->áÊÍÏíÏ ÊÍÏíËÇÊ áíÊã ÊÍãíáåÇ, ÇäŞÑ İæŞ <b>ãÑÍÈÇğ Èß İí äÔÑÉ Windows Update</b> Ãæ İÆÉ ãæÌæÏÉ ÃÓİáåÇ, æÃÑÓá ãÚÇííÑ ÇáÈÍË.</div>
				</div>
			</td>
		</tr>
		<tr>
			<td valign="top" height="63em">
			<form name="txtform" id="textform" action="downloadbasket.asp" onsubmit="return downloadnow();">
				<div>
					<div class="8pt sys-font-body sys-color-body">&nbsp;<br><nobr>ÇßÊÈ Ãæ ÇÓÊÚÑÖ ãæŞÚ ÇáÊÍãíá ÇáĞí ÊÎÊÇÑå:</nobr></div>
					<div class="10pt sys-font-heading4">
						<nobr>
						<input id="txtPathname" name="txtPathname" type="text" value="" size="50" maxlength="60" onKeyUp="checkKey();" oncontextmenu="checkrightclick()">
						&nbsp;&nbsp;

						<button onresize="document.recalc('true')" style="width:expression(browsespan.offsetWidth + 10)" onClick="javascript:goBrowse()" id="browseb" name="browseb">
							<span id="browsespan" name="browsespan">ÇÓÊÚÑÇÖ...</span></button></nobr>

					</div>
				</div>

			</td>
		</tr>
		<tr>
			<td height="30em">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="8pt sys-font-body sys-color-body">


								<button id="dnow" name="dnow" type="submit" style="width:expression(downspan.offsetWidth + 10)" disabled><span name="downspan" id="downspan">ÇáÊÍãíá ÇáÂä</span></button>
								<br>
							</td>
						</tr>
					</table>
			</td>
		</tr>
		<!--<tr><td valign="top" height="30em"><span class="8pt sys-font-body sys-color-body"onclick="fnSortTable(0,false)">sort by text</span><br/>
			<span class="8pt sys-font-body sys-color-body"onclick="fnSortTable(2,true)">sort by date</span>
		</td></tr>-->
		<tr>
			<td class="resultsBasketBar sys-table-header-bgcolor1 sys-table-color-border sys-toppane-header-color" valign="top">
				<span id="eBasketCalculating">ÇáÅÌãÇáí (ÊÊÖãä ÇáãÊØáÈÇÊ ÇáãÓÈŞÉ):</span> <span id="eBasketStats"></span>
			</td>
		</tr>
		<tr>
			<td height="100%">
				<div id="eUpdatesContainer" class="eUpdatesContainer sys-table-color-border sys-table-cell-bgcolor2">

					<div id="noupdates" class="8pt sys-font-body sys-color-body" style="display:none">
						<br>
						<p>
						<center>
						<b>áÇ íæÌÏ ÃíÉ ÊÍÏíËÇÊ İí ÇáÓáÉ ÇáÎÇÕÉ Èß.</b>
						</center>
					</div>
					<div id="updatesdisplay" name="updatesdisplay">
					<table id="eSortTable" name="eSortTable" cellspacing="0">
					<tbody >
				

					<tr><td height="100%"></td></tr>
					</tbody>
					</table>
					</div>
				</div>
			</td>
		</tr>

	</tbody>
</table>

<script language="jscript">
//fnSortTable(2,false)
	totalbasketsize = 0;
	if (parent.frames['eTOC'].sBasketString==""){
		noupdates.style.display="block"
		updatesdisplay.style.display="none"
		totalbasketsize=-1
	}else{
		noupdates.style.display="none"

	}

	var basketarray=parent.frames["eTOC"].sBasketString.split(",");
	var Hour="ÓÇÚÉ"
	var Hours="ÓÇÚÇÊ";
	var Minute="ÏŞíŞÉ";
	var Minutes="ÏŞÇÆŞ";
	var DownloadSize="ÍÌã ÇáÊÍãíá:"
	var MB="ã È"
	var KB="ß È"
	var basketarray=parent.frames["eTOC"].sBasketString.split(",");
	eBasketStats.innerHTML = basketarray.length - 1
	var remos_sBasket,remdriver_sBasket
	remos_sBasket=""
	remdriver_sBasket=""

	if(totalbasketsize < 0) {
	txtform.dnow.disabled=true
	txtform.txtPathname.disabled=true
	txtform.browseb.disabled=true
	}

	var controlxml='<catalog xmlns="x-schema:http://schemas.windowsupdate.com/iu/catalogschema.xml" clientType="CORP"></catalog>'
	eBasketStats.innerHTML = (basketarray.length - 1) + " = " + GetDownloadSizeText(0)
	var xmlDoc = new ActiveXObject("Microsoft.XMLDOM")

	xmlDoc.async=false
	xmlDoc.validateOnParse=false
	xmlDoc.resolveExternals=false
	xmlDoc.preserveWhiteSpace=false
	xmlDoc.loadXML(controlxml)
	/*objNode = xmlDoc.documentElement.childNodes.item(0).childNodes.item(2).childNodes.item(1);
	alert(objNode.text);
	alert("karuna1")*/
function downloadnow(){
//alert(controlxml)
		//Make sure there are items in the basket
		if(totalbasketsize < 0)  {
			return false
		}
		//Validate the path exists and is accessible (no dialog box)
		var s = txtform.txtPathname.value
		var bstrStartFolder = parent.control_BrowseForFolder(s, 5)
		if(bstrStartFolder == "" || false == bstrStartFolder) {
			var badpath="ÊÚĞÑ Úáì Windows Update ÇáÊÍãíá Åáì ÇáãÌáÏ ÇáãÍÏÏ. ÅãÇ Ãä ÇáãÌáÏ ÛíÑ ãæÌæÏ Ãæ Ãä áíÓ áÏíß ÇáÃĞæäÇÊ ÇáßÇİíÉ áÅÖÇİÉ ÚäÇÕÑ Åáíå. ÇáÑÌÇÁ ÇáÊÃßÏ ãä ÊÍÏíÏ ÇáãÓÇÑ ÇáÕÍíÍ áåĞÇ ÇáãÌáÏ¡ Ãæ Şã ÈÊÍÏíÏ ãæŞÚ ÂÎÑ.";
			alert(badpath);
			return false;
		}
		parent.g_sDownloadPath = s
		parent.g_bDownloading = true;
		window.clearInterval(g_textboxcheckTimer);
		txtform.dnow.disabled=true;
		parent.g_oInstallationXML = xmlDoc
		var vEULAs, iEULAsLen, sEULA, vUpdateTitles, i,remitems;
		vEULAs = xmlDoc.selectNodes("catalog/provider/item/description/descriptionText/eula/@href");
		//alert(vEULAs.length)
		iEULAsLen = vEULAs.length;
		vEULAs = fnArrayFromNodesText(vEULAs);
		vEULAs = fnRemoveDuplicates(vEULAs);
		iEULAsLen = vEULAs.length;
		for(i = 0; i < iEULAsLen; i++){
			sEULA = vEULAs[i]
			vUpdateTitles = xmlDoc.selectNodes("catalog/provider/item/description/descriptionText[eula/@href = '" + sEULA + "']/title");
			vUpdateTitles = fnArrayFromNodesText(vUpdateTitles);
			//if(!fnDisplayEULA(vUpdateTitles, sEULA)){
			if(!parent.fnDisplayEULA(sEULA) ) {
				removefromxml(sEULA)
			}
		}
		parent.frames['eTOC'].eulaNA_OSBasket=remos_sBasket
		parent.frames['eTOC'].eulaNA_DriverBaket=remdriver_sBasket
		//parent.frames['eTOC'].sBasketString=remos_sBasket+remdriver_sBasket

		//to display no of items in the left basket
		var basketarray=parent.frames["eTOC"].sBasketString.split(",");
		parent.g_iUpdatesLen=basketarray.length - 1
		parent.fnUpdateTOCBasket()
		remitems=xmlDoc.selectNodes("catalog/provider/item");
		if (remitems.length <= 0){
			location.href="downloadbasket.asp?driver_sbasket=" + remdriver_sBasket + "&os_sbasket=" + remos_sBasket
			basketform.os_sBasket.value=parent.frames["eTOC"].os_sBasket;
			basketform.driver_sBasket.value=parent.frames["eTOC"].driver_sBasket;
			basketform.location.value=txtform.txtPathname.value
			parent.g_bDownloading=false;
			basketform.submit();
			return false;
		}
		g_sInstallationXML = xmlDoc.xml;
		parent.g_oInstallationXML = xmlDoc;
		aupdatetitles=xmlDoc.selectNodes("catalog/provider/item/description/descriptionText/title");
		aupdatetitles=fnArrayFromNodesText(aupdatetitles);
		parent.fnDisplayDownload(aupdatetitles.length,0,true);
		return false
	}

	function goBrowse() {
		var bstrStartFolder = "";
		var flag = 0;
		var pbstrFolder = parent.control_BrowseForFolder(bstrStartFolder,flag)

		if(pbstrFolder == false) {
			pbstrFolder = "";
		}
		var sAlert;

		if(pbstrFolder.length >=50){
			//sAlert = 'The download path must contain fewer than 50 characters. The path you have specified is:\n\r' + pbstrFolder + "\n\r\n\r" + 'Type or browse to a download path that is fewer than 50 characters long.'
			sAlert = 'şşíÌÈ Ãä íÍÊæí ãÓÇÑ ÇáÊÍãíá Úáì ÃŞá ãä 50 ÍÑİÇğ. ÇáãÓÇÑ ÇáĞí ÍÏÏÊå åæ: \n\r' + pbstrFolder + "\n\r\n\r" + 'şşÇßÊÈ Ãæ ÇÓÊÚÑÖ ãÓÇÑ ÊÍãíá íÍÊæí Úáì ÃŞá ãä 50 ÍÑİÇğ.'
			alert(sAlert)
		}
		if(pbstrFolder != "" && pbstrFolder.length <=50) {
			 txtform.txtPathname.value = pbstrFolder;
			if(totalbasketsize != 0) {
				txtform.dnow.disabled=false
				//checkKey()
			}
		}
	}

	function checkKey() {
		//var s = window.event.keyCode;
		var s1 = txtform.txtPathname.value;
		var sAlert;
		//window.event.cancelBubble=true;
		//alert("here")
		//if((s == 13) && (s1 != "")) {
		//	downloadnow();

		//}
		if (s1.length >= 50){
			//sAlert = 'The download path must contain fewer than 50 characters. The path you have specified is:\n\r' + s1 + "\n\r\n\r" + 'Type or browse to a download path that is fewer than 50 characters long.'
			sAlert = 'şşíÌÈ Ãä íÍÊæí ãÓÇÑ ÇáÊÍãíá Úáì ÃŞá ãä 50 ÍÑİÇğ. ÇáãÓÇÑ ÇáĞí ÍÏÏÊå åæ: \n\r' + s1 + "\n\r\n\r" + 'şşÇßÊÈ Ãæ ÇÓÊÚÑÖ ãÓÇÑ ÊÍãíá íÍÊæí Úáì ÃŞá ãä 50 ÍÑİÇğ.'
			alert(sAlert);
			txtform.txtPathname.value = txtform.txtPathname.value.substring(0,49)
		}
		if((s1 != "") && parent.frames["eTOC"].sBasketString != "" ){
			txtform.dnow.disabled=false;
		}else{
			txtform.dnow.disabled=true;
		}
	}
	function checkKey1(){
	alert("here")
	}

</script>

</body>
</html>