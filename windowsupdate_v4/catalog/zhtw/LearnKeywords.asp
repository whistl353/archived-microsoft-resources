
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

	iTxt[0]="阿拉伯文" + "@" + "ar|1256"
	//iTxt[1]="阿拉伯文支援" + "@" + "en_arabic|1252"
	iTxt[1]="土耳其文" + "@" + "tr|1254"
	iTxt[2]="簡體中文" + "@" + "zhcn|936"
	iTxt[3]="繁體中文" + "@" + "zhtw|950"
	iTxt[4]="捷克文" + "@" + "cs|1250"
	iTxt[5]="丹麥文" + "@" + "da|1252"
	iTxt[6]="荷蘭文" + "@" + "nl|1252"
	iTxt[7]="英文" + "@" + "en|1252"
	iTxt[8]="芬蘭文" + "@" + "fi|1252"
	iTxt[9]="法文" + "@" + "fr|1252"
	iTxt[10]="德文" + "@" + "de|1252"
	iTxt[11]="希臘文" + "@" + "el|1253"
	//iTxt[12]="希臘文 IBM" + "@" + "el_ibm|869"
	iTxt[12]="瑞典文" + "@" + "sv|1252"
	iTxt[13]="希伯來文" + "@" + "he|1255"
	//iTxt[14]="希伯來文支援" + "@" + "en_hebrew|1252"
	iTxt[14]="西班牙文" + "@" + "es|1252"
	iTxt[15]="匈牙利文" + "@" + "hu|1250"
	iTxt[16]="義大利文" + "@" + "it|1252"
	iTxt[17]="日文" + "@" + "ja|932"
	iTxt[18]="日文 NEC" + "@" + "nec|932"
	iTxt[19]="韓文" + "@" + "ko|949"
	iTxt[20]="挪威文" + "@" + "no|1252"
	iTxt[21]="波蘭文" + "@" + "pl|1250"
	iTxt[22]="葡萄牙文 (巴西的)" + "@" + "ptbr|1252"
	iTxt[23]="葡萄牙文 (標準的)" + "@" + "pt|1252"
	iTxt[24]="俄文" + "@" + "ru|1251"
	//iTxt[25]="斯洛伐克文" + "@" + "sk|1250"
	//iTxt[26]="斯洛維尼亞文" + "@" + "sl|1250"
	
	
	//iTxt[29]="泰文支援" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="zhtw"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=big5" />
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
               使用文字來限制您的 Windows Update 類別目錄搜尋結果
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
當您將特定文字包含在查詢中時，搜尋會顯示只限於標題或描述中包含您輸入那段文字的更新，並以您輸入的順序來排列。
</p>

<P>例如：如果您輸入 <B>Windows Script Support</B>，搜尋將顯示在標題或描述中包含這段文字的更新。
</p>
<P>使用文字來限制您的搜尋結果的其他秘訣：
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>如果您無法取得查詢的結果，請試著使用具有相同意義的其他文字來查詢 (例如，以 "Internet" 來查，而不用 "Web")。</li>
		<li>搜尋不會略過您包含在查詢中的標點符號。 </li>
		<li>搜尋功能不會區分大小寫：<B>Windows Script Support</B> 的搜尋結果將和 <B>windows script&nbsp; support</B> 顯示出來的一樣。</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">列印</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">關閉</button>
</body>
</html>
