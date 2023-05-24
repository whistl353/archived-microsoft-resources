
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

	iTxt[0]="Arabština" + "@" + "ar|1256"
	//iTxt[1]="Umožòující použití arabštiny" + "@" + "en_arabic|1252"
	iTxt[1]="Tureètina" + "@" + "tr|1254"
	iTxt[2]="Zjednodušená èínština " + "@" + "zhcn|936"
	iTxt[3]="Tradièní èínština " + "@" + "zhtw|950"
	iTxt[4]="Èeština" + "@" + "cs|1250"
	iTxt[5]="Dánština" + "@" + "da|1252"
	iTxt[6]="Holandština" + "@" + "nl|1252"
	iTxt[7]="Angliètina" + "@" + "en|1252"
	iTxt[8]="Finština" + "@" + "fi|1252"
	iTxt[9]="Francouzština" + "@" + "fr|1252"
	iTxt[10]="Nìmèina" + "@" + "de|1252"
	iTxt[11]="Øeètina" + "@" + "el|1253"
	//iTxt[12]="Øeètina – IBM" + "@" + "el_ibm|869"
	iTxt[12]="Švédština" + "@" + "sv|1252"
	iTxt[13]="Hebrejština" + "@" + "he|1255"
	//iTxt[14]="Umožòující použití hebrejštiny" + "@" + "en_hebrew|1252"
	iTxt[14]="Španìlština" + "@" + "es|1252"
	iTxt[15]="Maïarština" + "@" + "hu|1250"
	iTxt[16]="Italština" + "@" + "it|1252"
	iTxt[17]="Japonština" + "@" + "ja|932"
	iTxt[18]="Japonština – NEC" + "@" + "nec|932"
	iTxt[19]="Korejština" + "@" + "ko|949"
	iTxt[20]="Norština" + "@" + "no|1252"
	iTxt[21]="Polština" + "@" + "pl|1250"
	iTxt[22]="Portugalština (Brazílie)" + "@" + "ptbr|1252"
	iTxt[23]="Portugalština (standardní)" + "@" + "pt|1252"
	iTxt[24]="Ruština" + "@" + "ru|1251"
	//iTxt[25]="Slovenština" + "@" + "sk|1250"
	//iTxt[26]="Slovinština" + "@" + "sl|1250"
	
	
	//iTxt[29]="Umožòující použití thajštiny" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="cs"
	
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
               Použití slov k omezení hledání v Katalogu systému Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
V pøípadì, že do dotazu zahrnete urèitá slova, zobrazí hledání výsledky omezené na aktualizace, jejichž názvy a popisy obsahují nejménì jeden pøesný výskyt zadaných slov v poøadí, v jakém jste je zadali.
</p>

<P>Pøíklad: Pokud zadáte text <B>Windows Script Support</B> (Podpora skriptù v systému Windows), zobrazí hledání aktualizace obsahující tuto pøesnou frázi v názvu nebo v popisu.
</p>
<P>Další tipy v souvislosti s použitím slov k omezení hledání:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Jestliže se pøi získávání výsledkù dotazu vyskytnou problémy, pokuste se použít jiná slova se stejným významem (napøíklad zkuste zadat slovo Internet namísto slova Web).</li>
		<li>Hledání neignoruje interpunkci zahrnutou do dotazu. </li>
		<li>Hledání nerozlišuje velká a malá písmena: Zadáte-li text <B>Windows Script Support</B> (Podpora skriptù v systému Windows), zobrazí se stejné výsledky jako v pøípadì zadání <B>windows script&nbsp; support</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Tisk</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Zavøít</button>
</body>
</html>
