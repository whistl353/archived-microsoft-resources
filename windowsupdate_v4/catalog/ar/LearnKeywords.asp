
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

	iTxt[0]="ÇáÚÑÈíÉ" + "@" + "ar|1256"
	//iTxt[1]="ÏÚã ááÛÉ ÇáÚÑÈíÉ" + "@" + "en_arabic|1252"
	iTxt[1]="ÊÑßí" + "@" + "tr|1254"
	iTxt[2]="Õíäí ãÈÓøØ " + "@" + "zhcn|936"
	iTxt[3]="Õíäí ÊŞáíÏí " + "@" + "zhtw|950"
	iTxt[4]="ÇáÊÔíßíÉ" + "@" + "cs|1250"
	iTxt[5]="ÇáÏÇäãÇÑßíÉ" + "@" + "da|1252"
	iTxt[6]="ÇáåæáäÏíÉ" + "@" + "nl|1252"
	iTxt[7]="ÇáÅäßáíÒíÉ" + "@" + "en|1252"
	iTxt[8]="ÇáİäáäÏíÉ" + "@" + "fi|1252"
	iTxt[9]="ÇáİÑäÓíÉ" + "@" + "fr|1252"
	iTxt[10]="ÇáÃáãÇäíÉ" + "@" + "de|1252"
	iTxt[11]="ÇáíæäÇäíÉ" + "@" + "el|1253"
	//iTxt[12]="IBM íæäÇí" + "@" + "el_ibm|869"
	iTxt[12]="ÓæíÏí" + "@" + "sv|1252"
	iTxt[13]="ÇáÚÈÑíÉ" + "@" + "he|1255"
	//iTxt[14]="ÏÚã ááÛÉ ÇáÚÈÑíÉ" + "@" + "en_hebrew|1252"
	iTxt[14]="ÇÓÈÇäí" + "@" + "es|1252"
	iTxt[15]="ÇáåäÛÇÑíÉ" + "@" + "hu|1250"
	iTxt[16]="ÇáÅíØÇáíÉ" + "@" + "it|1252"
	iTxt[17]="ÇáíÇÈÇäíÉ" + "@" + "ja|932"
	iTxt[18]="NEC íÇÈÇäí" + "@" + "nec|932"
	iTxt[19]="ÇáßæÑíÉ" + "@" + "ko|949"
	iTxt[20]="ÇáäÑæíÌíÉ" + "@" + "no|1252"
	iTxt[21]="ÇáÈæáæäíÉ" + "@" + "pl|1250"
	iTxt[22]="ÈÑÊÛÇáí (ÇáÈÑÇÒíá)" + "@" + "ptbr|1252"
	iTxt[23]="ÈÑÊÛÇáí (ŞíÇÓí)" + "@" + "pt|1252"
	iTxt[24]="ÑæÓí" + "@" + "ru|1251"
	//iTxt[25]="ÓáæİÇßí" + "@" + "sk|1250"
	//iTxt[26]="Óáæİíäí" + "@" + "sl|1250"
	
	
	//iTxt[29]="ÏÚã ááÛÉ ÇáÊÇíáÇäÏíÉ" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="ar"
	
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

</script><html dir='rtl'>
<head>
<title>Microsoft Windows Update</title>
<meta NAME="robots" CONTENT="noindex">
<meta http-equiv="Content-Type" content="text/html;charset=windows-1256" />
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
               ÇÓÊÎÏÇã ÇáßáãÇÊ áÊÍÏíÏ ãÌÇá ÇáÈÍË İí äÔÑÉ Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
ÚäÏãÇ ÊÖíİ ÈÚÖ ÇáßáãÇÊ ÇáãÚíäÉ Åáì ÇÓÊÚáÇãß, íŞæã ÇáÈÍË ÈÚÑÖ ÇáäÊÇÆÌ ááÊÍÏíËÇÊ ÇáÊí ÊÍÊæí Úáì åĞå ÇáßáãÉ ÊãÇãÇğ İí ãßÇä æÇÍÏ Ãæ ÃßËÑ ãä ÚäæÇä ÇáÊÍÏíË Ãæ æÕİå æİí ÇáÊÑÊíÈ ĞÇÊå ÇáĞí ÃÏÎáÊå.
</p>

<P>Úáì ÓÈíá ÇáãËÇá: ÅĞÇ ßÊÈÊ <B>ÏÚã ÈÑãÌÉWindows</B>¡ íŞæã ÇáÈÍË ÈÚÑÖ ÇáÊÍÏíËÇÊ ÇáÊí ÊÍÊæí Úáì åĞå ÇáÌãáÉ ÊãÇãÇğ ÅãÇ İí ÇáÚäæÇä Ãæ İí ÇáæÕİ.
</p>
<P>ÊáãíÍÇÊ ÃÎÑì İí ÇÓÊÎÏÇã ÇáßáãÇÊ áÊÍÏíÏ ÇáÈÍË:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>ÅĞÇ æÇÌåÊß ÇáãÕÇÚÈ İí ÇáÍÕæá Úáì ÇáäÊÇÆÌ áÇÓÊÚáÇãÇÊß¡ ÍÇæá ÇÓÊÎÏÇã ßáãÇÊ ÃÎÑì áåÇ ĞÇÊ ÇáãÚäì (Úáì ÓÈíá ÇáãËÇá, ÇÓÊÎÏã "ÅäÊÑäÊ" ÚæÖÇğ Úä "æíÈ").</li>
		<li>áÇ íŞæã ÇáÈÍË ÈÊÌÇåá ÇáÚáÇãÇÊ ÇáäŞØíÉ ÇáãÊÖãäÉ İí ÚãáíÉ ÇáÈÍË. </li>
		<li>ÚãáíÉ ÇáÈÍË áÇ ÊÚÊãÏ ÊÍÓÓ ÍÇáÉ ÇáÃÍÑİ: ÇáÈÍË Úä <B>Windows Script Support</B> ÓíÚæÏ ÈÇáäÊÇÆÌ ĞÇÊåÇ ÚäÏ ÇáÈÍË Úä <B>windows script&nbsp; support</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;left:150px;'   onclick="window.print();">ØÈÇÚÉ</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;left:20px;'  onclick="window.close();">ÅÛáÇŞ</button>
</body>
</html>
