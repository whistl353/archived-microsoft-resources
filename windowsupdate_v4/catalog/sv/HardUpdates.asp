
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
	iTxt[2]="Kinesiska (f�renklad)" + "@" + "zhcn|936"
	iTxt[3]="Kinesiska (traditionell)" + "@" + "zhtw|950"
	iTxt[4]="Tjeckiska" + "@" + "cs|1250"
	iTxt[5]="Danska" + "@" + "da|1252"
	iTxt[6]="Nederl�ndska" + "@" + "nl|1252"
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
	
	
	//iTxt[29]="Thail�ndska aktiverat" + "@" + "en_thai|1252"
	

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



<style type="text/css">
<!--
	body { margin: 15px; }
	td { font-family: Verdana;font-size: 68.25%; }
	td a { font-weight:normal;text-decoration:none }
	hr {  color:gray;height:1px; }
	select { margin-top:5px; margin-bottom:5px;width:300px;}
	form { margin-top:0px; margin-bottom: 4px; }
	h4.clsHeader { color:gray;font-family:verdana; }
-->
</style>

<script language="javascript" src="/catalog/shared/js/content.js"></script>
<script language="javascript" defer="true">
<!--

function Docheck(){
	var selected=0
	if (frmMan.selOS.value == ""){
		alert("V�lj ett operativsystem");
		return false;
	}
	else{
		document.frmMan.submit();
		return true;
	}
}
function frmsubmitcheck(){

	return Docheck()
}
var g_oLearnMoreDlg;
function goLearnKeywords(){
	if (g_oLearnMoreDlg == null) {
		g_oLearnMoreDlg = window.showModelessDialog("LearnKeywords.asp",window,"help:no;status:no;resizable:no;dialogWidth:500px;dialogHeight:450px" );
	}
}


//-->
var fraLEFT = parent.frames["eTOC"];

	function SetItemCount()
	{
		eBasketStats.innerText = 0;

		if( "" != fraLEFT.sBasketString )
		{
			var aBasketItems = fraLEFT.sBasketString.split( "," );
			var iLen = aBasketItems.length - 1;
			eBasketStats.innerText = parseInt( iLen );

		}
	}
function gobasket()
	{
		basketform.os_sBasket.value=parent.frames["eTOC"].os_sBasket;
		basketform.driver_sBasket.value=parent.frames["eTOC"].driver_sBasket;
		basketform.speed.value=parent.g_iConnectionSpeed;
		basketform.submit();

	}
</script>
</head>
<body   style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">


<form name="basketform" id="basketform" action="downloadbasket.asp" method="post">
		<input type="hidden" name="os_sBasket" id="os_sBasket">
		<input type="hidden" name="driver_sBasket" id="driver_sBasket">
		<input type="hidden" name="speed" id="speed">
</form>
<form name="frmMan" id="frmMan" action="driverDetails.asp" onsubmit="return frmsubmitcheck()">
	<input type="hidden" name="hdnCat" value="" />
	<input type="hidden" name="lCat" value="" />
	<input type="hidden" name="clan" value="" />
	<input type="hidden" name="speed" id="speed">
	<input type="hidden" name="HSelLang" id="HSelLang" value=0>






	<table cellspacing="0" cellpadding="0" border="0" height="90%">
		<tbody>
			<tr>
				<td valign="top">
					<span class="title sys-font-heading3 sys-rhp-color-title">S�kresultat:</span></td>
			</tr>
			<tr>
				<td  class="8pt sys-font-body sys-color-body">S�kningen gav  <b><span id="results" name="results">0</span></b> &nbsp;tr�ffar &nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr><td valign="top">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td HEIGHT="10" colspan="2"><img src="/catalog/images/ts.gif" HEIGHT="10"></td>
					</tr>
					<tr>
						<td class="8pt sys-font-body sys-color-body" valign="top" width="50%"><a class="sys-link-normal" href="/" onclick="javascript:gobasket();return false;"><img alt="Gr�n pil som markerar en uppgift eller en �tg�rd." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" align="absmiddle" WIDTH="30" HEIGHT="25">G� till h�mtningskorgen</a></td>
						<td class="8pt sys-font-body sys-color-body" align="right">Totalt antal objekt i h�mtningskorgen:<span id="eViewBasket"> </span> <span id="eBasketStats"></span> </td>
					</tr>
					<tr >
						<td HEIGHT="6" colspan="2"><img src="/catalog/images/ts.gif" HEIGHT="10"></td>
					</tr>
				</table></td>
			<tr>
				<td valign="top" id="basketbar" class="resultsBasketBar sys-table-header-bgcolor1 sys-table-color-border sys-toppane-header-color">

					<b>&nbsp;Drivrutiner</b>
				</td>
			</tr>
			<tr>
				<td height="100%" valign="top">
					<center>
						<img src="/catalog/images/ts.gif" height="60" width="1"><br>
						<span class="10pt sys-font-heading4"><b>S�kningen gav 0 tr�ffar.</b></span>
					</center>
				</td>
			</tr>
		</tbody>
	</table>


</form>
</body>
</html>
<script language="javascript">
function window.onload(){
	var NoResults = 1
	frmMan.speed.value=parent.g_iConnectionSpeed;
	SetItemCount()
	if(NoResults == 0) {
		sortlanguage("selLang","frmMan")

	}
}
</script>