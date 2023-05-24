
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
	//iTxt[1]="Árabe ativado" + "@" + "en_arabic|1252"
	iTxt[1]="Turco" + "@" + "tr|1254"
	iTxt[2]="Chinês simplificado " + "@" + "zhcn|936"
	iTxt[3]="Chinês tradicional " + "@" + "zhtw|950"
	iTxt[4]="Tcheco" + "@" + "cs|1250"
	iTxt[5]="Dinamarquês" + "@" + "da|1252"
	iTxt[6]="Holandês" + "@" + "nl|1252"
	iTxt[7]="Inglês" + "@" + "en|1252"
	iTxt[8]="Finlandês" + "@" + "fi|1252"
	iTxt[9]="Francês" + "@" + "fr|1252"
	iTxt[10]="Alemão" + "@" + "de|1252"
	iTxt[11]="Grego" + "@" + "el|1253"
	//iTxt[12]="Grego (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Sueco" + "@" + "sv|1252"
	iTxt[13]="Hebraico" + "@" + "he|1255"
	//iTxt[14]="Hebraico ativado" + "@" + "en_hebrew|1252"
	iTxt[14]="Espanhol" + "@" + "es|1252"
	iTxt[15]="Húngaro" + "@" + "hu|1250"
	iTxt[16]="Italiano" + "@" + "it|1252"
	iTxt[17]="Japonês" + "@" + "ja|932"
	iTxt[18]="Japonês (NEC)" + "@" + "nec|932"
	iTxt[19]="Coreano" + "@" + "ko|949"
	iTxt[20]="Norueguês" + "@" + "no|1252"
	iTxt[21]="Polonês" + "@" + "pl|1250"
	iTxt[22]="Português (Brasil)" + "@" + "ptbr|1252"
	iTxt[23]="Português (Portugal)" + "@" + "pt|1252"
	iTxt[24]="Russo" + "@" + "ru|1251"
	//iTxt[25]="Eslovaco" + "@" + "sk|1250"
	//iTxt[26]="Esloveno" + "@" + "sl|1250"
	
	
	//iTxt[29]="Tailandês ativado" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="ptbr"
	
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
               Usando palavras para limitar a pesquisa do Catálogo do Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Quando você inclui determinadas palavras na sua consulta, o comando Pesquisar exibe resultados que estão limitados a atualizações cujos títulos e descrições contêm ao menos uma ocorrência das palavras exatas digitadas, na ordem exata em que você as digitou.
</p>

<P>Por exemplo: se você digitar <B>Suporte a script&nbsp; do Windows</B>, o comando Pesquisar exibirá atualizações que contêm esta frase exata no título ou na descrição.
</p>
<P>Outras dicas sobre como usar palavras para limitar sua pesquisa:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Se você estiver tendo problemas para obter os resultados para a sua consulta, tente usar sinônimos (por exemplo, tente "Internet", em vez de "Web").</li>
		<li>A pesquisa não ignora a pontuação incluída na consulta. </li>
		<li>A pesquisa não diferencia maiúsculas de minúsculas: <B>Suporte a script&nbsp; do Windows</B> exibirá os mesmos resultados que <B>suporte de script&nbsp; do windows</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Imprimir</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Fechar</button>
</body>
</html>
