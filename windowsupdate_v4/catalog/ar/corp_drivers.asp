
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
	parent.frames["eTOC"].eHardwareDrivers.className="selected";
}
</script>
</head>
<body onLoad="parent.eTOC.fnSyncTOC(window.location.href, -1, -1)" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<span class="title sys-font-heading3 sys-rhp-color-title">ÈÑÇãÌ ÊÔÛíá ÇáÃÌåÒÉ</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			ÇäÊŞ İÆÉ ÃÌåÒÉ æÇÈÍË Úä ÃÍÏË ÇáÊÍÏíËÇÊ ááÈŞÇÁ Úáì Úãá ÃÌåÒÊß ÈÔßá ÕÍíÍ.</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=ar&amp;lcat=&#1601;&#1610;&#1583;&#1610;&#1608;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>İíÏíæ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ÈØÇŞÇÊ İíÏíæ, ÔÑÇÆÍ İíÏíæ ááÃáæÇÍ ÇáÃÓÇÓíÉ¡ ÌåÇÒ İß ÑãæÒ DVDş, ÈØÇŞÇÊ ÇáÊŞÇØ İíÏíæ¡ ãæáİÇÊ ÊáİÒíæäíÉ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=ar&amp;lcat=&#1589;&#1608;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÕæÊ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ÓãøÇÚÇÊ¡ ãíßÑæİæä¡ ÃÌåÒÉ ŞÑÇÁÉ æÓÇÆØ ãÍãæáÉ¡ ÈØÇŞÇÊ ÕæÊ¡ ãÑßÈÇÊ ÕæÊ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=ar&amp;lcat=&#1591;&#1575;&#1576;&#1593;&#1575;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ØÇÈÚÇÊ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ØÇÈÚÉ ÕæÑ, áíÒÑ, dot-matrix, ÍÈÑ ÌÇãÏ, ãáÍŞÇÊ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1605;&#1608;&#1583;&#1605;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÃÌåÒÉ ãæÏã</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ÎÇÑÌí¡ ÈØÇŞÉ ãæÏã¡ ISDN¡ DSL¡ ßÈá...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=ar&amp;lcat=&#1603;&#1575;&#1605;&#1610;&#1585;&#1575;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ßÇãíÑÇÊ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ßÇãíÑÇ ÑŞãíÉ ááÕæÑ ÇáËÇÈÊÉ, ßÇãíÑÇ İíÏíæ ÑŞãíÉ, ßÇãíÑÇ İíÏíæ/æíÈ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=ar&amp;lcat=&#1605;&#1575;&#1587;&#1581;&#1575;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ãÇÓÍÇÊ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ãÓØøÍ, ÊÛĞíÉ ÊãÑíÑ¡ ãÍãæá íÏæíÇğ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1593;&#1585;&#1590;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÃÌåÒÉ ÚÑÖ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CRTş, áæÍÇÊ LCD ãÓØÍÉ, LEDş, ÈáÇÒãÇ, ÃÏÇÉ ÚÑÖ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=ar&amp;lcat=&#1588;&#1576;&#1603;&#1575;&#1578; &#1575;&#1578;&#1589;&#1575;&#1604;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÔÈßÇÊ ÇÊÕÇá</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ÔÈßÉ ÇÊÕÇá ãÍáíÉ (LAN), áÇÓáßí, ISDNş, HPNA, IrDAş, WANş, ATM (æÖÚ ÇáäŞá ÛíÑ ÇáãÊÒÇãä)...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1575;&#1604;&#1573;&#1583;&#1582;&#1575;&#1604;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÃÌåÒÉ ÇáÅÏÎÇá</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ãÇæÓ, áæÍÉ ãİÇÊíÍ, ÃÌåÒÉ ÊÍßã ááÊÓÇáí, ÌåÇÒ ÇáãÄÔÑ ÇáßÑæí¡ ãíßÑæİæä¡ áæÍÇÊ áãÓ¡ ÃŞáÇã ÖæÆíÉ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=ar&amp;lcat=&#1578;&#1582;&#1586;&#1610;&#1606;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÊÎÒíä</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ãÍæáÇÊ æÃÌåÒÉ ÊÍßã æÍÏÇÊ ÊÎÒíä¡ ãÍÑßÇÊ ÃŞÑÇÕ ãÖÛæØÉ æ DVDş, ãÍÑßÇÊ ÃŞÑÇÕ ËÇÈÊÉ¡ ãÍÑßÇÊ æÓÇÆØ ŞÇÈáÉ ááÅÒÇáÉ¡ RAIDş¡ ãÍÑßÇÊ ÃÔÑØÉ...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1603;&#1605;&#1576;&#1610;&#1608;&#1578;&#1585;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÃÌåÒÉ ßãÈíæÊÑ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ÃäÙãÉ ÓØÍ ÇáãßÊÈ, ÃäÙãÉ ãÍãæáÉ, ÃÌåÒÉ ßãÈíæÊÑ ãÍãæáÉ ÈÇáíÏ Ãæ PDA </td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=ar&amp;lcat=&#1581;&#1604;&#1608;&#1604; &#1575;&#1604;&#1605;&#1604;&#1602;&#1605;&#1575;&#1578; &#1608;&#1575;&#1604;&#1603;&#1578;&#1604;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Íáæá ÇáãáŞãÇÊ æÇáßÊá</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Íá ÇáßÊáÉ, ãáŞã datacenter, Íá GEOCluster, ãáŞã...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1571;&#1582;&#1585;&#1609;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ÃÌåÒÉ ÃÎÑì</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				ãÍÏÇÊ ãÚÇáÌÉ ãÑßÒíÉ, ÇááæÍ ÇáÃÓÇÓí, ãæÒøÚ USB, ãæÑÏ ØÇŞÉ ÛíÑ ŞÇÈá ááÅäŞØÇÚ (UPS)ş, Cardbus/PCMCIAş, ÃÌåÒÉ ÊÍßã 1394...</td>
		</tr>
	
</table>
<br/>

</body>
</html>