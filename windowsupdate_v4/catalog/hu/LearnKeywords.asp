
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
	//iTxt[1]="Arab enged�lyezve" + "@" + "en_arabic|1252"
	iTxt[1]="T�r�k" + "@" + "tr|1254"
	iTxt[2]="K�nai (egyszer�s�tett)" + "@" + "zhcn|936"
	iTxt[3]="K�nai (hagyom�nyos)" + "@" + "zhtw|950"
	iTxt[4]="Cseh" + "@" + "cs|1250"
	iTxt[5]="D�n" + "@" + "da|1252"
	iTxt[6]="Holland" + "@" + "nl|1252"
	iTxt[7]="Angol" + "@" + "en|1252"
	iTxt[8]="Finn" + "@" + "fi|1252"
	iTxt[9]="Francia" + "@" + "fr|1252"
	iTxt[10]="N�met" + "@" + "de|1252"
	iTxt[11]="G�r�g" + "@" + "el|1253"
	//iTxt[12]="G�r�g (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Sv�d" + "@" + "sv|1252"
	iTxt[13]="H�ber" + "@" + "he|1255"
	//iTxt[14]="H�ber enged�lyezve" + "@" + "en_hebrew|1252"
	iTxt[14]="Spanyol" + "@" + "es|1252"
	iTxt[15]="Magyar" + "@" + "hu|1250"
	iTxt[16]="Olasz" + "@" + "it|1252"
	iTxt[17]="Jap�n" + "@" + "ja|932"
	iTxt[18]="Jap�n (NEC)" + "@" + "nec|932"
	iTxt[19]="Koreai" + "@" + "ko|949"
	iTxt[20]="Norv�g" + "@" + "no|1252"
	iTxt[21]="Lengyel" + "@" + "pl|1250"
	iTxt[22]="Portug�l (braz�liai)" + "@" + "ptbr|1252"
	iTxt[23]="Portug�l (�ltal�nos)" + "@" + "pt|1252"
	iTxt[24]="Orosz" + "@" + "ru|1251"
	//iTxt[25]="Szlov�k" + "@" + "sk|1250"
	//iTxt[26]="Szlov�n" + "@" + "sl|1250"
	
	
	//iTxt[29]="Thai enged�lyezve" + "@" + "en_thai|1252"
	

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
               A Windows Update katal�gusban val� keres�s sz�k�t�se szavak seg�ts�g�vel
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Ha a keres�sben szavakat is megad, csak azok a friss�t�sek jelennek meg a keres�si eredm�nyek k�z�tt, amelyek c�me �s le�r�sa legal�bb egyszer tartalmazza a megadott szavakat a megadott sorrendben.
</p>

<P>Ha p�ld�ul a <B>Parancsf�jlok t�mogat�sa</B> szavakat adja meg, a keres�si eredm�nyekben csak azok a friss�t�sek jelennek meg, amelyek c�m�ben vagy le�r�s�ban pontosan ez a kifejez�s szerepel.
</p>
<P>Tov�bbi tippek a keres�s sz�k�t�s�hez haszn�lt szavakkal kapcsolatban:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Ha nem siker�l megtal�lni a k�v�nt eredm�nyt, pr�b�ljon szinonim�kat haszn�lni (a "web" helyett p�ld�ul �rja be az "internet" sz�t).</li>
		<li>A keres�s sor�n a program a megadott �r�sjeleket is figyelembe veszi. </li>
		<li>A keres�s nem k�l�nb�zteti meg a kis- �s nagybet�ket: a <B>Parancsf�jlok t�mogat�sa</B> �s a <B>parancsf�jlok t�mogat�sa</B> kifejez�sek megad�s�val azonos eredm�nyek jelennek meg.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Nyomtat�s</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Bez�r�s</button>
</body>
</html>
