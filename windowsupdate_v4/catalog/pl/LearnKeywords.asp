
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

	iTxt[0]="Arabski" + "@" + "ar|1256"
	//iTxt[1]="W��czona obs�uga j�zyka arabskiego" + "@" + "en_arabic|1252"
	iTxt[1]="Turecki" + "@" + "tr|1254"
	iTxt[2]="Chi�ski uproszczony " + "@" + "zhcn|936"
	iTxt[3]="Chi�ski tradycyjny " + "@" + "zhtw|950"
	iTxt[4]="Czeski" + "@" + "cs|1250"
	iTxt[5]="Du�ski" + "@" + "da|1252"
	iTxt[6]="Holenderski" + "@" + "nl|1252"
	iTxt[7]="Angielski" + "@" + "en|1252"
	iTxt[8]="Fi�ski" + "@" + "fi|1252"
	iTxt[9]="Francuski" + "@" + "fr|1252"
	iTxt[10]="Niemiecki" + "@" + "de|1252"
	iTxt[11]="Grecki" + "@" + "el|1253"
	//iTxt[12]="Grecki (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="Szwedzki" + "@" + "sv|1252"
	iTxt[13]="Hebrajski" + "@" + "he|1255"
	//iTxt[14]="W��czona obs�uga j�zyka hebrajskiego" + "@" + "en_hebrew|1252"
	iTxt[14]="Hiszpa�ski" + "@" + "es|1252"
	iTxt[15]="W�gierski" + "@" + "hu|1250"
	iTxt[16]="W�oski" + "@" + "it|1252"
	iTxt[17]="Japo�ski" + "@" + "ja|932"
	iTxt[18]="Japo�ski (NEC)" + "@" + "nec|932"
	iTxt[19]="Korea�ski" + "@" + "ko|949"
	iTxt[20]="Norweski" + "@" + "no|1252"
	iTxt[21]="Polski" + "@" + "pl|1250"
	iTxt[22]="Portugalski (Brazylia)" + "@" + "ptbr|1252"
	iTxt[23]="Portugalski (standardowy)" + "@" + "pt|1252"
	iTxt[24]="Rosyjski" + "@" + "ru|1251"
	//iTxt[25]="S�owacki" + "@" + "sk|1250"
	//iTxt[26]="S�owe�ski" + "@" + "sl|1250"
	
	
	//iTxt[29]="W��czona obs�uga j�zyka tajlandzkiego" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="pl"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=iso-8591" />
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
               Stosowanie s��w do precyzowania wyszukiwania w katalogu rozszerzenia Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Gdy umie�cisz okre�lone s�owa w kwerendzie, wynikiem wyszukiwania b�d� tylko te aktualizacje, kt�rych tytu�y i opisy zawieraj� co najmniej jedno wyst�pienie wpisanych s��w w tej samej kolejno�ci.
</p>

<P>Na przyk�ad, je�eli napiszesz <B>Windows Script Support</B>, Wyszukiwanie wy�wietli aktualizacje zawieraj�ce dok�adn� fraz�.
</p>
<P>Inne porady dotycz�ce stosowania s��w do precyzowania wyszukiwania:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Je�eli wyst�puj� problemy z uzyskaniem wynik�w kwerendy, spr�buj u�y� innych s��w o tym samym znaczeniu (na przyk�ad "Internet" zamiast "Web").</li>
		<li>Wyszukiwanie nie ignoruje interpunkcji zawartej w kwerendzie. </li>
		<li>Wyszukiwanie nie jest zale�ne od wielko�ci liter: te same wyniki zostan� wy�wietlone dla <B>Windows Script Support</B> i dla <B>windows script&nbsp; support</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Drukuj</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Zamknij</button>
</body>
</html>
