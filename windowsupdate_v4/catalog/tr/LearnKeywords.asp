
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

	iTxt[0]="Arap�a" + "@" + "ar|1256"
	//iTxt[1]="Arap�a etkin" + "@" + "en_arabic|1252"
	iTxt[1]="T�rk�e" + "@" + "tr|1254"
	iTxt[2]="Basitle�tirilmi� �ince " + "@" + "zhcn|936"
	iTxt[3]="Geleneksel �ince " + "@" + "zhtw|950"
	iTxt[4]="�ek�e" + "@" + "cs|1250"
	iTxt[5]="Danimarkaca" + "@" + "da|1252"
	iTxt[6]="Felemenk�e" + "@" + "nl|1252"
	iTxt[7]="�ngilizce" + "@" + "en|1252"
	iTxt[8]="Fince" + "@" + "fi|1252"
	iTxt[9]="Frans�zca" + "@" + "fr|1252"
	iTxt[10]="Almanca" + "@" + "de|1252"
	iTxt[11]="Yunanca" + "@" + "el|1253"
	//iTxt[12]="Yunanca IBM" + "@" + "el_ibm|869"
	iTxt[12]="�sve��e" + "@" + "sv|1252"
	iTxt[13]="�branice" + "@" + "he|1255"
	//iTxt[14]="�branice etkin" + "@" + "en_hebrew|1252"
	iTxt[14]="�spanyolca" + "@" + "es|1252"
	iTxt[15]="Macarca" + "@" + "hu|1250"
	iTxt[16]="�talyanca" + "@" + "it|1252"
	iTxt[17]="Japonca" + "@" + "ja|932"
	iTxt[18]="Japonca NEC" + "@" + "nec|932"
	iTxt[19]="Korece" + "@" + "ko|949"
	iTxt[20]="Norve��e" + "@" + "no|1252"
	iTxt[21]="Leh�e" + "@" + "pl|1250"
	iTxt[22]="Portekizce (Brezilya)" + "@" + "ptbr|1252"
	iTxt[23]="Portekizce (Standart)" + "@" + "pt|1252"
	iTxt[24]="Rus�a" + "@" + "ru|1251"
	//iTxt[25]="Slovak�a" + "@" + "sk|1250"
	//iTxt[26]="Slovence" + "@" + "sl|1250"
	
	
	//iTxt[29]="Tay dili etkin" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="tr"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1254" />
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
               Windows Update Katalo�u aramas�n� s�n�rlamak i�in s�zc�klerin kullan�m�
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Sorgunuza belirli s�zc�kler ekledi�inizde, Arama, bu s�zc�kleri ba�l�klar�nda veya a��klamalar�nda en az bir kere i�eren g�ncelle�tirmelerle s�n�rlanan sonu�lar�, girdi�iniz s�raya g�re g�sterir.
</p>

<P>�rne�in: <B>Windows Script Support</B> yazd���n�zda, Arama, ba�l���nda veya a��klamas�nda bu t�mceyi i�eren g�ncelle�tirmeleri g�sterir.
</p>
<P>Araman�z� s�n�rlamak i�in s�zc�k kullan�m� hakk�nda di�er ipu�lar�:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Sorgunuz i�in sonu� almakta sorun ya��yorsan�z, ayn� anlama gelen di�er s�zc�kleri (�rne�in, "Web" yerine "Internet" ) kullanmay� deneyin.</li>
		<li>Arama, sorgunuzda yer alan noktalama i�aretlerini yoksaymaz. </li>
		<li>Arama B�Y�K/k���k harf duyarl� de�ildir: <B>Windows Script Support</B> ile <B>windows script&nbsp; support</B> ayn� sonu�lar� g�sterir.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Yazd�r</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Kapat</button>
</body>
</html>
