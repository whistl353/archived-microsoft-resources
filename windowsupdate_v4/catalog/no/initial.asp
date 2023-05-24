
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

	iTxt[0]="Arabisk" + "@" + "ar|1256"
	//iTxt[1]="Arabisk aktivert" + "@" + "en_arabic|1252"
	iTxt[1]="Tyrkisk" + "@" + "tr|1254"
	iTxt[2]="Kinesisk (forenklet) " + "@" + "zhcn|936"
	iTxt[3]="Kinesisk (tradisjonell) " + "@" + "zhtw|950"
	iTxt[4]="Tsjekkisk" + "@" + "cs|1250"
	iTxt[5]="Dansk" + "@" + "da|1252"
	iTxt[6]="Nederlandsk" + "@" + "nl|1252"
	iTxt[7]="Engelsk" + "@" + "en|1252"
	iTxt[8]="Finsk" + "@" + "fi|1252"
	iTxt[9]="Fransk" + "@" + "fr|1252"
	iTxt[10]="Tysk" + "@" + "de|1252"
	iTxt[11]="Gresk" + "@" + "el|1253"
	//iTxt[12]="Gresk (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Svensk" + "@" + "sv|1252"
	iTxt[13]="Hebraisk" + "@" + "he|1255"
	//iTxt[14]="Hebraisk aktivert" + "@" + "en_hebrew|1252"
	iTxt[14]="Spansk" + "@" + "es|1252"
	iTxt[15]="Ungarsk" + "@" + "hu|1250"
	iTxt[16]="Italiensk" + "@" + "it|1252"
	iTxt[17]="Japansk" + "@" + "ja|932"
	iTxt[18]="Japansk (NEC)" + "@" + "nec|932"
	iTxt[19]="Koreansk" + "@" + "ko|949"
	iTxt[20]="Norsk" + "@" + "no|1252"
	iTxt[21]="Polsk" + "@" + "pl|1250"
	iTxt[22]="Portugisisk (Brasil)" + "@" + "ptbr|1252"
	iTxt[23]="Portugisisk (standard)" + "@" + "pt|1252"
	iTxt[24]="Russisk" + "@" + "ru|1251"
	//iTxt[25]="Slovakisk" + "@" + "sk|1250"
	//iTxt[26]="Slovensk" + "@" + "sl|1250"
	
	
	//iTxt[29]="Thai aktivert" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="no"
	
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
			<span class="title sys-font-heading3 sys-rhp-color-title">Velkommen til Windows Update-katalogen</span></td>
	</tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">Velg blant en rekke forskjellige oppdateringer som du kan distribuere over nettverket. Dette området har alt du trenger av oppdateringer og forbedringer for Windows, i tillegg til <a href="http://go.microsoft.com/fwlink/?LinkId=9577" target ="_blank" class="sys-link-normal">Designed for Windows</a>-logoen <a class="sys-link-normal" href="/no/about.asp#driverupdates">
			enhetsdrivere.</a></td>

	</tr>	
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="ossearch.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="En grønn pil indikerer en oppgave eller en handling." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Angi søkekriterier for å finne oppgraderingspakker, sikkerhetsopprettinger og andre oppdateringer for Windows-operativsystemer." WIDTH="30" HEIGHT="25"></a></td><td class="8pt" style="padding:0"><a class="sys-link-normal" href="ossearch.asp" title="Angi søkekriterier for å finne oppgraderingspakker, sikkerhetsopprettinger og andre oppdateringer for Windows-operativsystemer.">Søk etter oppdateringer for Microsoft Windows-operativsystemer</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="corp_drivers.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="En grønn pil indikerer en oppgave eller en handling." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Angi søkekriterier for å finne oppdateringer av enhetsdrivere på Windows-baserte datamaskiner." WIDTH="30" HEIGHT="25">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="corp_drivers.asp" title="Angi søkekriterier for å finne oppdateringer av enhetsdrivere på Windows-baserte datamaskiner.">Søk etter oppdateringer for maskinvareenheter</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="javascript:goHistory();" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="En blå pil indikerer en oppgave eller en handling." src="/catalog/images/SplashBlue.bmp" border="0"  style="padding-bottom:-5px;" title="Hold oversikt over hva du har lastet ned fra Windows Update-katalogen.">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="javascript:goHistory();" title="Hold oversikt over hva du har lastet ned fra Windows Update-katalogen.">Vis nedlastingslogg</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">Når du har lastet ned oppdateringene, kan du installere dem når som helst.</td>
	</tr>
	

</table>

</body>
</html>