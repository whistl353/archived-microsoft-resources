
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

	iTxt[0]="Arap�a" + "@" + "ar|1256"
	//iTxt[1]="Arap�a etkin" + "@" + "en_arabic|1252"
	iTxt[1]="T�rk�e" + "@" + "tr|1254"
	iTxt[2]="Basitle�tirilmi� �ince " + "@" + "zhcn|936"
	iTxt[3]="Geleneksel �ince " + "@" + "zhtw|950"
	iTxt[4]="�ek�e" + "@" + "cs|1250"
	iTxt[5]="Danimarkaca" + "@" + "da|1252"
	iTxt[6]="Felemenk�e" + "@" + "nl|1252"
	iTxt[7]="�ngilizce" + "@" + "en|1252"
	iTxt[8]="Fince" + "@" + "fi|1252"
	iTxt[9]="Frans�zca" + "@" + "fr|1252"
	iTxt[10]="Almanca" + "@" + "de|1252"
	iTxt[11]="Yunanca" + "@" + "el|1253"
	//iTxt[12]="Yunanca IBM" + "@" + "el_ibm|869"
	iTxt[12]="�sve��e" + "@" + "sv|1252"
	iTxt[13]="�branice" + "@" + "he|1255"
	//iTxt[14]="�branice etkin" + "@" + "en_hebrew|1252"
	iTxt[14]="�spanyolca" + "@" + "es|1252"
	iTxt[15]="Macarca" + "@" + "hu|1250"
	iTxt[16]="�talyanca" + "@" + "it|1252"
	iTxt[17]="Japonca" + "@" + "ja|932"
	iTxt[18]="Japonca NEC" + "@" + "nec|932"
	iTxt[19]="Korece" + "@" + "ko|949"
	iTxt[20]="Norve��e" + "@" + "no|1252"
	iTxt[21]="Leh�e" + "@" + "pl|1250"
	iTxt[22]="Portekizce (Brezilya)" + "@" + "ptbr|1252"
	iTxt[23]="Portekizce (Standart)" + "@" + "pt|1252"
	iTxt[24]="Rus�a" + "@" + "ru|1251"
	//iTxt[25]="Slovak�a" + "@" + "sk|1250"
	//iTxt[26]="Slovence" + "@" + "sl|1250"
	
	
	//iTxt[29]="Tay dili etkin" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="tr"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1254" />
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
			<span class="title sys-font-heading3 sys-rhp-color-title">Windows Update Katalo�u'na Ho� Geldiniz</span></td>
	</tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">A��n�z �zerinden da��tabilece�iniz �e�itli �r�nlerden birini se�in. Bu site, Windows g�ncelle�tirmeleri ve geli�tirmeleri yan�nda <a href="http://go.microsoft.com/fwlink/?LinkId=9577" target ="_blank" class="sys-link-normal">Designed for Windows</a> Amblemi i�in de i�in tek u�rak yerinizdir <a class="sys-link-normal" href="/tr/about.asp#driverupdates">
			ayg�t s�r�c�lerinin yan�nda Windows g�ncelle�tirmeleri ve geli�tirmelerini bir arada bulabilece�iniz tek konumdur.</a></td>

	</tr>	
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="ossearch.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Ye�il ok bir g�revi veya eylemi belirtir." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Windows i�letim sistemleri i�in hizmet paketlerini, g�venlik ��z�mlerini ve di�er g�ncelle�tirmeleri bulmak i�in arama �l��tleri ayarlar�n." WIDTH="30" HEIGHT="25"></a></td><td class="8pt" style="padding:0"><a class="sys-link-normal" href="ossearch.asp" title="Windows i�letim sistemleri i�in hizmet paketlerini, g�venlik ��z�mlerini ve di�er g�ncelle�tirmeleri bulmak i�in arama �l��tleri ayarlar�n.">Microsoft Windows i�letim sistemleri g�ncelle�tirmelerini bul</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="corp_drivers.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Ye�il ok bir g�revi veya eylemi belirtir." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Windows tabanl� bilgisayarlar�n�zdaki ayg�t s�r�c�lerinin g�ncelle�tirmelerini bulmak i�in arama �l��t�n� ayarlay�n." WIDTH="30" HEIGHT="25">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="corp_drivers.asp" title="Windows tabanl� bilgisayarlar�n�zdaki ayg�t s�r�c�lerinin g�ncelle�tirmelerini bulmak i�in arama �l��t�n� ayarlay�n.">Donan�m ayg�tlar� i�in g�ncelle�tirmeleri bul</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="javascript:goHistory();" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Mavi ok bir g�revi veya eylemi belirtir." src="/catalog/images/SplashBlue.bmp" border="0"  style="padding-bottom:-5px;" title="Windows Update Katalo�u'ndan y�klediklerinizi izleyebilirsiniz.">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="javascript:goHistory();" title="Windows Update Katalo�u'ndan y�klediklerinizi izleyebilirsiniz.">Y�kleme ge�mi�ini g�r�nt�le</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">G�ncelle�tirmelerinizi kar��dan y�kledikten sonra istedi�iniz an y�kleyebilirsiniz.</td>
	</tr>
	

</table>

</body>
</html>