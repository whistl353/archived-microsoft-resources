
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

	iTxt[0]="�������" + "@" + "ar|1256"
	//iTxt[1]="������������ ��������" + "@" + "en_arabic|1252"
	iTxt[1]="��������" + "@" + "tr|1254"
	iTxt[2]="������������ �������� " + "@" + "zhcn|936"
	iTxt[3]="����������� �������� " + "@" + "zhtw|950"
	iTxt[4]="�������" + "@" + "cs|1250"
	iTxt[5]="������" + "@" + "da|1252"
	iTxt[6]="���������" + "@" + "nl|1252"
	iTxt[7]="�������" + "@" + "en|1252"
	iTxt[8]="����������" + "@" + "fi|1252"
	iTxt[9]="�������" + "@" + "fr|1252"
	iTxt[10]="���������" + "@" + "de|1252"
	iTxt[11]="��������" + "@" + "el|1253"
	//iTxt[12]="�������� IBM" + "@" + "el_ibm|869"
	iTxt[12]="��������" + "@" + "sv|1252"
	iTxt[13]="�������" + "@" + "he|1255"
	//iTxt[14]="������������ ��������" + "@" + "en_hebrew|1252"
	iTxt[14]="��������" + "@" + "es|1252"
	iTxt[15]="��������" + "@" + "hu|1250"
	iTxt[16]="�������" + "@" + "it|1252"
	iTxt[17]="��������" + "@" + "ja|932"
	iTxt[18]="�������� NEC" + "@" + "nec|932"
	iTxt[19]="���������" + "@" + "ko|949"
	iTxt[20]="���������" + "@" + "no|1252"
	iTxt[21]="��������" + "@" + "pl|1250"
	iTxt[22]="����������� (���������)" + "@" + "ptbr|1252"
	iTxt[23]="����������� (�������)" + "@" + "pt|1252"
	iTxt[24]="������" + "@" + "ru|1251"
	//iTxt[25]="���������" + "@" + "sk|1250"
	//iTxt[26]="���������" + "@" + "sl|1250"
	
	
	//iTxt[29]="������������ �����������" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="el"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1253" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'>
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="/catalog/shared/css/content.css">
<link rel="stylesheet" type="text/css" href="hcp://system/css/shared.css" />

<style>
A
{
    PADDING-RIGHT: 0;
    PADDING-LEFT:0;
    PADDING-BOTTOM: 0;
    PADDING-TOP: 0;
}
</style>
<title></title>
<script language="JScript" type="text/javascript" src="/catalog/shared/js/content.js"></script>
<script language="jscript">
	function selleftbasket(){
		var basketarray=parent.frames["eTOC"].sBasketString.split(",");
		parent.g_iUpdatesLen=basketarray.length - 1
		parent.fnUpdateTOCBasket()
	}
	
	function goHistory() {
		parent.fnDisplayHistory(true);
		return false;
	}
	function selectlink(){
		var vLinks =parent.frames["eTOC"].document.links;
		var iLinksLen = vLinks.length;
		for(i = 0; i < iLinksLen; i++)
			vLinks[i].className = "";
		parent.frames["eTOC"].eCorporate.className="selected";
	}

</script>
</head>
<body onload="if(parent.g_bControlInitialized){parent.eTOC.fnSyncTOC(window.location.href, -1, -1);}" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="25"><img src="/catalog/images/ts.gif" width="35" height="1"></td>
		<td width="100%"></td>
	</tr>
	<tr>
		<td colspan="2">
			<span class="title sys-font-heading3 sys-rhp-color-title">����� ������� ���� �������� ��� Windows Update</span></td>
	</tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">�������� ��� ��� ����� ��� ������������ ��������, ��� ������ �������� �� ���������� ���� ��� ������� ���. ���� � ��������� ����� �� ������ ������ ���� �������� �� ������ ������������ �������� ��� ���������� ��������� ��� Windows, ����� ��� ����������� �������� �������� �� �� �������� <a href="http://go.microsoft.com/fwlink/?LinkId=9577" target ="_blank" class="sys-link-normal">Designed for Windows</a>.<a class="sys-link-normal" href="/el/about.asp#driverupdates">
			����������� �������� ��������.</a></td>

	</tr>	
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="ossearch.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="��������� �������� ������ ��� ������� ��� ������� � ��������." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="������ �������� ���������� ��� ��� ������ service pack, ����������� ������ ��������� ��� ����� ������������ �������� ��� �� ����������� ��������� ��� Windows." WIDTH="30" HEIGHT="25"></a></td><td class="8pt" style="padding:0"><a class="sys-link-normal" href="ossearch.asp" title="������ �������� ���������� ��� ��� ������ service pack, ����������� ������ ��������� ��� ����� ������������ �������� ��� �� ����������� ��������� ��� Windows.">������ ������������ �������� ��� �� ����������� ��������� ��� Microsoft Windows</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="corp_drivers.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="��������� �������� ������ ��� ������� ��� ������� � ��������." src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="������ �������� ���������� ��� ��� ������ ������������ �������� ��� �� ����������� �������� �������� ����� ����������� ��� ��� ����������� �� Windows." WIDTH="30" HEIGHT="25">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="corp_drivers.asp" title="������ �������� ���������� ��� ��� ������ ������������ �������� ��� �� ����������� �������� �������� ����� ����������� ��� ��� ����������� �� Windows.">������ ������������ �������� ��� �������� ������</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="javascript:goHistory();" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="��������� ���� ������ ��� ������� ��� ������� � ��������." src="/catalog/images/SplashBlue.bmp" border="0"  style="padding-bottom:-5px;" title="�������������� �� ��������, ��� ������ ����� ����� ���� ��� ��� �������� ��� Windows Update.">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="javascript:goHistory();" title="�������������� �� ��������, ��� ������ ����� ����� ���� ��� ��� �������� ��� Windows Update.">������� ��������� �����</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">���� ��� �� ���� ��� ������������ ��������, �������� �� ��� ������������� ����������� ������.</td>
	</tr>
	

</table>

</body>
</html>