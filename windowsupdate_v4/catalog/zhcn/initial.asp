
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

	iTxt[0]="阿拉伯语" + "@" + "ar|1256"
	//iTxt[1]="支持阿拉伯语" + "@" + "en_arabic|1252"
	iTxt[1]="土耳其语" + "@" + "tr|1254"
	iTxt[2]="简体中文" + "@" + "zhcn|936"
	iTxt[3]="繁体中文" + "@" + "zhtw|950"
	iTxt[4]="捷克语" + "@" + "cs|1250"
	iTxt[5]="丹麦语" + "@" + "da|1252"
	iTxt[6]="荷兰语" + "@" + "nl|1252"
	iTxt[7]="英语" + "@" + "en|1252"
	iTxt[8]="芬兰语" + "@" + "fi|1252"
	iTxt[9]="法文" + "@" + "fr|1252"
	iTxt[10]="德文" + "@" + "de|1252"
	iTxt[11]="希腊语" + "@" + "el|1253"
	//iTxt[12]="希腊文 IBM" + "@" + "el_ibm|869"
	iTxt[12]="瑞典语" + "@" + "sv|1252"
	iTxt[13]="希伯来语" + "@" + "he|1255"
	//iTxt[14]="启用了希伯来文" + "@" + "en_hebrew|1252"
	iTxt[14]="西班牙语" + "@" + "es|1252"
	iTxt[15]="匈牙利语" + "@" + "hu|1250"
	iTxt[16]="意大利文" + "@" + "it|1252"
	iTxt[17]="日语" + "@" + "ja|932"
	iTxt[18]="日文 NEC" + "@" + "nec|932"
	iTxt[19]="朝鲜语" + "@" + "ko|949"
	iTxt[20]="挪威语" + "@" + "no|1252"
	iTxt[21]="波兰语" + "@" + "pl|1250"
	iTxt[22]="葡萄牙语(巴西语)" + "@" + "ptbr|1252"
	iTxt[23]="葡萄牙语(标准)" + "@" + "pt|1252"
	iTxt[24]="俄语" + "@" + "ru|1251"
	//iTxt[25]="斯洛伐克语" + "@" + "sk|1250"
	//iTxt[26]="斯洛文尼亚语" + "@" + "sl|1250"
	
	
	//iTxt[29]="启用了泰国语" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="zhcn"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
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
			<span class="title sys-font-heading3 sys-rhp-color-title">欢迎使用 Windows Update 目录</span></td>
	</tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">选择可以在您的网络中分发的各种更新程序。通过该站点，您可以同时实现 Windows 更新和改进以及 <a href="http://go.microsoft.com/fwlink/?LinkId=9577" target ="_blank" class="sys-link-normal">Designed for Windows</a> (适用于 Windows)徽标。<a class="sys-link-normal" href="/zhcn/about.asp#driverupdates">
			设备驱动程序。</a></td>

	</tr>	
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="ossearch.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="绿箭头图标表示一个任务或操作。" src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="设置搜索条件来寻找 service packs，安全修补程序和其它 Windows 操作系统的更新。" WIDTH="30" HEIGHT="25"></a></td><td class="8pt" style="padding:0"><a class="sys-link-normal" href="ossearch.asp" title="设置搜索条件来寻找 service packs，安全修补程序和其它 Windows 操作系统的更新。">查找 Microsoft Windows 操作系统的更新</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="10">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="corp_drivers.asp" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="绿箭头图标表示一个任务或操作。" src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" title="设置搜索条件来查找您的基于 Windows 的计算机的设备驱动程序。" WIDTH="30" HEIGHT="25">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="corp_drivers.asp" title="设置搜索条件来查找您的基于 Windows 的计算机的设备驱动程序。">查找硬件设备的更新</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr><td valign="top"><a class="sys-link-normal" href="javascript:goHistory();" style="padding:0" onmouseover="imgancmover(this)" onmouseout="imgancmout(this)"><img alt="蓝箭头图标表示一个任务或操作。" src="/catalog/images/SplashBlue.bmp" border="0"  style="padding-bottom:-5px;" title="跟踪您从 Windows Update 目录下载了哪些更新。">&nbsp;&nbsp;</a></td><td class="8pt sys-font-body sys-color-body" style="padding:0"><a class="sys-link-normal" href="javascript:goHistory();" title="跟踪您从 Windows Update 目录下载了哪些更新。">查看下载历史</a></td></tr>
	<tr><td colspan="2" class="8pt sys-font-body sys-color-body" height="40">&nbsp;</td></tr>
	<tr>
		<td colspan="2" class="8pt sys-font-body sys-color-body">在您下载更新后，您可以在任何时候安装它们。</td>
	</tr>
	

</table>

</body>
</html>