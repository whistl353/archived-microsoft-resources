
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

	iTxt[0]="アラビア語" + "@" + "ar|1256"
	//iTxt[1]="アラビア語有効" + "@" + "en_arabic|1252"
	iTxt[1]="トルコ語" + "@" + "tr|1254"
	iTxt[2]="簡体字中国語" + "@" + "zhcn|936"
	iTxt[3]="繁体字中国語" + "@" + "zhtw|950"
	iTxt[4]="チェコ語" + "@" + "cs|1250"
	iTxt[5]="デンマーク語" + "@" + "da|1252"
	iTxt[6]="オランダ語" + "@" + "nl|1252"
	iTxt[7]="英語" + "@" + "en|1252"
	iTxt[8]="フィンランド語" + "@" + "fi|1252"
	iTxt[9]="フランス語" + "@" + "fr|1252"
	iTxt[10]="ドイツ語" + "@" + "de|1252"
	iTxt[11]="ギリシャ語" + "@" + "el|1253"
	//iTxt[12]="ギリシャ語 IBM" + "@" + "el_ibm|869"
	iTxt[12]="スウェーデン語" + "@" + "sv|1252"
	iTxt[13]="ヘブライ語" + "@" + "he|1255"
	//iTxt[14]="ヘブライ語有効" + "@" + "en_hebrew|1252"
	iTxt[14]="スペイン語" + "@" + "es|1252"
	iTxt[15]="ハンガリー語" + "@" + "hu|1250"
	iTxt[16]="イタリア語" + "@" + "it|1252"
	iTxt[17]="日本語" + "@" + "ja|932"
	iTxt[18]="日本語 NEC" + "@" + "nec|932"
	iTxt[19]="韓国語" + "@" + "ko|949"
	iTxt[20]="ノルウェー語" + "@" + "no|1252"
	iTxt[21]="ポーランド語" + "@" + "pl|1250"
	iTxt[22]="ポルトガル語 (ブラジル)" + "@" + "ptbr|1252"
	iTxt[23]="ポルトガル語 (標準)" + "@" + "pt|1252"
	iTxt[24]="ロシア語" + "@" + "ru|1251"
	//iTxt[25]="スロバキア語" + "@" + "sk|1250"
	//iTxt[26]="スロベニア語" + "@" + "sl|1250"
	
	
	//iTxt[29]="タイ語有効" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="ja"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=shift_jis" />
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
               単語を使って Windows Update カタログ検索を制限します
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
クエリに特定の単語が含まれる場合、タイトルおよび説明に、入力した単語と完全に一致する単語を少なくとも 1 つ以上含む限定された更新が結果として表示されます。入力した単語の順序も完全に一致します。
</p>

<P>例: <B>Windows スクリプト サポート</B>と入力した場合、これと完全に一致する語句を含む更新が表示されます。
</p>
<P>単語を使った検索を制限するほかのヒントです:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>クエリの結果を得るのに問題がある場合、同じ意味を持つほかの単語を入力してみます (たとえば、"Web" の代わりに "インターネット" を入力します)。</li>
		<li>クエリに含まれる句読点は無視されません。 </li>
		<li>検索は大文字と小文字を区別しません: <B>Windows スクリプト サポート</B>と<B>windows スクリプト サポート</B>は、同じ結果を表示します。</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">印刷</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">閉じる</button>
</body>
</html>
