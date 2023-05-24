
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

	iTxt[0]="Árabe" + "@" + "ar|1256"
	//iTxt[1]="Árabe activado" + "@" + "en_arabic|1252"
	iTxt[1]="Turco" + "@" + "tr|1254"
	iTxt[2]="Chinês simplificado" + "@" + "zhcn|936"
	iTxt[3]="Chinês tradicional" + "@" + "zhtw|950"
	iTxt[4]="Checo" + "@" + "cs|1250"
	iTxt[5]="Dinamarquês" + "@" + "da|1252"
	iTxt[6]="Holandês" + "@" + "nl|1252"
	iTxt[7]="Inglês" + "@" + "en|1252"
	iTxt[8]="Finlandês" + "@" + "fi|1252"
	iTxt[9]="Francês" + "@" + "fr|1252"
	iTxt[10]="Alemão" + "@" + "de|1252"
	iTxt[11]="Grego" + "@" + "el|1253"
	//iTxt[12]="Grego IBM" + "@" + "el_ibm|869"
	iTxt[12]="Sueco" + "@" + "sv|1252"
	iTxt[13]="Hebraico" + "@" + "he|1255"
	//iTxt[14]="Hebraico activado" + "@" + "en_hebrew|1252"
	iTxt[14]="Espanhol" + "@" + "es|1252"
	iTxt[15]="Húngaro" + "@" + "hu|1250"
	iTxt[16]="Italiano" + "@" + "it|1252"
	iTxt[17]="Japonês" + "@" + "ja|932"
	iTxt[18]="Japonês NEC" + "@" + "nec|932"
	iTxt[19]="Coreano" + "@" + "ko|949"
	iTxt[20]="Norueguês" + "@" + "no|1252"
	iTxt[21]="Polaco" + "@" + "pl|1250"
	iTxt[22]="Português (brasileiro)" + "@" + "ptbr|1252"
	iTxt[23]="Português (padrão)" + "@" + "pt|1252"
	iTxt[24]="Russo" + "@" + "ru|1251"
	//iTxt[25]="Eslovaco" + "@" + "sk|1250"
	//iTxt[26]="Esloveno" + "@" + "sl|1250"
	
	
	//iTxt[29]="Tailandês activado" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="pt"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'>
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="/catalog/shared/css/content.css">
<link rel="stylesheet" type="text/css" href="hcp://system/css/shared.css" />

<script language="Jscript">
function Docheck(){

	var num=OSfind.num.value
	var selected=0
	if (OSfind.selOS.value == 0){
		alert("Seleccione um sistema operativo");
		return false;
	}
	for (i=0;i<=num;i++){
		check=eval("OSfind.check" + i )
		if (check.checked == true)
			selected=1;
	}
	if (selected == 0){
		alert("Seleccione, pelo menos, um tipo de actualização.");
		return false;
	}
	else{
		document.OSfind.submit();
		return true;
	}
}

function showadv(){
	window.event.cancelBubble = true;
	if (advopt.style.display == "none"){
		advopt.style.display="block"
		window.document.all("expando").src = expandoUpHover.src

	}
	else{
		advopt.style.display="none"
		window.document.all("expando").src = expandoDownHover.src
	}

}

function overchangeimage(){
	window.event.cancelBubble=true

	if (advopt.style.display == "none"){
		window.document.all("expando").src = expandoDownHover.src
	}
	else{
		window.document.all("expando").src = expandoUpHover.src
	}
	return false;
}

function outchangeimage(){
	window.event.cancelBubble=true

	if (advopt.style.display == "none"){
		window.document.all("expando").src = expandoDown.src
	}
	else{
		window.document.all("expando").src = expandoUp.src
	}
	return false;
}
function frmsubmitcheck(){
	return Docheck()
}
var g_oLearnMoreDlg;
function goLearnKeywords(){
	if (g_oLearnMoreDlg == null) {
		g_oLearnMoreDlg = window.showModelessDialog("LearnKeywords.asp",window,"help:no;status:no;resizable:no;dialogWidth:500px;dialogHeight:450px" );
	}
}
function selectlink(){
	var vLinks =parent.frames["eTOC"].document.links;
	var iLinksLen = vLinks.length;
	for(i = 0; i < iLinksLen; i++)
		vLinks[i].className = "";
	parent.frames["eTOC"].eOperatingSystems.className="selected";
}

