
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

	iTxt[0]="�ƶ���" + "@" + "ar|1256"
	//iTxt[1]="�ƶ��� ���" + "@" + "en_arabic|1252"
	iTxt[1]="��Ű��" + "@" + "tr|1254"
	iTxt[2]="�߱��� ��ü" + "@" + "zhcn|936"
	iTxt[3]="�߱��� ��ü" + "@" + "zhtw|950"
	iTxt[4]="ü�ھ�" + "@" + "cs|1250"
	iTxt[5]="����ũ��" + "@" + "da|1252"
	iTxt[6]="�״������" + "@" + "nl|1252"
	iTxt[7]="����" + "@" + "en|1252"
	iTxt[8]="�ɶ����" + "@" + "fi|1252"
	iTxt[9]="��������" + "@" + "fr|1252"
	iTxt[10]="���Ͼ�" + "@" + "de|1252"
	iTxt[11]="�׸�����" + "@" + "el|1253"
	//iTxt[12]="�׸����� IBM" + "@" + "el_ibm|869"
	iTxt[12]="��������" + "@" + "sv|1252"
	iTxt[13]="���긮��" + "@" + "he|1255"
	//iTxt[14]="���긮�� ���" + "@" + "en_hebrew|1252"
	iTxt[14]="�����ξ�" + "@" + "es|1252"
	iTxt[15]="�밡����" + "@" + "hu|1250"
	iTxt[16]="��Ż���ƾ�" + "@" + "it|1252"
	iTxt[17]="�Ϻ���" + "@" + "ja|932"
	iTxt[18]="�Ϻ��� NEC" + "@" + "nec|932"
	iTxt[19]="�ѱ���" + "@" + "ko|949"
	iTxt[20]="�븣���̾�" + "@" + "no|1252"
	iTxt[21]="�������" + "@" + "pl|1250"
	iTxt[22]="����������(�����)" + "@" + "ptbr|1252"
	iTxt[23]="����������(��������)" + "@" + "pt|1252"
	iTxt[24]="���þƾ�" + "@" + "ru|1251"
	//iTxt[25]="���ι�Ű�ƾ�" + "@" + "sk|1250"
	//iTxt[26]="���κ��Ͼƾ�" + "@" + "sl|1250"
	
	
	//iTxt[29]="Ÿ�̾� ���" + "@" + "en_thai|1252"
	

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
			<span class="title sys-font-heading3 sys-rhp-color-title">�ϵ���� ����̹�</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			��ġ�� �ùٸ� �۵��� ���� �ϵ���� ���ָ� �����ϰ� �ֽ� ������Ʈ�� �˻��Ͻʽÿ�.</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=ko&amp;lcat=����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				���� ī��, �������� ���� Ĩ��, DVD ���ڴ�, ���� ĸó ī��, TV Ʃ��...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=ko&amp;lcat=����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ����Ŀ, ����ũ, �޴�� �̵�� �����, ���� ī��, �ŵ������...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=ko&amp;lcat=������">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>������</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				���� ������, ������, ��Ʈ ������, ��ũ, �׼�����...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=ko&amp;lcat=��">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>��</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				����, ��ī��, ISDN, DSL, ���̺�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=ko&amp;lcat=ī�޶�">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>ī�޶�</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				������ ���� ȭ�� ī�޶�, DV(������ ����) ī�޶�, ����/�� ī�޶�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=ko&amp;lcat=��ĳ��">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>��ĳ��</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				����, ��ũ�� �Է�, �ڵ����...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=ko&amp;lcat=�����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CRT, LCD ���, LED, �ö󽺸�, ��������...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=ko&amp;lcat=��Ʈ��ŷ">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>��Ʈ��ŷ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				LAN, ����, ISDN, HPNA, IrDA, WAN, ATM (�񵿱� ���� ���)...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=ko&amp;lcat=�Է� ��ġ">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�Է� ��ġ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				���콺, Ű����, ���� ��Ʈ�ѷ�, Ʈ����, ����ũ, ��ġ �е�, ����Ʈ ��...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=ko&amp;lcat=�����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ����� ����� �� ��Ʈ�ѷ�, CD-DVD ����̺�, �ϵ� ��ũ ����̺�, �̵��� �̵�� ����̺�, RAID, ������ ����̺�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=ko&amp;lcat=���� ��ǻ��">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���� ��ǻ��</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 ����ũ�� �ý���, �̵� �ý���, �ڵ���� ��ǻ�� �ý��� �Ǵ� PDA </td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=ko&amp;lcat=���� �� Ŭ������ �ַ��">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���� �� Ŭ������ �ַ��</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Ŭ������ �ַ��, Datacenter ����, GEOCluster �ַ��, ����...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=ko&amp;lcat=�ٸ� �ϵ����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�ٸ� �ϵ����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CPU, ��������, USB ���, UPS (������ ���� ���� ��ġ), ī�����/PCMCIA, 1394 ��Ʈ�ѷ�...</td>
		</tr>
	
</table>
<br/>

</body>
</html>