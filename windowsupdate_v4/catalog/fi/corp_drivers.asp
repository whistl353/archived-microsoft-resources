
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

	iTxt[0]="arabia" + "@" + "ar|1256"
	//iTxt[1]="arabia otettu k�ytt��n" + "@" + "en_arabic|1252"
	iTxt[1]="turkki" + "@" + "tr|1254"
	iTxt[2]="yksinkertaistettu kiina " + "@" + "zhcn|936"
	iTxt[3]="perinteinen kiina " + "@" + "zhtw|950"
	iTxt[4]="tsekki" + "@" + "cs|1250"
	iTxt[5]="tanska" + "@" + "da|1252"
	iTxt[6]="hollanti" + "@" + "nl|1252"
	iTxt[7]="englanti" + "@" + "en|1252"
	iTxt[8]="suomi" + "@" + "fi|1252"
	iTxt[9]="ranska" + "@" + "fr|1252"
	iTxt[10]="saksa" + "@" + "de|1252"
	iTxt[11]="kreikka" + "@" + "el|1253"
	//iTxt[12]="kreikka (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="ruotsi" + "@" + "sv|1252"
	iTxt[13]="heprea" + "@" + "he|1255"
	//iTxt[14]="heprea otettu k�ytt��n" + "@" + "en_hebrew|1252"
	iTxt[14]="espanja" + "@" + "es|1252"
	iTxt[15]="unkari" + "@" + "hu|1250"
	iTxt[16]="italia" + "@" + "it|1252"
	iTxt[17]="japani" + "@" + "ja|932"
	iTxt[18]="japani (NEC)" + "@" + "nec|932"
	iTxt[19]="korea" + "@" + "ko|949"
	iTxt[20]="norja" + "@" + "no|1252"
	iTxt[21]="puola" + "@" + "pl|1250"
	iTxt[22]="portugali (Brasilia)" + "@" + "ptbr|1252"
	iTxt[23]="portugali (standardi)" + "@" + "pt|1252"
	iTxt[24]="ven�j�" + "@" + "ru|1251"
	//iTxt[25]="slovakki" + "@" + "sk|1250"
	//iTxt[26]="sloveeni" + "@" + "sl|1250"
	
	
	//iTxt[29]="thai otettu k�ytt��n" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="fi"
	
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

</script><html >
<head>
<title>Microsoft Windows Update</title>
<meta NAME="robots" CONTENT="noindex">
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
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
			<span class="title sys-font-heading3 sys-rhp-color-title">Laiteohjaimet</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			Varmista laitteidesi toimivuus valitsemalla laiteohjainluokka ja lataamalla uusimmat p�ivitykset.</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=fi&amp;lcat=Video">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Video</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				N�ytt�kortit, emolevyn n�ytt�piirilevysarjat, DVD-dekooderit, videosieppauskortit, TV-virittimet...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=fi&amp;lcat=&#196;&#228;ni">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>��ni</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 Kaiuttimet, mikrofonit, kannettavat mediasoittimet, ��nikortit, syntetisaattorit...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=fi&amp;lcat=Tulostimet">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Tulostimet</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Valokuva-, laser-, matriisi- ja mustesuihkutulostimet, tarvikkeet...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=fi&amp;lcat=Modeemit">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Modeemit</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Ulkoinen modeemi, korttimodeemi, ISDN, DSL, kaapelimodeemi...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=fi&amp;lcat=Kamerat">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Kamerat</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Digitaalikamerat, digitaalivideokamerat (DV-kamerat), Web-kamerat, videokamerat...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=fi&amp;lcat=Skannerit">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Skannerit</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Taso- ja rullasy�tt�iset skannerit, kannettavat...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=fi&amp;lcat=N&#228;yt&#246;t">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>N�yt�t</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CRT-, LCD-, LED- ja plasman�yt�t, projektorit...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=fi&amp;lcat=Verkot">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Verkot</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				LAN, langaton, ISDN, HPNA, IrDA, WAN, ATM (asynkroninen siirtotila)...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=fi&amp;lcat=Sy&#246;tt&#246;laitteet">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Sy�tt�laitteet</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Hiiri, n�pp�imist�, peliohjaimet, pallo-ohjaimet, mikrofonit, kosketuslevyt, valokyn�t...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=fi&amp;lcat=Tallennusv&#228;line">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Tallennusv�line</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 Tallennussovittimet ja -ohjaimet, CD-DVD-asemat, kiintolevyasemat, siirrett�v�t tietov�lineet, RAID, nauha-asemat...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=fi&amp;lcat=Tietokoneet">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Tietokoneet</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 P�yt�koneet, kannettavat, taskutietokoneet </td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=fi&amp;lcat=Palvelimet ja klusteriratkaisut">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Palvelimet ja klusteriratkaisut</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Klusteriratkaisut, Datacenter Server, GEOCluster-ratkaisu, palvelin...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=fi&amp;lcat=Muut laitteet">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Muut laitteet</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Keskusyksik�t, emolevyt, USB-keskittimet, UPS (keskeytym�t�n virransaanti), Cardbus/PCMCIA, 1394-ohjaimet...</td>
		</tr>
	
</table>
<br/>

</body>
</html>