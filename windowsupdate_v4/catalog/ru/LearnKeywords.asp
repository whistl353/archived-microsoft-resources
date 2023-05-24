
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

	iTxt[0]="Арабский" + "@" + "ar|1256"
	//iTxt[1]="С поддержкой арабского" + "@" + "en_arabic|1252"
	iTxt[1]="Турецкий" + "@" + "tr|1254"
	iTxt[2]="Китайский (упрощенное письмо) " + "@" + "zhcn|936"
	iTxt[3]="Китайский (традиционное письмо) " + "@" + "zhtw|950"
	iTxt[4]="Чешский" + "@" + "cs|1250"
	iTxt[5]="Датский" + "@" + "da|1252"
	iTxt[6]="Голландский" + "@" + "nl|1252"
	iTxt[7]="Английский" + "@" + "en|1252"
	iTxt[8]="Финский" + "@" + "fi|1252"
	iTxt[9]="Французский" + "@" + "fr|1252"
	iTxt[10]="Немецкий" + "@" + "de|1252"
	iTxt[11]="Греческий" + "@" + "el|1253"
	//iTxt[12]="Греческий (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Шведский" + "@" + "sv|1252"
	iTxt[13]="Иврит" + "@" + "he|1255"
	//iTxt[14]="С поддержкой иврита" + "@" + "en_hebrew|1252"
	iTxt[14]="Испанский" + "@" + "es|1252"
	iTxt[15]="Венгерский" + "@" + "hu|1250"
	iTxt[16]="Итальянский" + "@" + "it|1252"
	iTxt[17]="Японский" + "@" + "ja|932"
	iTxt[18]="Японский (NEC)" + "@" + "nec|932"
	iTxt[19]="Корейский" + "@" + "ko|949"
	iTxt[20]="Норвежский" + "@" + "no|1252"
	iTxt[21]="Польский" + "@" + "pl|1250"
	iTxt[22]="Португальский (Бразилия)" + "@" + "ptbr|1252"
	iTxt[23]="Португальский (стандартный)" + "@" + "pt|1252"
	iTxt[24]="Русский" + "@" + "ru|1251"
	//iTxt[25]="Словацкий" + "@" + "sk|1250"
	//iTxt[26]="Словенский" + "@" + "sl|1250"
	
	
	//iTxt[29]="С поддержкой тайского" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="ru"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1251" />
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
               Использование слов для ограничения поиска в каталоге Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
При включении в запрос определенных слов в результате поиска отображаются только те обновления, название или описание которых содержит хотя бы одно сочетание введенных слов, причем именно в том порядке, как они были введены.
</p>

<P>Например, если ввести слова <B>Поддержка сценариев Windows</B>, то в результате поиска будут отображены только те обновления, которые содержат эту фразу в названии или описании.
</p>
<P>Другие советы по использованию слов для ограничения поиска.
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Если при получении результатов запроса возникли трудности, попытайтесь использовать другие слова, имеющие то же значение (например, слово &quot;Интернет&quot; вместо слова &quot;Веб&quot;).</li>
		<li>При поиске учитываются знаки препинания, включенные в запрос. </li>
		<li>Поиск производится без учета регистра введенных знаков: при вводе слов <B>Поддержка Сценариев Windows</B> или <B>поддержка сценариев windows</B>  будут получены одинаковые результаты.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Печать</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Закрыть</button>
</body>
</html>
