
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

	iTxt[0]="Arab" + "@" + "ar|1256"
	//iTxt[1]="Arab engedélyezve" + "@" + "en_arabic|1252"
	iTxt[1]="Török" + "@" + "tr|1254"
	iTxt[2]="Kínai (egyszerûsített)" + "@" + "zhcn|936"
	iTxt[3]="Kínai (hagyományos)" + "@" + "zhtw|950"
	iTxt[4]="Cseh" + "@" + "cs|1250"
	iTxt[5]="Dán" + "@" + "da|1252"
	iTxt[6]="Holland" + "@" + "nl|1252"
	iTxt[7]="Angol" + "@" + "en|1252"
	iTxt[8]="Finn" + "@" + "fi|1252"
	iTxt[9]="Francia" + "@" + "fr|1252"
	iTxt[10]="Német" + "@" + "de|1252"
	iTxt[11]="Görög" + "@" + "el|1253"
	//iTxt[12]="Görög (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Svéd" + "@" + "sv|1252"
	iTxt[13]="Héber" + "@" + "he|1255"
	//iTxt[14]="Héber engedélyezve" + "@" + "en_hebrew|1252"
	iTxt[14]="Spanyol" + "@" + "es|1252"
	iTxt[15]="Magyar" + "@" + "hu|1250"
	iTxt[16]="Olasz" + "@" + "it|1252"
	iTxt[17]="Japán" + "@" + "ja|932"
	iTxt[18]="Japán (NEC)" + "@" + "nec|932"
	iTxt[19]="Koreai" + "@" + "ko|949"
	iTxt[20]="Norvég" + "@" + "no|1252"
	iTxt[21]="Lengyel" + "@" + "pl|1250"
	iTxt[22]="Portugál (brazíliai)" + "@" + "ptbr|1252"
	iTxt[23]="Portugál (általános)" + "@" + "pt|1252"
	iTxt[24]="Orosz" + "@" + "ru|1251"
	//iTxt[25]="Szlovák" + "@" + "sk|1250"
	//iTxt[26]="Szlovén" + "@" + "sl|1250"
	
	
	//iTxt[29]="Thai engedélyezve" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="hu"
	
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
               A Windows Update katalógusban való keresés szûkítése szavak segítségével
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Ha a keresésben szavakat is megad, csak azok a frissítések jelennek meg a keresési eredmények között, amelyek címe és leírása legalább egyszer tartalmazza a megadott szavakat a megadott sorrendben.
</p>

<P>Ha például a <B>Parancsfájlok támogatása</B> szavakat adja meg, a keresési eredményekben csak azok a frissítések jelennek meg, amelyek címében vagy leírásában pontosan ez a kifejezés szerepel.
</p>
<P>További tippek a keresés szûkítéséhez használt szavakkal kapcsolatban:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Ha nem sikerül megtalálni a kívánt eredményt, próbáljon szinonimákat használni (a "web" helyett például írja be az "internet" szót).</li>
		<li>A keresés során a program a megadott írásjeleket is figyelembe veszi. </li>
		<li>A keresés nem különbözteti meg a kis- és nagybetûket: a <B>Parancsfájlok támogatása</B> és a <B>parancsfájlok támogatása</B> kifejezések megadásával azonos eredmények jelennek meg.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Nyomtatás</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Bezárás</button>
</body>
</html>
