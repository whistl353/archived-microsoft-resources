
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

	iTxt[0]="Arab" + "@" + "ar|1256"
	//iTxt[1]="Arab enged�lyezve" + "@" + "en_arabic|1252"
	iTxt[1]="T�r�k" + "@" + "tr|1254"
	iTxt[2]="K�nai (egyszer�s�tett)" + "@" + "zhcn|936"
	iTxt[3]="K�nai (hagyom�nyos)" + "@" + "zhtw|950"
	iTxt[4]="Cseh" + "@" + "cs|1250"
	iTxt[5]="D�n" + "@" + "da|1252"
	iTxt[6]="Holland" + "@" + "nl|1252"
	iTxt[7]="Angol" + "@" + "en|1252"
	iTxt[8]="Finn" + "@" + "fi|1252"
	iTxt[9]="Francia" + "@" + "fr|1252"
	iTxt[10]="N�met" + "@" + "de|1252"
	iTxt[11]="G�r�g" + "@" + "el|1253"
	//iTxt[12]="G�r�g (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Sv�d" + "@" + "sv|1252"
	iTxt[13]="H�ber" + "@" + "he|1255"
	//iTxt[14]="H�ber enged�lyezve" + "@" + "en_hebrew|1252"
	iTxt[14]="Spanyol" + "@" + "es|1252"
	iTxt[15]="Magyar" + "@" + "hu|1250"
	iTxt[16]="Olasz" + "@" + "it|1252"
	iTxt[17]="Jap�n" + "@" + "ja|932"
	iTxt[18]="Jap�n (NEC)" + "@" + "nec|932"
	iTxt[19]="Koreai" + "@" + "ko|949"
	iTxt[20]="Norv�g" + "@" + "no|1252"
	iTxt[21]="Lengyel" + "@" + "pl|1250"
	iTxt[22]="Portug�l (braz�liai)" + "@" + "ptbr|1252"
	iTxt[23]="Portug�l (�ltal�nos)" + "@" + "pt|1252"
	iTxt[24]="Orosz" + "@" + "ru|1251"
	//iTxt[25]="Szlov�k" + "@" + "sk|1250"
	//iTxt[26]="Szlov�n" + "@" + "sl|1250"
	
	
	//iTxt[29]="Thai enged�lyezve" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="hu"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1250" />
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
			<span class="title sys-font-heading3 sys-rhp-color-title">Hardver-illeszt�programok</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			V�lasszon ki egy hardverkateg�ri�t, majd keresse meg a leg�jabb friss�t�seket az eszk�z�k hib�tlan m�k�d�s�nek biztos�t�sa �rdek�ben.</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=hu&amp;lcat=Vide&#243;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Vide�</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Videok�rty�k, alaplapi video-lapkak�szletek, DVD-dek�der, k�pr�gz�t� k�rty�k, TV-tunerek...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=hu&amp;lcat=Hang">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Hang</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 Hangsz�r�k, mikrofonok, hordozhat� m�dialej�tsz�k, hangk�rty�k, szintetiz�torok...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=hu&amp;lcat=Nyomtat&#243;k">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Nyomtat�k</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Fot�nyomtat�, l�zer, pontm�trix, egysz�n� tinta, kieg�sz�t�k...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=hu&amp;lcat=Modemek">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Modemek</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				K�ls�, modemk�rtya, ISDN, DSL, k�bel...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=hu&amp;lcat=F&#233;nyk&#233;pez&#337;g&#233;pek &#233;s kamer&#225;k">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>F�nyk�pez�g�pek �s kamer�k</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Digit�lis f�nyk�pez�g�p, DV-kamera (digit�lis videokamera), video-/webkamera...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=hu&amp;lcat=K&#233;polvas&#243;k">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>K�polvas�k</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				S�k�gyas, g�rget�adagol�s, k�zi...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=hu&amp;lcat=K&#233;perny&#337;k">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>K�perny�k</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CRT, s�k LCD-k�perny�, LED, plazma, projektorok...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=hu&amp;lcat=H&#225;l&#243;zat">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>H�l�zat</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				LAN, vezet�k n�lk�li, ISDN, HPNA, IrDA, WAN, ATM (aszinkron �tviteli m�d)...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=hu&amp;lcat=Bemeneti eszk&#246;z&#246;k">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Bemeneti eszk�z�k</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Eg�r, billenty�zet, j�t�kvez�rl�k, hanyatteg�r, mikrofonok, �rint�padok, f�nyceruz�k...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=hu&amp;lcat=T&#225;rol&#225;s">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>T�rol�s</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 T�rol�eszk�z-illeszt�k �s -vez�rl�k, CD- �s DVD-meghajt�k, merevlemezek, cser�lhet� adathordoz�k meghajt�i, RAID, szalagos meghajt�k...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=hu&amp;lcat=Szem&#233;lyi sz&#225;m&#237;t&#243;g&#233;pek">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Szem�lyi sz�m�t�g�pek</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 Asztali �s mobil rendszerek, k�zi sz�m�t�g�pek �s PDA-k </td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=hu&amp;lcat=Kiszolg&#225;l&#243;k &#233;s f&#252;rtmegold&#225;sok">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Kiszolg�l�k �s f�rtmegold�sok</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				F�rtmegold�s, datacenter server, GEOCluster megold�s, kiszolg�l�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=hu&amp;lcat=M&#225;s hardver">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>M�s hardver</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Processzorok, alaplap, USB hub, UPS (sz�netmentes �ramforr�s), Cardbus/PCMCIA, 1394 vez�rl�k...</td>
		</tr>
	
</table>
<br/>

</body>
</html>