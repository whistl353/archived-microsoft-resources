
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

	iTxt[0]="ערבית" + "@" + "ar|1256"
	//iTxt[1]="תומך בערבית" + "@" + "en_arabic|1252"
	iTxt[1]="טורקית" + "@" + "tr|1254"
	iTxt[2]="סינית פשוטה " + "@" + "zhcn|936"
	iTxt[3]="סינית טאיוונית (מסורתית)" + "@" + "zhtw|950"
	iTxt[4]="צ'כית" + "@" + "cs|1250"
	iTxt[5]="דנית" + "@" + "da|1252"
	iTxt[6]="הולנדית" + "@" + "nl|1252"
	iTxt[7]="אנגלית" + "@" + "en|1252"
	iTxt[8]="פינית" + "@" + "fi|1252"
	iTxt[9]="צרפתית" + "@" + "fr|1252"
	iTxt[10]="גרמנית" + "@" + "de|1252"
	iTxt[11]="יוונית" + "@" + "el|1253"
	//iTxt[12]="יוונית IBM" + "@" + "el_ibm|869"
	iTxt[12]="שוודית" + "@" + "sv|1252"
	iTxt[13]="עברית" + "@" + "he|1255"
	//iTxt[14]="תומך עברית" + "@" + "en_hebrew|1252"
	iTxt[14]="ספרדית" + "@" + "es|1252"
	iTxt[15]="הונגרית" + "@" + "hu|1250"
	iTxt[16]="איטלקית" + "@" + "it|1252"
	iTxt[17]="יפנית" + "@" + "ja|932"
	iTxt[18]="יפנית NEC" + "@" + "nec|932"
	iTxt[19]="קוריאנית" + "@" + "ko|949"
	iTxt[20]="נורווגית" + "@" + "no|1252"
	iTxt[21]="פולנית" + "@" + "pl|1250"
	iTxt[22]="פורטוגזית (ברזילאית)" + "@" + "ptbr|1252"
	iTxt[23]="פורטוגזית (תקנית)" + "@" + "pt|1252"
	iTxt[24]="רוסית" + "@" + "ru|1251"
	//iTxt[25]="סלובקית" + "@" + "sk|1250"
	//iTxt[26]="סלובנית" + "@" + "sl|1250"
	
	
	//iTxt[29]="תומך תאיית" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="he"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1255" />
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
               שמוש במילים כדי למקד את החיפוש שלך בקטלוג של Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
כאשר אתה כולל מלים מסוימות בשאילתא שלך,  החיפוש Search  מציג תוצאות מוגבלות לכותרות ותיאורים הכוללים לפחות מקרה אחד של המילים המדויקות שהזנת ובדיוק בסדר שהזנת אותם.
</p>

<P>לדוגמא: אם תקליד <B>Windows Script Support</B>, החיפוש יציג עדכונים שכוללים בכותרת או בתיאור את צירופי המלים האלה בדיוק .
</p>
<P>עצות נוספות לשימוש במילים כדי למקד את החיפוש שלך:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>אם אתה מתקשה בהסגת תוצאות לשאילתא שלך, נסה להשתמש במלים נרדפות לאותו דבר (לדוגמא, נסה להקליד "Internet" במקום "Web").</li>
		<li>החיפוש  אינו מתעלם מניקוד שכלול בשאילתא. </li>
		<li>החיפוש אינו מקפיד על אותיות גדולות וקטנות: <B>תמיכה ל- Windows Script </B> יציג את אותן התוצאות כמו  <B>תמיכה ל- windows script&nbsp; </B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;left:150px;'   onclick="window.print();">הדפסה</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;left:20px;'  onclick="window.close();">סגור</button>
</body>
</html>
