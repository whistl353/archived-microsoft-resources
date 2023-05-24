
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
               Wörter zum Einschränken der Windows Update-Katalogsuche verwenden
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Wenn Sie bestimmte Wörter in Ihre Abfrage einschließen, wird die Anzeige der Suchresultate auf Updates beschränkt, deren Titel und Beschreibungen mindestens ein Vorkommen der exakten Wortfolge aufweisen.
</p>

<P>Beispiel: Wenn Sie <B>Windows Skriptunterstützung</B> eingeben, wird die Suche nur solche Updates anzeigen, die exakt diese Wortfolge entweder im Titel oder in der Beschreibung enthalten.
</p>
<P>Weitere Tipps zur Verwendung von Wörtern zur Einschränkung der Suche:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Wenn Sie Probleme haben, Ergebnisse aus Ihrer Abfrage zu erhalten, versuchen Sie es mit anderen Wörter mit derselben Bedeutung (z.B. "Internet" anstelle von "Web").</li>
		<li>Die Suche berücksichtigt auch Zeichensetzung, die Sie im Suchtext verwenden. </li>
		<li>Die Suche berücksichtigt nicht Groß-/Kleinschreibung: <B>Windows Skriptunterstützung</B> führt zum dem gleichen Ergebnis wie <B>windows skriptunterstützung</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Drucken</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Schließen</button>
</body>
</html>