</script>
</head>
<body onload="parent.eTOC.fnSyncTOC(window.location.href, -1, -1);sortlanguage('selLanguage','OSfind')" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">
<img id="expandoDown" src="/catalog/images/expando_primary_down_normal.gif" style="display:none">
<img id="expandoUp" src="/catalog/images/expando_primary_up_normal.gif" style="display:none">
<img id="expandoDownHover" src="/catalog/images/expando_primary_down_hover.gif" style="display:none">
<img id="expandoUpHover" src="/catalog/images/expando_primary_up_hover.gif" style="display:none">


<table cellpadding="0" cellspacing="0" border="0">

	<tr><td><span class="title sys-font-heading3 sys-rhp-color-title">Microsoft Windows</span></td></tr>
	<tr><td class="8pt sys-font-body sys-color-body">Localize actualizações para sistemas operativos Windows. Seleccione critérios abaixo e, em seguida, clique em <b>Procurar</b>.</td></tr>
	<tr><td height="11px"></td></tr>
	<tr><td>
		<form id="OSfind" name="OSfind" method="post" action="OSresult.asp" onsubmit="return frmsubmitcheck()">
		<input type="hidden" name="HSelLang" id="HSelLang" value="0">
		<table cellpadding="0" cellspacing="0" leftmargin="0" height="100%" class="tblborder sys-table-color-border sys-table-cell-bgcolor2" border="0">
			<tr><td>
				<table cellpadding="0" cellspacing="0" border="0" class="innertbl" height="100%" >
					<tr><td class="8pt sys-font-body sys-color-body" height="10em"><br></td></tr>
					<tr><td class="8pt sys-font-body sys-color-body">Sistema operativo:</td></tr>
					<tr><td class="8pt sys-font-body sys-color-body" height="2"><img src="/catalog/images/ts.gif" HEIGHT="2" WIDTH="1"></td></tr>
					<tr>
						<td class="8pt sys-font-body sys-color-body">
							<select NAME="selOS" ID="selOS" size="6">
								<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server.ver_suite_datacenter.3790..'><pre>IA64-bit ver of Windows Server 2003, DTC Family</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server.ver_suite_datacenter.3790.1.0'><pre>IA64-bit ver of Windows Server 2003, DTC SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server.ver_suite_enterprise.3790.1.0'><pre>IA64-bit ver of Windows Svr 2003 Enterprise SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server.ver_suite_enterprise.3790.1.0'><pre>IA64-bit ver of Windows Svr 2003 Standard SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server..3790..'><pre>IA64-bit version of Windows Server 2003 family</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server..3790.0.0'><pre>IA64-bit version of Windows Server 2003 RTM</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server..3790.1.0'><pre>IA64-bit version of Windows Server 2003 SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_server.ver_suite_datacenter.3790.0.0'><pre>IA64-bit version of Windows Server 2003, DTC RTM</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.ver_suite_enterprise.2195.0.0'><pre>Windows 2000 Advanced Server RTM</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.ver_suite_enterprise.2195.1.0'><pre>Windows 2000 Advanced Server SP1</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.ver_suite_enterprise.2195.2.0'><pre>Windows 2000 Advanced Server SP2</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.ver_suite_enterprise.2195.3.0'><pre>Windows 2000 Advanced Server SP3</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.ver_suite_enterprise.2195.4.0'><pre>Windows 2000 Advanced Server SP4</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.ver_suite_enterprise.2195.5.0'><pre>Windows 2000 Advanced Server SP5</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_workstation.n.2195.0.0'><pre>Windows 2000 Professional RTM</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_workstation.n.2195.1.0'><pre>Windows 2000 Professional SP1</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_workstation.n.2195.2.0'><pre>Windows 2000 Professional SP2</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_workstation.n.2195.3.0'><pre>Windows 2000 Professional SP3</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_workstation.n.2195.4.0'><pre>Windows 2000 Professional SP4</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_workstation.n.2195.5.0'><pre>Windows 2000 Professional SP5</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.n.2195.0.0'><pre>Windows 2000 Server RTM</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.n.2195.1.0'><pre>Windows 2000 Server SP1</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.n.2195.2.0'><pre>Windows 2000 Server SP2</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.n.2195.3.0'><pre>Windows 2000 Server SP3</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.n.2195.4.0'><pre>Windows 2000 Server SP4</pre></option>
