
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
<script language="jscript">

function selectlink(){
	var vLinks =parent.frames["eTOC"].document.links;
	var iLinksLen = vLinks.length;
	for(i = 0; i < iLinksLen; i++)
		vLinks[i].className = "";
	parent.frames["eTOC"].eHardwareDrivers.className="selected";
}
</script>
</head>
<body onLoad="parent.eTOC.fnSyncTOC(window.location.href, -1, -1)" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<span class="title sys-font-heading3 sys-rhp-color-title">מנהלי התקני חומרה</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			בחר בקטגוריה של חומרה, וחפש את העדכונים האחרונים הדרושים להמשך הפעולה התקינה של ההתקנים שלך.</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=he&amp;lcat=&#1493;&#1497;&#1491;&#1488;&#1493;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>וידאו</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				כרטיסי וידאו, מערכות שבבי וידאו מלוח האם, מפענחי DVD, כרטיסי לכידת וידאו, מכווני טלויזיה...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=he&amp;lcat=&#1510;&#1500;&#1497;&#1500;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>צליל</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 רמקולים, מיקרופונים, התקני מדיה ניידים, כרטיסי קול, סינתיסייזרים...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=he&amp;lcat=&#1502;&#1491;&#1508;&#1505;&#1493;&#1514;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>מדפסות</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				מדפסת צילום, מדפסת ליזר, dot-matrix,  הזרקת דיו, עזרים...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=he&amp;lcat=&#1502;&#1493;&#1491;&#1502;&#1497;&#1501;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>מודמים</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				חיצוני, כרטיס מודם, ‎, ISDN, DSLכבל...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=he&amp;lcat=&#1502;&#1510;&#1500;&#1502;&#1493;&#1514;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>מצלמות</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				מצלמה סטטית-דיגיטלית, מצלמת וידאו דיגיטלית (DV), מצלמת וידאו/אינטרנט...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=he&amp;lcat=&#1505;&#1493;&#1512;&#1511;&#1497;&#1501;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>סורקים</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				שטוח, הזנה רציפה, כף יד...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=he&amp;lcat=&#1510;&#1490;&#1497;&#1501;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>צגים</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				LCD עם פנל שטוח, CRT, LED, פלסמה, מקרנים...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=he&amp;lcat=&#1512;&#1513;&#1514;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>רשת</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				LAN, אל-חוטי, ISDN, HPNA, IrDA, WAN, ATM (מצב העברה לא מסונכרנת)...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=he&amp;lcat=&#1492;&#1514;&#1511;&#1504;&#1497; &#1511;&#1500;&#1496;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>התקני קלט</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				עכבר, מקלדת, בקרי משחקים, מוט היגוי, מיקרופונים, מקלדות משחק, עטי אור...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=he&amp;lcat=&#1488;&#1495;&#1505;&#1493;&#1503;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>אחסון</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 מתאמי איכסון ובקרים, כונני CD-DVD, כוננים קשיחים, כונני מדיה נשלפים, RAID כונני הקלטה...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=he&amp;lcat=&#1502;&#1495;&#1513;&#1489;&#1497;&#1501; &#1488;&#1497;&#1513;&#1497;&#1497;&#1501;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>מחשבים אישיים</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 מערכות שולחן, מערכות נישאות, מערכות מחשבי כף יד או מערכות PDA </td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=he&amp;lcat=&#1508;&#1514;&#1512;&#1493;&#1504;&#1493;&#1514; &#1513;&#1512;&#1514;&#1497;&#1501; &#1493;&#1488;&#1513;&#1499;&#1493;&#1500;&#1493;&#1514;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>פתרונות שרתים ואשכולות</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				פתרון אשכול, שרת מרכז מידע, פתרון GEOCluster, שרת...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=he&amp;lcat=&#1495;&#1493;&#1502;&#1512;&#1492; &#1488;&#1495;&#1512;&#1514;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>חומרה אחרת</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CPUs, לוח אם, USB hub, UPS (ספק כוח אל-פסק), Cardbus/PCMCIA,  בקרי 1394...</td>
		</tr>
	
</table>
<br/>

</body>
</html>