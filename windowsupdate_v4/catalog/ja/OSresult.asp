
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



	<script language="JScript" type="text/javascript" src="/catalog/shared/js/content.js"></script>
	<script language="jscript">
		aids = new Array()
		function GotoDetails(i,Groupname){
			var j=("anc" + i)
			catname.innerText=eval(j).innerText
			info.style.display="none"
			basketbar.style.display="block"
			gotobasket.style.visibility="visible"
			hiddenform.ids.value =aids[i]
			hiddenform.Groupname.value=Groupname
			hiddenform.speed.value=parent.g_iConnectionSpeed;
			hiddenform.submit();
			return;
		}

		function gobasket(){
			basketform.os_sBasket.value=parent.frames["eTOC"].os_sBasket;
			basketform.driver_sBasket.value=parent.frames["eTOC"].driver_sBasket;
			basketform.speed.value=parent.g_iConnectionSpeed;
			basketform.submit();
			//location.href="downloadbasket.asp?os_sBasket=" + parent.frames["eTOC"].os_sBasket + "&driver_sBasket=" + parent.frames["eTOC"].driver_sBasket
		}
		function checkiframe() {
			if (resultframe.innerHTML |= ""){
				info.style.display="none"
				gotobasket.style.visibility="visible"
				basketbar.style.display="block"
			}
			if(eUpdatesContainer.style.visibility == "visible") {
				info.style.display="none"
				gotobasket.style.visibility="visible"
				basketbar.style.display="block"
				return
			}

		}
		function checkkey(){
		alert("here")
			alert(window.event.srcElement)
		}

	</script>
</head>
<body class="results" onload="checkiframe()" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;" style="overflow:hidden">

<form name="hiddenform" id="hiddenform" method="post" action="OSdetails.asp" target="resultframe">
	<input type="hidden" name="SelLang" id="SelLang" value="">
	<input type="hidden" name="SelPostedDate" id="SelPostedDate" value="">
	<input type="hidden" name="lan" id="lan" value="en">
	<input type="hidden" name="ids" id="ids">
	<input type="hidden" name="speed" id="speed">
	<input type="hidden" name="Groupname" id="Groupname">
</form>

<form name="basketform" id="basketform" action="downloadbasket.asp" method="post">
	<input type="hidden" name="os_sBasket" id="os_sBasket">
	<input type="hidden" name="driver_sBasket" id="driver_sBasket">
	<input type="hidden" name="speed" id="speed">
</form>

<table cellpadding="0" cellspacing="0" border="0">
	<tbody>
	<tr><td height="1"><span class="8pt sys-font-body sys-color-body" id="addspan" name="addspan" style="visibility:hidden;height=1;overflow;hidden">�ǉ�</span><span class="8pt sys-font-body sys-color-body" name="removespan" id="removespan" style="visibility:hidden;height=1;overflow;hidden">�폜</span></td></tr>
	<tr><td class="8pt sys-font-body sys-color-body" valign="top">
			<b>�������ʂ� <span id="totalitems"></span>&nbsp; ������܂���</b> <br/>���̈ꗗ����I�����A�e�J�e�S���Ō��������X�V��\�����܂��B</td>
	</tr>
	<tr><td><img src="/catalog/images/ts.gif" HEIGHT="10" WIDTH="1"></td></tr>
	<tr>
		<td valign="top">
			<div class="resultsPageInfo">
				
			</div></td>
	</tr>

	<tr><td id="info" class="8pt sys-font-body sys-color-body" align="center" valign="bottom">
		<img src="/catalog/images/ts.gif" width="1" height="100"><b>��L�̈ꗗ����J�e�S����I�����Ă��������B</b></td>
	</tr>

	<tr><td id="gotobasket" class="8pt sys-font-body sys-color-body" align="left" valign="top" style="visibility:hidden">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td HEIGHT="10" colspan="2" ><img src="/catalog/images/ts.gif" HEIGHT="10"></td>
			</tr>

			<tr>
				<td class="8pt sys-font-body sys-color-body" valign="top" width="50%"><a class="sys-link-normal" href="/" onclick="javascript:gobasket();return false;"><img alt="�ΐF�̖��A�C�R���̓^�X�N�܂��͓����\���Ă��܂��B" src="/catalog/images/green_arrow.gif" border="0"  style="padding-bottom:-5px;" align=absmiddle WIDTH="30" HEIGHT="25">�_�E�����[�h �o�X�P�b�g�Ɉړ����܂�</a></td>
				<td class="8pt sys-font-body sys-color-body" align="right">�_�E�����[�h �o�X�P�b�g���̍��ڂ̍��v��:<span id="eViewBasket"> </span> <span id="eBasketStats"></span> </td>
			</tr>
			<tr>
				<td colspan="2" HEIGHT="6"><img src="/catalog/images/ts.gif" HEIGHT="10"></td>
			</tr>
			<tr>
				<td colspan="2" class="8pt sys-font-body sys-color-body" valign="top" align='right'>���בւ���: 
					<select onchange="sortitems()" name="sortselect" id="sortselect">
						<option value="0">�^�C�g��</option>
						<option value="2">���e�������t</option>
					</select>
				</td>

			</tr>
			<tr>
				<td HEIGHT="10" colspan="2" ><img src="/catalog/images/ts.gif" HEIGHT="10"></td>
			</tr>
		</table></td>
	</tr>

	<tr>
		<td valign="top" id="basketbar" class="resultsBasketBar sys-table-header-bgcolor1 sys-table-color-border sys-toppane-header-color" style="display:none">

			<b><span id="catname" name="catname"></span></b>
		</td>
	</tr>

	<tr>
		<td valign="top" height="100%"><iframe src name="resultframe" style="display:none" id="resultframe" height="0" width="0"></iframe>
			<div id="eUpdatesContainer" class="eUpdatesContainer sys-table-color-border sys-table-cell-bgcolor2" name="eUpdatesContainer" style="visibility:hidden">
			</div></td>
	</tr>

	</tbody>
</table>

<script language="jscript">
	var basketarray=parent.frames["eTOC"].sBasketString.split(",");
	eBasketStats.innerHTML =basketarray.length - 1
	if (basketarray.length - 1 <= 0){
		eViewBasket.disabled = true
	}
	totalitems.innerHTML="0"
</script>
</body>
</html>