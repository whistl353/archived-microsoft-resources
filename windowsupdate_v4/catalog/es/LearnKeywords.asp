
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

	iTxt[0]="Árabe" + "@" + "ar|1256"
	//iTxt[1]="Habilitado para árabe" + "@" + "en_arabic|1252"
	iTxt[1]="Turco" + "@" + "tr|1254"
	iTxt[2]="Chino simplificado" + "@" + "zhcn|936"
	iTxt[3]="Chino tradicional" + "@" + "zhtw|950"
	iTxt[4]="Checo" + "@" + "cs|1250"
	iTxt[5]="Danés" + "@" + "da|1252"
	iTxt[6]="Neerlandés" + "@" + "nl|1252"
	iTxt[7]="Inglés" + "@" + "en|1252"
	iTxt[8]="Finlandés" + "@" + "fi|1252"
	iTxt[9]="Francés" + "@" + "fr|1252"
	iTxt[10]="Alemán" + "@" + "de|1252"
	iTxt[11]="Griego" + "@" + "el|1253"
	//iTxt[12]="Griego IBM" + "@" + "el_ibm|869"
	iTxt[12]="Sueco" + "@" + "sv|1252"
	iTxt[13]="Hebreo" + "@" + "he|1255"
	//iTxt[14]="Habilitado para hebreo" + "@" + "en_hebrew|1252"
	iTxt[14]="Español" + "@" + "es|1252"
	iTxt[15]="Húngaro" + "@" + "hu|1250"
	iTxt[16]="Italiano" + "@" + "it|1252"
	iTxt[17]="Japonés" + "@" + "ja|932"
	iTxt[18]="Japonés NEC" + "@" + "nec|932"
	iTxt[19]="Coreano" + "@" + "ko|949"
	iTxt[20]="Noruego" + "@" + "no|1252"
	iTxt[21]="Polaco" + "@" + "pl|1250"
	iTxt[22]="Portugués (Brasil)" + "@" + "ptbr|1252"
	iTxt[23]="Portugués (estándar)" + "@" + "pt|1252"
	iTxt[24]="Ruso" + "@" + "ru|1251"
	//iTxt[25]="Eslovaco" + "@" + "sk|1250"
	//iTxt[26]="Esloveno" + "@" + "sl|1250"
	
	
	//iTxt[29]="Habilitado para tailandés" + "@" + "en_thai|1252"
	

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
<script type="text/jscript">
function ESC_KeyDown()
{
              //if the user presses the ESC key, close the window.

                if( 27 == event.keyCode )
                {
		self.close();
	}
}

function window::onbeforeunload()
{
	window.dialogArguments.g_oLearnMoreDlg = null;
}
</script>
</head>
<body onkeydown="ESC_KeyDown();" scroll="no"  style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;padding:10px;"class="8pt sys-font-body sys-color-body">
<table id="eHeaderTbl" width="100%" style="margin-bottom:25px;" border=0>
<tr>
     <td id="eHeaderTD" width="80%">
          <span id="eHeaderSpn" class="Title sys-font-heading3 sys-rhp-color-title">
               Utilizar palabras para limitar la búsqueda en el Catálogo de Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Si incluye palabras concretas en la consulta, la búsqueda mostrará en el resultado aquellas actualizaciones que contengan en sus títulos o descripciones al menos una vez las palabras que escribió, en el mismo orden en que las escribió.
</p>

<P>Por ejemplo: si escribe <B>Compatibilidad con secuencias de comandos de Windows</B>, en el resultado de la búsqueda se incluirán todas aquellas actualizaciones que contengan esta misma frase en su título o en su descripción.
</p>
<P>Otras sugerencias para utilizar las palabras para limitar la búsqueda:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Si tiene problemas para obtener resultados en sus consultas, pruebe con otras palabras que signifiquen lo mismo (por ejemplo, utilice "Internet" en lugar de "Web").</li>
		<li>La búsqueda tiene en cuenta la puntuación incluida en la consulta. </li>
		<li>La búsqueda no distingue mayúsculas y minúsculas: el resultado obtenido con <B>Compatibilidad con secuencias de comandos de Windows</B> será el mismo que el obtenido con <B>compatibilidad con secuencias de comandos de Windows</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Imprimir</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Cerrar</button>
</body>
</html>
