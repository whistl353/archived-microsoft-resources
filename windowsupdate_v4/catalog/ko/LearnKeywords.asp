
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
               단어를 사용하여 Windows Update 카탈로그 검색 범위를 좁힘
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
쿼리에 특정 단어를 입력하면 해당 단어가 제목 또는 설명에 입력한 순서대로 포함되어 있는 업데이트만 검색 결과에 표시됩니다.
</p>

<P>예:  <B>Windows 스크립트 지원</B>을 입력하면 제목 또는 설명에 정확하게 일치하는 구가 포함된 업데이트가 표시됩니다. 
</p>
<P>검색의 범위를 좁히기 위한 기타 팁:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>쿼리의 결과를 얻는데 문제가 있는 경우, 동일한 의미의 다른 단어(예, "웹" 대신 "인터넷")의 사용을 시도하십시오.</li>
		<li>검색은 쿼리안에 포함한 문장 부호를 무시하지 않습니다.  </li>
		<li>검색은 대소문자를 구분하지 않습니다. <B>Windows 스크립트 지원</B> 및 <B>windows 스크립트 지원</B>은 그 결과가 일치합니다.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">인쇄</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">닫기</button>
</body>
</html>
