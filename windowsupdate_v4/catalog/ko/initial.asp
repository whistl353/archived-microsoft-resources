
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

	iTxt[0]="아랍어" + "@" + "ar|1256"
	//iTxt[1]="아랍어 사용" + "@" + "en_arabic|1252"
	iTxt[1]="터키어" + "@" + "tr|1254"
	iTxt[2]="중국어 간체" + "@" + "zhcn|936"
	iTxt[3]="중국어 번체" + "@" + "zhtw|950"
	iTxt[4]="체코어" + "@" + "cs|1250"
	iTxt[5]="덴마크어" + "@" + "da|1252"
	iTxt[6]="네덜란드어" + "@" + "nl|1252"
	iTxt[7]="영어" + "@" + "en|1252"
	iTxt[8]="핀란드어" + "@" + "fi|1252"
	iTxt[9]="프랑스어" + "@" + "fr|1252"
	iTxt[10]="독일어" + "@" + "de|1252"
	iTxt[11]="그리스어" + "@" + "el|1253"
	//iTxt[12]="그리스어 IBM" + "@" + "el_ibm|869"
	iTxt[12]="스웨덴어" + "@" + "sv|1252"
	iTxt[13]="히브리어" + "@" + "he|1255"
	//iTxt[14]="히브리어 사용" + "@" + "en_hebrew|1252"
	iTxt[14]="스페인어" + "@" + "es|1252"
	iTxt[15]="헝가리어" + "@" + "hu|1250"
	iTxt[16]="이탈리아어" + "@" + "it|1252"
	iTxt[17]="일본어" + "@" + "ja|932"
	iTxt[18]="일본어 NEC" + "@" + "nec|932"
	iTxt[19]="한국어" + "@" + "ko|949"
	iTxt[20]="노르웨이어" + "@" + "no|1252"
	iTxt[21]="폴란드어" + "@" + "pl|1250"
	iTxt[22]="포르투갈어(브라질)" + "@" + "ptbr|1252"
	iTxt[23]="포르투갈어(포르투갈)" + "@" + "pt|1252"
	iTxt[24]="러시아어" + "@" + "ru|1251"
	//iTxt[25]="슬로바키아어" + "@" + "sk|1250"
	//iTxt[26]="슬로베니아어" + "@" + "sl|1250"
	
	
	//iTxt[29]="타이어 사용" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="ko"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=ks_c_5601-1987" />
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
			<span class="title sys-font-heading3 sys-rhp-color-title">Windows Update 카탈로그 시작</span></td>
	</tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">네트워크에서 배포할 수 있는 다양한 업데이트를 선택할 수 있습니다.  이 사이트에서는 Windows 업데이트, 향상된 기능, <a href="http://go.microsoft.com/fwlink/?LinkId=9577" target ="_blank" class="sys-link-normal">Designed for Windows</a> 로고 등의 정보가 모두 제공됩니다. <a class="sys-link-normal" href="/ko/about.asp#driverupdates">
			장치 드라이버</a></td>

	</tr>	
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="ossearch.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="작업 및 명령을 나타내는 녹색 화살표" src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Windows 운영 체제를 위한 서비스 팩, 보안 수정, 및 다른 업데이트를 검색하기 위해 검색조건을 설정합니다." WIDTH="30" HEIGHT="25"></a></td><td class="8pt" style="padding:0"><a class="sys-link-normal" href="ossearch.asp" title="Windows 운영 체제를 위한 서비스 팩, 보안 수정, 및 다른 업데이트를 검색하기 위해 검색조건을 설정합니다.">Microsoft Windows 운영 체제를 위한 업데이트 검색</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="corp_drivers.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="작업 및 명령을 나타내는 녹색 화살표" src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="Windows 기반 컴퓨터의 장치 드라이버를 위한 업데이트를 검색하기 위해 검색 조건을 설정합니다. " WIDTH="30" HEIGHT="25">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="corp_drivers.asp" title="Windows 기반 컴퓨터의 장치 드라이버를 위한 업데이트를 검색하기 위해 검색 조건을 설정합니다. ">하드웨어 장치를 위한 업데이트 검색</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="javascript:goHistory();" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="작업 및 명령을 나타내는 파랑 화살표" src="/catalog/images/SplashBlue.bmp" border="0"  style="padding-bottom:-5px;" title="Windows Update 카탈로그에서 다운로드한 항목의 기록">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="javascript:goHistory();" title="Windows Update 카탈로그에서 다운로드한 항목의 기록">다운로드 내역 보기</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">업데이트를 다운로드한 이후에는 해당 업데이트를 언제든지 설치할 수 있습니다.</td>
	</tr>
	

</table>

</body>
</html>