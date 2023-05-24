
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

	iTxt[0]="Arabiska" + "@" + "ar|1256"
	//iTxt[1]="Arabiska aktiverat" + "@" + "en_arabic|1252"
	iTxt[1]="Turkiska" + "@" + "tr|1254"
	iTxt[2]="Kinesiska (förenklad)" + "@" + "zhcn|936"
	iTxt[3]="Kinesiska (traditionell)" + "@" + "zhtw|950"
	iTxt[4]="Tjeckiska" + "@" + "cs|1250"
	iTxt[5]="Danska" + "@" + "da|1252"
	iTxt[6]="Nederländska" + "@" + "nl|1252"
	iTxt[7]="Engelska" + "@" + "en|1252"
	iTxt[8]="Finska" + "@" + "fi|1252"
	iTxt[9]="Franska" + "@" + "fr|1252"
	iTxt[10]="Tyska" + "@" + "de|1252"
	iTxt[11]="Grekiska" + "@" + "el|1253"
	//iTxt[12]="Grekiska IBM" + "@" + "el_ibm|869"
	iTxt[12]="Svenska" + "@" + "sv|1252"
	iTxt[13]="Hebreiska" + "@" + "he|1255"
	//iTxt[14]="Hebreiska aktiverat" + "@" + "en_hebrew|1252"
	iTxt[14]="Spanska" + "@" + "es|1252"
	iTxt[15]="Ungerska" + "@" + "hu|1250"
	iTxt[16]="Italienska" + "@" + "it|1252"
	iTxt[17]="Japanska" + "@" + "ja|932"
	iTxt[18]="Japanska NEC" + "@" + "nec|932"
	iTxt[19]="Koreanska" + "@" + "ko|949"
	iTxt[20]="Norska" + "@" + "no|1252"
	iTxt[21]="Polska" + "@" + "pl|1250"
	iTxt[22]="Portugisiska (brasiliansk)" + "@" + "ptbr|1252"
	iTxt[23]="Portugisiska (standard)" + "@" + "pt|1252"
	iTxt[24]="Ryska" + "@" + "ru|1251"
	//iTxt[25]="Slovakiska" + "@" + "sk|1250"
	//iTxt[26]="Slovenska" + "@" + "sl|1250"
	
	
	//iTxt[29]="Thailändska aktiverat" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="sv"
	
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
               Använda ord för att avgränsa din sökning i Windows Update-katalogen
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
När du använder särskilda ord i din fråga så begränsas resultaten till att visa uppdateringar vars titlar eller beskrivningar innehåller minst en förekomst av orden som du angav, i samma ordning som du angav dem.
</p>

<P>Om du t ex skriver <B>Skriptstöd i Windows</B> visas uppdateringar vars titel eller beskrivning innehåller den här frasen.
</p>
<P>Mer tips om hur du använder ord för att avgränsa sökningen:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Om sökningen inte ger något resultat kan du försöka med andra ord som betyder samma sak (t ex Internet i stället för webben).</li>
		<li>Sökfunktionen ignorerar inte skiljetecken som du anger i frågan. </li>
		<li>Sökfunktionen är inte skiftlägeskänslig: <B>Skriptstöd i Windows</B> ger samma resultat som <B>skriptstöd i windows</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Skriv ut</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Stäng</button>
</body>
</html>
