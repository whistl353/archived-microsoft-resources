
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

	iTxt[0]="�A���r�A��" + "@" + "ar|1256"
	//iTxt[1]="�A���r�A��L��" + "@" + "en_arabic|1252"
	iTxt[1]="�g���R��" + "@" + "tr|1254"
	iTxt[2]="�ȑ̎�������" + "@" + "zhcn|936"
	iTxt[3]="�ɑ̎�������" + "@" + "zhtw|950"
	iTxt[4]="�`�F�R��" + "@" + "cs|1250"
	iTxt[5]="�f���}�[�N��" + "@" + "da|1252"
	iTxt[6]="�I�����_��" + "@" + "nl|1252"
	iTxt[7]="�p��" + "@" + "en|1252"
	iTxt[8]="�t�B�������h��" + "@" + "fi|1252"
	iTxt[9]="�t�����X��" + "@" + "fr|1252"
	iTxt[10]="�h�C�c��" + "@" + "de|1252"
	iTxt[11]="�M���V����" + "@" + "el|1253"
	//iTxt[12]="�M���V���� IBM" + "@" + "el_ibm|869"
	iTxt[12]="�X�E�F�[�f����" + "@" + "sv|1252"
	iTxt[13]="�w�u���C��" + "@" + "he|1255"
	//iTxt[14]="�w�u���C��L��" + "@" + "en_hebrew|1252"
	iTxt[14]="�X�y�C����" + "@" + "es|1252"
	iTxt[15]="�n���K���[��" + "@" + "hu|1250"
	iTxt[16]="�C�^���A��" + "@" + "it|1252"
	iTxt[17]="���{��" + "@" + "ja|932"
	iTxt[18]="���{�� NEC" + "@" + "nec|932"
	iTxt[19]="�؍���" + "@" + "ko|949"
	iTxt[20]="�m���E�F�[��" + "@" + "no|1252"
	iTxt[21]="�|�[�����h��" + "@" + "pl|1250"
	iTxt[22]="�|���g�K���� (�u���W��)" + "@" + "ptbr|1252"
	iTxt[23]="�|���g�K���� (�W��)" + "@" + "pt|1252"
	iTxt[24]="���V�A��" + "@" + "ru|1251"
	//iTxt[25]="�X���o�L�A��" + "@" + "sk|1250"
	//iTxt[26]="�X���x�j�A��" + "@" + "sl|1250"
	
	
	//iTxt[29]="�^�C��L��" + "@" + "en_thai|1252"
	

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
			<span class="title sys-font-heading3 sys-rhp-color-title">�n�[�h�E�F�A �h���C�o</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			�n�[�h�E�F�A �J�e�S����I�����A�f�o�C�X�����������삷�邽�߂̍ŐV�̍X�V���������܂��B</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=ja&amp;lcat=�r�f�I">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�r�f�I</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�r�f�I �J�[�h�A�}�U�[�{�[�h �r�f�I �`�b�v�Z�b�g�ADVD �f�R�[�_�A�r�f�I �L���v�`�� �J�[�h�ATV �`���[�i�Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=ja&amp;lcat=�T�E���h">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�T�E���h</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 �X�s�[�J�A�}�C�N�A�g�у��f�B�A �v���[���[�A�T�E���h �J�[�h�A�V���Z�T�C�U�Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=ja&amp;lcat=�v�����^">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�v�����^</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�t�H�g �v�����^�A���[�U�[�A�h�b�g �}�g���b�N�X�A�\���b�h �C���N�A�A�N�Z�T���Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=ja&amp;lcat=���f��">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���f��</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�O�t�����f���A���f�� �J�[�h�AISDN�ADSL�A�P�[�u���Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=ja&amp;lcat=�J����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�J����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�f�W�^�� �X�`�� �J�����ADV (�f�W�^�� �r�f�I) �J�����A�r�f�I/Web �J�����Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=ja&amp;lcat=�X�L���i">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�X�L���i</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�t���b�g�x�b�g�A�X�N���[�������A�n���h�w���h �X�L���i�Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=ja&amp;lcat=���j�^">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���j�^</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CRT�ALCD �t���b�g �p�l���ALED�A�v���Y�}�A�v���W�F�N�^�Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=ja&amp;lcat=�l�b�g���[�N">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�l�b�g���[�N</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				LAN�A���C�����X�AISDN�AHPNA�AIrDA�AWAN�AATM (�񓯊��]�����[�h)�Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=ja&amp;lcat=���̓f�o�C�X">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���̓f�o�C�X</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�}�E�X�A�L�[�{�[�h�A�Q�[�� �R���g���[���A�g���b�N�{�[���A�}�C�N�A�^�b�` �p�b�h�A���C�g �y���Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=ja&amp;lcat=�L����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�L����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 �L����A�_�v�^����уR���g���[���ACD-DVD �h���C�u�A�n�[�h�f�B�X�N �h���C�u�A�����[�o�u�� ���f�B�A �h���C�u�ARAID�A�e�[�v �h���C�u�Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=ja&amp;lcat=�p�[�\�i�� �R���s���[�^">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�p�[�\�i�� �R���s���[�^</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 �f�X�N�g�b�v �V�X�e���A���o�C�� �V�X�e���A�n���h�w���h �R���s���[�^�APDA �Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=ja&amp;lcat=�T�[�o�[ �\�����[�V�����ƃN���X�^ �\�����[�V����">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>�T�[�o�[ �\�����[�V�����ƃN���X�^ �\�����[�V����</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				�N���X�^ �\�����[�V�����ADatacenter Server�AGEOCluster �\�����[�V�����A�T�[�o�[�Ȃ�...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=ja&amp;lcat=���̂ق��̃n�[�h�E�F�A">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>���̂ق��̃n�[�h�E�F�A</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CPU�A�}�U�[�{�[�h�AUSB �n�u�AUPS (����d�d��)�A�J�[�h�o�X/PCMCIA�A1394 �R���g���[���Ȃ�...</td>
		</tr>
	
</table>
<br/>

</body>
</html>