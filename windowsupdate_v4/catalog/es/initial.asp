
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

	iTxt[0]="�rabe" + "@" + "ar|1256"
	//iTxt[1]="Habilitado para �rabe" + "@" + "en_arabic|1252"
	iTxt[1]="Turco" + "@" + "tr|1254"
	iTxt[2]="Chino simplificado" + "@" + "zhcn|936"
	iTxt[3]="Chino tradicional" + "@" + "zhtw|950"
	iTxt[4]="Checo" + "@" + "cs|1250"
	iTxt[5]="Dan�s" + "@" + "da|1252"
	iTxt[6]="Neerland�s" + "@" + "nl|1252"
	iTxt[7]="Ingl�s" + "@" + "en|1252"
	iTxt[8]="Finland�s" + "@" + "fi|1252"
	iTxt[9]="Franc�s" + "@" + "fr|1252"
	iTxt[10]="Alem�n" + "@" + "de|1252"
	iTxt[11]="Griego" + "@" + "el|1253"
	//iTxt[12]="Griego IBM" + "@" + "el_ibm|869"
	iTxt[12]="Sueco" + "@" + "sv|1252"
	iTxt[13]="Hebreo" + "@" + "he|1255"
	//iTxt[14]="Habilitado para hebreo" + "@" + "en_hebrew|1252"
	iTxt[14]="Espa�ol" + "@" + "es|1252"
	iTxt[15]="H�ngaro" + "@" + "hu|1250"
	iTxt[16]="Italiano" + "@" + "it|1252"
	iTxt[17]="Japon�s" + "@" + "ja|932"
	iTxt[18]="Japon�s NEC" + "@" + "nec|932"
	iTxt[19]="Coreano" + "@" + "ko|949"
	iTxt[20]="Noruego" + "@" + "no|1252"
	iTxt[21]="Polaco" + "@" + "pl|1250"
	iTxt[22]="Portugu�s (Brasil)" + "@" + "ptbr|1252"
	iTxt[23]="Portugu�s (est�ndar)" + "@" + "pt|1252"
	iTxt[24]="Ruso" + "@" + "ru|1251"
	//iTxt[25]="Eslovaco" + "@" + "sk|1250"
	//iTxt[26]="Esloveno" + "@" + "sl|1250"
	
	
	//iTxt[29]="Habilitado para tailand�s" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="es"
	
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
			<span class="title sys-font-heading3 sys-rhp-color-title">Cat�logo de Windows Update</span></td>
	</tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">Elija entre una variedad de actualizaciones que pueden distribuirse a trav�s de la red. Este sitio es la �nica ubicaci�n para las actualizaciones y mejoras de Windows, as� como para los controladores de dispositivos con el logotipo <a href="http://go.microsoft.com/fwlink/?LinkId=9577" target ="_blank" class="sys-link-normal">Dise�ado para Windows</a> <a class="sys-link-normal" href="/es/about.asp#driverupdates">
			controladores de dispositivos.</a></td>

	</tr>	
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="ossearch.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Icono de una flecha verde que indica una tarea o una acci�n." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Establecer el criterio de b�squeda para encontrar service packs, correcciones de seguridad y otras actualizaciones para los sistemas operativos Windows." WIDTH="30" HEIGHT="25"></a></td><td class="8pt" style="padding:0"><a class="sys-link-normal" href="ossearch.asp" title="Establecer el criterio de b�squeda para encontrar service packs, correcciones de seguridad y otras actualizaciones para los sistemas operativos Windows.">Buscar actualizaciones para los sistemas operativos Microsoft Windows</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="corp_drivers.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Icono de una flecha verde que indica una tarea o una acci�n." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Establecer el criterio de b�squeda para encontrar actualizaciones para los controladores de dispositivos de los equipos con Windows." WIDTH="30" HEIGHT="25">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="corp_drivers.asp" title="Establecer el criterio de b�squeda para encontrar actualizaciones para los controladores de dispositivos de los equipos con Windows.">Buscar actualizaciones de controladores para los dispositivos de hardware</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="javascript:goHistory();" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="Icono de una flecha azul que indica una tarea o una acci�n." src="/catalog/images/SplashBlue.bmp" border="0"  style="padding-bottom:-5px;" title="Realizar un seguimiento de los elementos descargados desde el Cat�logo de Windows Update.">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="javascript:goHistory();" title="Realizar un seguimiento de los elementos descargados desde el Cat�logo de Windows Update.">Ver el historial de descarga</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">Una vez descargadas las actualizaciones, podr� instalarlas en cualquier momento.</td>
	</tr>
	

</table>

</body>
</html>