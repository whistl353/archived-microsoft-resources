
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
	//iTxt[1]="��� ���� �������" + "@" + "en_arabic|1252"
	iTxt[1]="����" + "@" + "tr|1254"
	iTxt[2]="���� ����� " + "@" + "zhcn|936"
	iTxt[3]="���� ������ " + "@" + "zhtw|950"
	iTxt[4]="��������" + "@" + "cs|1250"
	iTxt[5]="�����������" + "@" + "da|1252"
	iTxt[6]="���������" + "@" + "nl|1252"
	iTxt[7]="����������" + "@" + "en|1252"
	iTxt[8]="���������" + "@" + "fi|1252"
	iTxt[9]="��������" + "@" + "fr|1252"
	iTxt[10]="���������" + "@" + "de|1252"
	iTxt[11]="���������" + "@" + "el|1253"
	//iTxt[12]="IBM �����" + "@" + "el_ibm|869"
	iTxt[12]="�����" + "@" + "sv|1252"
	iTxt[13]="�������" + "@" + "he|1255"
	//iTxt[14]="��� ���� �������" + "@" + "en_hebrew|1252"
	iTxt[14]="������" + "@" + "es|1252"
	iTxt[15]="���������" + "@" + "hu|1250"
	iTxt[16]="���������" + "@" + "it|1252"
	iTxt[17]="���������" + "@" + "ja|932"
	iTxt[18]="NEC ������" + "@" + "nec|932"
	iTxt[19]="�������" + "@" + "ko|949"
	iTxt[20]="���������" + "@" + "no|1252"
	iTxt[21]="���������" + "@" + "pl|1250"
	iTxt[22]="������� (��������)" + "@" + "ptbr|1252"
	iTxt[23]="������� (�����)" + "@" + "pt|1252"
	iTxt[24]="����" + "@" + "ru|1251"
	//iTxt[25]="�������" + "@" + "sk|1250"
	//iTxt[26]="�������" + "@" + "sl|1250"
	
	
	//iTxt[29]="��� ���� �����������" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="ar"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1256" />
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
			<span class="title sys-font-heading3 sys-rhp-color-title">����� ����� �������</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			���� ��� ����� ����� �� ���� ��������� ������ ��� ��� ������ ���� ����.</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=ar&amp;lcat=&#1601;&#1610;&#1583;&#1610;&#1608;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				������ �����, ����� ����� ������� �������ɡ ���� �� ���� DVD�, ������ ������ ����� ������ ���������...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=ar&amp;lcat=&#1589;&#1608;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ������ʡ �������� ����� ����� ����� �����ɡ ������ ��ʡ ������ ���...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=ar&amp;lcat=&#1591;&#1575;&#1576;&#1593;&#1575;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>������</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				����� ���, ����, dot-matrix, ��� ����, ������...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1605;&#1608;&#1583;&#1605;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����� ����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				����� ����� ���� ISDN� DSL� ���...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=ar&amp;lcat=&#1603;&#1575;&#1605;&#1610;&#1585;&#1575;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�������</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				������ ����� ����� �������, ������ ����� �����, ������ �����/���...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=ar&amp;lcat=&#1605;&#1575;&#1587;&#1581;&#1575;&#1578;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>������</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�����, ����� ����ѡ ����� ������...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1593;&#1585;&#1590;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����� ���</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CRT�, ����� LCD �����, LED�, ������, ���� ���...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=ar&amp;lcat=&#1588;&#1576;&#1603;&#1575;&#1578; &#1575;&#1578;&#1589;&#1575;&#1604;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����� �����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				���� ����� ����� (LAN), ������, ISDN�, HPNA, IrDA�, WAN�, ATM (��� ����� ��� ��������)...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1575;&#1604;&#1573;&#1583;&#1582;&#1575;&#1604;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����� �������</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				����, ���� ������, ����� ���� �������, ���� ������ ������ �������� ����� ��ӡ ����� �����...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=ar&amp;lcat=&#1578;&#1582;&#1586;&#1610;&#1606;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ������ ������ ���� ����� ����� ������ ����� ������ � DVD�, ������ ����� ����ɡ ������ ����� ����� ������ɡ RAID�� ������ �����...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1603;&#1605;&#1576;&#1610;&#1608;&#1578;&#1585;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����� �������</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ����� ��� ������, ����� ������, ����� ������� ������ ����� �� PDA </td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=ar&amp;lcat=&#1581;&#1604;&#1608;&#1604; &#1575;&#1604;&#1605;&#1604;&#1602;&#1605;&#1575;&#1578; &#1608;&#1575;&#1604;&#1603;&#1578;&#1604;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���� �������� ������</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�� ������, ���� datacenter, �� GEOCluster, ����...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=ar&amp;lcat=&#1571;&#1580;&#1607;&#1586;&#1577; &#1571;&#1582;&#1585;&#1609;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����� ����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				����� ������ ������, ����� �������, ����� USB, ���� ���� ��� ���� �������� (UPS)�, Cardbus/PCMCIA�, ����� ���� 1394...</td>
		</tr>
	
</table>
<br/>

</body>
</html>