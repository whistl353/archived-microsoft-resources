
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
               使用文字来限制您的 Windows Update 目录搜索
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
如果您将特定文字包含在您的查询中，搜索的显示将限制在标题和描述精确包含您输入的文字(按您输入的准确顺序)的结果中。
</p>

<P>例如: 如果您键入 <B>Windows 脚本支持</B>，搜索将显示在标题或描述中精确包含此短语的更新。
</p>
<P>其它使用文字来限制您的搜索的窍门:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>如果您的查询返回结果有问题，请尝试使用其它含义相同的文字(例如，尝试使用 "Internet" 而不是 "Web")。</li>
		<li>搜索不忽略您在查询中包含的标点符号。 </li>
		<li>搜索大小写不敏感: 搜索 <B>Windows Script Support</B> 返回的结果与 <B>windows script&nbsp; support</B> 一样。</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">打印</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">关闭</button>
</body>
</html>