<option value='ver_platform_win32_nt.5.0.x86.ver_nt_server.n.2195.5.0'><pre>Windows 2000 Server SP5</pre></option>
<option value='ver_platform_win32_nt.5.0.x86...2195.4.0'><pre>Windows 2000 SP4</pre></option>
<option value='ver_platform_win32_nt.5.0.x86...2195.5.0'><pre>Windows 2000 SP5</pre></option>
<option value='ver_platform_win32_windows.4.10.x86.....'><pre>Windows 98 and Windows 98 Second Edition</pre></option>
<option value='ver_platform_win32_windows.4.90.x86...3000..'><pre>Windows Millennium Edition</pre></option>
<option value='ver_platform_win32_nt.5.2.amd64.ver_nt_server.ver_suite_datacenter.3790.1.0'><pre>Windows Server 2003 Data Center x64 Edition</pre></option>
<option value='ver_platform_win32_nt.5.2.amd64.ver_nt_server.ver_suite_datacenter.3790..'><pre>Windows Server 2003 Data Center x64 Edition Family</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_datacenter.3790..'><pre>Windows Server 2003 Datacenter Edition Family</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_datacenter.3790.0.0'><pre>Windows Server 2003 Datacenter Edition RTM</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_datacenter.3790.1.0'><pre>Windows Server 2003 Datacenter Edition SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_enterprise.3790.0.0'><pre>Windows Server 2003 Enterprise Edition</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_enterprise.3790.1.0'><pre>Windows Server 2003 Enterprise Edition SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.amd64.ver_nt_server.ver_suite_enterprise.3790.1.0'><pre>Windows Server 2003 Enterprise x64 Edition</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server..3790..'><pre>Windows Server 2003 family</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server..3790.0.0'><pre>Windows Server 2003 RTM</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_smallbusiness_restricted.3790.0.0'><pre>Windows Server 2003 Small Business Server</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_smallbusiness_restricted.3790.1.0'><pre>Windows Server 2003 Small Business Server SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server..3790.1.0'><pre>Windows Server 2003 SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.n.3790.0.0'><pre>Windows Server 2003 Standard Edition</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.n.3790.1.0'><pre>Windows Server 2003 Standard Edition SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.amd64.ver_nt_server.n.3790.1.0'><pre>Windows Server 2003 Standard x64 Edition</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_blade.3790.0.0'><pre>Windows Server 2003 Web Edition</pre></option>
<option value='ver_platform_win32_nt.5.2.x86.ver_nt_server.ver_suite_enterprise.3790.1.0'><pre>Windows Server 2003 Web Edition SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.amd64.ver_nt_server..3790..'><pre>Windows Server 2003 x64 Edition Family</pre></option>
<option value='ver_platform_win32_nt.5.1.x86.ver_nt_workstation.ver_suite_personal.2600.0.0'><pre>Windows XP Home Edition RTM</pre></option>
<option value='ver_platform_win32_nt.5.1.x86.ver_nt_workstation.ver_suite_personal.2600.1.0'><pre>Windows XP Home Edition SP1</pre></option>
<option value='ver_platform_win32_nt.5.1.x86.ver_nt_workstation.ver_suite_personal.2600.2.0'><pre>Windows XP Home Edition SP2</pre></option>
<option value='ver_platform_win32_nt.5.1.ia64.ver_nt_workstation.n.2600..'><pre>Windows XP IA64-Bit Edition</pre></option>
<option value='ver_platform_win32_nt.5.1.ia64.ver_nt_workstation.n.2600.0.0'><pre>Windows XP IA64-Bit Edition RTM</pre></option>
<option value='ver_platform_win32_nt.5.1.ia64.ver_nt_workstation.n.2600.1.0'><pre>Windows XP IA64-Bit Edition SP1</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_workstation..3790..'><pre>Windows XP IA64-Bit Edition Version 2003 Family</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_workstation.n.3790.0.0'><pre>Windows XP IA64-Bit Edition Version 2003 RTM</pre></option>
<option value='ver_platform_win32_nt.5.2.ia64.ver_nt_workstation.n.3790.1.0'><pre>Windows XP IA64-Bit Edition Version 2003 SP1</pre></option>
<option value='ver_platform_win32_nt.5.1.x86.ver_nt_workstation.n.2600.0.0'><pre>Windows XP Professional RTM</pre></option>
<option value='ver_platform_win32_nt.5.1.x86.ver_nt_workstation.n.2600.1.0'><pre>Windows XP Professional SP1</pre></option>
<option value='ver_platform_win32_nt.5.1.x86.ver_nt_workstation.n.2600.2.0'><pre>Windows XP Professional SP2</pre></option>
<option value='ver_platform_win32_nt.5.2.amd64.ver_nt_workstation.n.3790.1.0'><pre>Windows XP Professional x64 Edition</pre></option>
<option value='ver_platform_win32_nt.5.1.x86.ver_nt_workstation..2600.2.0'><pre>Windows XP SP2</pre></option>
<option value='ver_platform_win32_nt.5.2.amd64.ver_nt_workstation..3790..'><pre>Windows XP x64 Edition Family</pre></option>

							</select>
						</td>
					</tr>
					<tr><td class="8pt sys-font-body sys-color-body" height="10em"></td></tr>
					<tr><td class="8pt sys-font-body sys-color-body">Idioma: </td></tr>
					<tr><td height="2"><img src="/catalog/images/ts.gif" HEIGHT="2" WIDTH="1"></td></tr>
					<tr>
						<td name="languagecont" id="languagecont" CLASS="8pt sys-font-body sys-color-body">
						<!--	<select NAME="selLanguage" ID="selLanguage">								<option VALUE="ar|1256">Árabe</option>								<option VALUE="en_arabic|1252">Árabe activado</option>								<option VALUE="zhcn|936">Chinês simplificado</option>								<option VALUE="zhtw|950">Chinês tradicional</option>								<option VALUE="cs|1250">Checo</option>								<option VALUE="da|1252">Dinamarquês</option>								<option VALUE="nl|1252">Holandês</option>								<option VALUE="en|1252" selected>Inglês</option>								<option VALUE="fi|1252">Finlandês</option>								<option VALUE="fr|1252">Francês</option>								<option VALUE="de|1252">Alemão</option>								<option VALUE="el|1253">Grego</option>								<option VALUE="el_ibm|869">Grego IBM</option>								<option VALUE="he|1255">Hebraico</option>								<option VALUE="en_hebrew|1252">Hebraico activado</option>								<option VALUE="hu|1250">Húngaro</option>								<option VALUE="it|1252">Italiano</option>								<option VALUE="ja|932">Japonês</option>								<option VALUE="nec|932">Japonês NEC</option>								<option VALUE="ko|949">Coreano</option>								<option VALUE="no|1252">Norueguês</option>								<option VALUE="pl|1250">Polaco</option>								<option VALUE="ptbr|1252">Português (brasileiro)</option>								<option VALUE="pt|1252">Português (padrão)</option>								<option VALUE="ru|1251">Russo</option>								<option VALUE="sk|1250">Eslovaco</option>								<option VALUE="sl|1250">Esloveno</option>								<option VALUE="es|1252">Espanhol</option>								<option VALUE="sv|1252">Sueco</option>								<option VALUE="en_thai|1252">Tailandês activado</option>								<option VALUE="tr|1254">Turco</option>							</select>-->
						</td>
					</tr>
					<tr><td class="8pt sys-font-body sys-color-body" height="10em"></td></tr>
					<tr><td valign="top"> <a onclick="showadv();return false;" class="10pt sys-font-heading4 sys-link-normal" href="/" onmouseOver="overchangeimage();" onmouseOut="outchangeimage();">Opções de procura avançadas <span id="exco" name="exco"><img id="expando" name="expando" src="/catalog/images/expando_primary_down_normal.gif"></span></a>
					<tr><td class="8pt sys-font-body sys-color-body" height="10em"></td></tr>
					<tr><td>
						<span id="advopt" name="advopt" class="advspan sys-table-color-border sys-rhp-bgcolor sys-table-cell-bgcolor1" style="display:none">
							<table CELLPADDING="0" CELLSPACING="0" BORDER="0" style="padding-left:5px;padding-right:5px">
								<tr><td class="8pt sys-font-body sys-color-body">Data de colocação na Web:</td></tr>
								<tr><td height="2"><img src="/catalog/images/ts.gif" HEIGHT="2" WIDTH="1"></td></tr>
								<tr>
									<td class="8pt sys-font-body sys-color-body">
										<select NAME="selPostedDate" ID="selPostedDate">
											<option value="0">Todas as datas de envio</option>
											<option value="7">Última semana</option>
											<option value="14">Últimas 2 semanas</option>
											<option value="30">Último mês</option>
											<option value="60">Últimos 2 meses</option>
											<option value="180">Últimos 6 meses</option>
											<option value="365">Último ano</option>
										</select>
									</td>
								</tr>
								<tr><td height="10em"></td></tr>
								<tr><td class="8pt sys-font-body sys-color-body"><nobr>Contém as seguintes palavras:&nbsp;&nbsp;
																<a class="sys-link-normal" href="javascript:goLearnKeywords()">Saber acerca de como utilizar palavras para limitar a procura</a></nobr></td></tr>
								<tr><td height="2"><img src="/catalog/images/ts.gif" HEIGHT="2" WIDTH="1"></td></tr>
								<tr>
									<td class="8pt sys-font-body sys-color-body">
										<input type="text" id="SText" name="SText" maxlength="100" size="65" oncontextmenu="checkrightclick()">
									</td>
								</tr>
								<tr><td height="10em"></td></tr>
								<tr><td class="8pt sys-font-body sys-color-body">Tipos de actualização:</td></tr>
								<tr><td class="8pt sys-font-body sys-color-body">
										<table width="100%">
											<tr>
											
														</tr><tr>
													<td class=8pt sys-font-body sys-color-body valign=top><table><tr><td width="20" valign=top><INPUT type=checkbox id=check0 name=check0 value='Critical Updates' checked></td><td class=8pt sys-font-body sys-color-body ><label for=check0>Actualiza&#231;&#245;es fundamentais e service packs</label></td></tr></table></td><td class=8pt sys-font-body sys-color-body valign=top><table><tr><td width="20" valign=top><INPUT type=checkbox id=check1 name=check1 value='Advanced Security Updates' checked></td><td class=8pt sys-font-body sys-color-body ><label for=check1>Actualiza&#231;&#245;es de seguran&#231;a avan&#231;adas</label></td></tr></table></td>
														</tr><tr>
													<td class=8pt sys-font-body sys-color-body valign=top><table><tr><td width="20" valign=top><INPUT type=checkbox id=check2 name=check2 value='Recommended Updates' checked></td><td class=8pt sys-font-body sys-color-body ><label for=check2>Actualiza&#231;&#245;es recomendadas</label></td></tr></table></td>
											</tr>
										</table></td>
								</tr>
							</table>
						</span>
					</td></tr>
				</table>
			</td></tr>
			<tr><td align="right" class="osbutton sys-table-header-bgcolor1">
				
				<button onclick="javascript:Docheck();" onresize="document.recalc('true')" style="width:expression(buttonspan.offsetWidth + 10)" id="button1" name="button1"><span id="buttonspan" name="buttonspan">Procurar</span></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
		<input type="hidden" name="lan" id="lan" value="pt">
		<input type="hidden" value="2" id="num" name="num">
		<!--<input type="hidden" value="" id="basketstring" name="basketstring">-->
		</form>
	</td></tr>
</table>

</body>
</html>