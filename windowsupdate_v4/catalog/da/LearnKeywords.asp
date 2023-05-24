
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
	//iTxt[1]="Arabisk-aktiveret" + "@" + "en_arabic|1252"
	iTxt[1]="Tyrkisk" + "@" + "tr|1254"
	iTxt[2]="Kinesisk (forenklet)" + "@" + "zhcn|936"
	iTxt[3]="Kinesisk (traditionelt)" + "@" + "zhtw|950"
	iTxt[4]="Tjekkisk" + "@" + "cs|1250"
	iTxt[5]="Dansk" + "@" + "da|1252"
	iTxt[6]="Nederlandsk (Holland)" + "@" + "nl|1252"
	iTxt[7]="Engelsk" + "@" + "en|1252"
	iTxt[8]="Finsk" + "@" + "fi|1252"
	iTxt[9]="Fransk" + "@" + "fr|1252"
	iTxt[10]="Tysk" + "@" + "de|1252"
	iTxt[11]="Græsk" + "@" + "el|1253"
	//iTxt[12]="Græsk (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Svensk" + "@" + "sv|1252"
	iTxt[13]="Hebraisk" + "@" + "he|1255"
	//iTxt[14]="Hebraisk-aktiveret" + "@" + "en_hebrew|1252"
	iTxt[14]="Spansk" + "@" + "es|1252"
	iTxt[15]="Ungarsk" + "@" + "hu|1250"
	iTxt[16]="Italiensk" + "@" + "it|1252"
	iTxt[17]="Japansk" + "@" + "ja|932"
	iTxt[18]="Japansk NEC" + "@" + "nec|932"
	iTxt[19]="Koreansk" + "@" + "ko|949"
	iTxt[20]="Norsk" + "@" + "no|1252"
	iTxt[21]="Polsk" + "@" + "pl|1250"
	iTxt[22]="Portugisisk (Brasilien)" + "@" + "ptbr|1252"
	iTxt[23]="Portugisisk (standard)" + "@" + "pt|1252"
	iTxt[24]="Russisk" + "@" + "ru|1251"
	//iTxt[25]="Slovakisk" + "@" + "sk|1250"
	//iTxt[26]="Slovensk" + "@" + "sl|1250"
	
	
	//iTxt[29]="Thai-aktiveret" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="da"
	
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
               Brug af ord til at begrænse søgningen i Windows Update-kataloget
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Når du inkluderer bestemte ord i søgningen, viser søgningen resultater, der er begrænset til opdateringer, hvis titler og beskrivelser indeholder mindst én forekomst af de bestemte ord, du indtastede, i præcis den rækkefølge du indtastede dem.
</p>

<P>For eksempel: Hvis du skriver <B>Understøttelse af Windows Script</B>, viser søgningen opdateringer, der indeholder denne bestemte sætning i enten titlen eller beskrivelsen.
</p>
<P>Andre tip til brug af ord til at begrænse søgningen:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Hvis du har problemer med at få resultat af forespørgslen, kan du prøve at bruge andre ord, der betyder det samme (prøv f.eks. "Internet" i stedet for "web").</li>
		<li>Søgning ignorerer ikke tegnsætning i forespørgslen. </li>
		<li>Søgning skelner ikke mellem store og små bogstaver: <B>Understøttelse af Windows Script</B> giver samme resultat som <B>understøttelse af windows script&nbsp;</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Udskriv</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Luk</button>
</body>
</html>
