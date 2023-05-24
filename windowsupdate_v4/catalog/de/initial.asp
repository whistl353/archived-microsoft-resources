
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

	iTxt[0]="Arabisch" + "@" + "ar|1256"
	//iTxt[1]="Arabisch aktiviert" + "@" + "en_arabic|1252"
	iTxt[1]="Türkisch" + "@" + "tr|1254"
	iTxt[2]="Chinesisch, vereinfacht" + "@" + "zhcn|936"
	iTxt[3]="Chinesisch, traditionell" + "@" + "zhtw|950"
	iTxt[4]="Tschechisch" + "@" + "cs|1250"
	iTxt[5]="Dänisch" + "@" + "da|1252"
	iTxt[6]="Niederländisch" + "@" + "nl|1252"
	iTxt[7]="Englisch" + "@" + "en|1252"
	iTxt[8]="Finnisch" + "@" + "fi|1252"
	iTxt[9]="Französisch" + "@" + "fr|1252"
	iTxt[10]="Deutsch" + "@" + "de|1252"
	iTxt[11]="Griechisch" + "@" + "el|1253"
	//iTxt[12]="Griechisch-IBM" + "@" + "el_ibm|869"
	iTxt[12]="Schwedisch" + "@" + "sv|1252"
	iTxt[13]="Hebräisch" + "@" + "he|1255"
	//iTxt[14]="Aktiviert für Hebräisch" + "@" + "en_hebrew|1252"
	iTxt[14]="Spanisch" + "@" + "es|1252"
	iTxt[15]="Ungarisch" + "@" + "hu|1250"
	iTxt[16]="Italienisch" + "@" + "it|1252"
	iTxt[17]="Japanisch" + "@" + "ja|932"
	iTxt[18]="Japanisch-NEC" + "@" + "nec|932"
	iTxt[19]="Koreanisch" + "@" + "ko|949"
	iTxt[20]="Norwegisch" + "@" + "no|1252"
	iTxt[21]="Polnisch" + "@" + "pl|1250"
	iTxt[22]="Portugiesisch (Brasilien)" + "@" + "ptbr|1252"
	iTxt[23]="Portugiesisch (Standard)" + "@" + "pt|1252"
	iTxt[24]="Russisch" + "@" + "ru|1251"
	//iTxt[25]="Slowakisch" + "@" + "sk|1250"
	//iTxt[26]="Slowenisch" + "@" + "sl|1250"
	
	
	//iTxt[29]="Aktiviert für Thailändisch" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="de"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'>
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="/catalog/shared/css/content.css">
<link rel="stylesheet" type="text/css" href="hcp://system/css/shared.css" />

<style>
A
{
    PADDING-RIGHT: 0;
    PADDING-LEFT:0;
    PADDING-BOTTOM: 0;
    PADDING-TOP: 0;
}
</style>
<title></title>
<script language="JScript" type="text/javascript" src="/catalog/shared/js/content.js"></script>
<script language="jscript">
	function selleftbasket(){
		var basketarray=parent.frames["eTOC"].sBasketString.split(",");
		parent.g_iUpdatesLen=basketarray.length - 1
		parent.fnUpdateTOCBasket()
	}
	
	function goHistory() {
		parent.fnDisplayHistory(true);
		return false;
	}
	function selectlink(){
		var vLinks =parent.frames["eTOC"].document.links;
		var iLinksLen = vLinks.length;
		for(i = 0; i < iLinksLen; i++)
			vLinks[i].className = "";
		parent.frames["eTOC"].eCorporate.className="selected";
	}

</script>
</head>
<body onload="if(parent.g_bControlInitialized){parent.eTOC.fnSyncTOC(window.location.href, -1, -1);}" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="25"><img src="/catalog/images/ts.gif" width="35" height="1"></td>
		<td width="100%"></td>
	</tr>
	<tr>
		<td colspan="2">
			<span class="title sys-font-heading3 sys-rhp-color-title">Willkommen</span></td>
	</tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">Sie können eine Vielzahl von Updates über Ihr Netzwerk verteilen. Diese Site ist die zentrale Site für Windows-Updates und -erweiterungen sowie Gerätetreiber mit dem <a href="http://go.microsoft.com/fwlink/?LinkId=9577" target ="_blank" class="sys-link-normal">Designed for Windows</a><a class="sys-link-normal" href="/de/about.asp#driverupdates">
			-Logo.</a></td>

	</tr>	
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="ossearch.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Symbol Grüner Pfeil - Aufgabe oder Aktion." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Legen Sie Suchkriterien für die Suche nach Service Packs, Sicherheitspatches und andere Updates für das Windows-Betriebssystem fest." WIDTH="30" HEIGHT="25"></a></td><td class="8pt" style="padding:0"><a class="sys-link-normal" href="ossearch.asp" title="Legen Sie Suchkriterien für die Suche nach Service Packs, Sicherheitspatches und andere Updates für das Windows-Betriebssystem fest.">Updates für Microsoft-Betriebssystemen suchen</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="corp_drivers.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Symbol Grüner Pfeil - Aufgabe oder Aktion." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Suchen Sie in den Kriterien nach Updates für die Gerätetreiber auf Ihren Windows-basierten Computern." WIDTH="30" HEIGHT="25">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="corp_drivers.asp" title="Suchen Sie in den Kriterien nach Updates für die Gerätetreiber auf Ihren Windows-basierten Computern.">Treiberupdates für Gerätetreiber suchen</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="javascript:goHistory();" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Symbol Blauer Pfeil - Aufgabe oder Aktion." src="/catalog/images/SplashBlue.bmp" border="0"  style="padding-bottom:-5px;" title="Überprüfen Sie, welche Updates Sie vom Windows Update-Katalog übertragen haben.">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="javascript:goHistory();" title="Überprüfen Sie, welche Updates Sie vom Windows Update-Katalog übertragen haben.">Downloadverlauf anzeigen</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">Nachdem Updates übertragen wurden, können sie zu jederzeit installiert werden.</td>
	</tr>
	

</table>

</body>
</html>