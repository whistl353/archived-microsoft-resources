<html >
<head>
<meta NAME="robots" CONTENT="noindex">
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'> 
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="../shared/css/content.css">
<title></title>



<style type="text/css">
<!--
	body { margin: 15px; }
	td { font-family: Verdana;font-size: 68.25%; }
	td a { font-weight:normal;text-decoration:none }
	hr {  color:gray;height:1px; }
	select { margin-top:5px; margin-bottom:5px;width:300px;}
	form { margin-top:0px; margin-bottom: 4px; }
	h4.clsHeader { color:gray;font-family:verdana; }
-->
</style>

<script language="javascript" src="../shared/js/content.js"></script>
<script language="javascript" defer="true">
<!--
function MatchSize() {
	var eFrm = document.forms["frmMan"];
	eFrm.selLang.style.width = eFrm.selLang.offsetWidth + 10
	eFrm.selOS.style.width = eFrm.selLang.offsetWidth;
	eFrm.selMan.style.width = tblDate.offsetWidth;
	tblSelLang.style.width = tblDate.offsetWidth;
}
function Docheck(){
	var selected=0
	if (frmMan.selOS.value == ""){
		alert('Please select an operating system/browser version.');
		return false;
	}
	else{
		document.frmMan.submit();
		return true;
	}
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
function window.onload(){
frmMan.speed.value=parent.g_iConnectionSpeed;
}
//-->
</script>
</head>
<body  onload="fnPositionCopyrightLink();"bgcolor="#ffffff" text="#000000">
<span class="title">Hardware Drivers - </span><br>
<div class="8pt">Narrow your search for driver updates by choosing a manufacturer. Then set the rest of your criteria below, and then click <b>Submit</b><br></div>
<br />
<form name="frmMan" id="frmMan" action="driverDetails.asp" onsubmit="return frmsubmitcheck()">
	<input type="hidden" name="hdnCat" value="" />
	<input type="hidden" name="lCat" value="" />
	<input type="hidden" name="clan" value="" />
	<input type="hidden" name="speed" id="speed">
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="tblborder">
		<tr><td>
		<table cellpadding="0" cellspacing="0" border="0" class="innertbl" height="100%">
				<tr>
					<td><img src="../images/ts.gif" height=5 width=1><br>
						<span id="spnDesc">Manufacturer name:</span><br>
						<span>
							<select name="selMan" size=6>
								
							</select>
						</span></td>
					</tr>
					<tr><td class="8pt">Operating system:</td></tr>
					<tr>
						<td>
							<select name="selOS" id="selOS">
								<option value="" selected>Choose an operating system</option>
								<option value='Whistler'>Windows XP</option>
								
							</select></td>
					</tr>
					<tr><td class="8pt">Language:</td></tr>
					<tr>
						<td>
							<select name="selLang" id="selLang">
								<option VALUE="ar|1256">Arabic</option>
								<option VALUE="en_arabic|1252">Arabic enabled</option>
								<option VALUE="zhcn|936">Chinese Simplified (PRC)</option>
								<option VALUE="zhtw|950">Chinese Taiwan (Trad.)</option>
								<option VALUE="cs|1250">Czech</option>
								<option VALUE="da|1252">Danish</option>
								<option VALUE="nl|1252">Dutch</option>
								<option VALUE="en|1252" selected>English</option>
								<option VALUE="fi|1252">Finnish</option>
								<option VALUE="fr|1252">French</option>
								<option VALUE="de|1252">German</option>
								<option VALUE="el|1253">Greek</option>
								<option VALUE="el_ibm|869">Greek IBM</option>
								<option VALUE="he|1255">Hebrew</option>
								<option VALUE="en_hebrew|1252">Hebrew enabled</option>
								<option VALUE="hu|1250">Hungarian</option>
								<option VALUE="it|1252">Italian</option>
								<option VALUE="ja|932">Japanese</option>
								<option VALUE="nec|932">Japanese NEC</option>
								<option VALUE="ko|949">Korean</option>
								<option VALUE="no|1252">Norwegian</option>
								<option VALUE="pl|1250">Polish</option>
								<option VALUE="ptbr|1252">Portuguese (Brazilian)</option>
								<option VALUE="pt|1252">Portuguese (Standard)</option>
								<option VALUE="ru|1251">Russian</option>
								<option VALUE="sk|1250">Slovak</option>
								<option VALUE="sl|1250">Slovenian</option>
								<option VALUE="es|1252">Spanish</option>
								<option VALUE="sv|1252">Swedish</option>
								<option VALUE="en_thai|1252">Thai enabled</option>
								<option VALUE="tr|1254">Turkish</option>
							</select></td>
					</tr>
					<tr><td class="8pt">Date posted to the Web:</td></tr>
					<tr>
						<td>
							<select id="selPostDate" name="selPostDate">
								<option value="0">All posted dates</option>
								<option value="7">Past week</option>
								<option value="14">Past 2 weeks</option>
								<option value="30">Past month</option>
								<option value="60">Past 2 months</option>
								<option value="180">Past 6 months</option>
								<option value="365">Past year</option>
							</select></td>
					</tr>
					<tr>
						<td>
							Contains these words:&nbsp;&nbsp;
							<a href="javascript:goLearnKeywords()">Tell me about using words to limit my search</a></td>
					</tr>
					<tr>
						<td class="8pt">
							<input type="text" name="eKeyWord" SIZE=60 maxlength=100 oncontextmenu=checkrightclick()></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr >
						<td align="right" class="osbutton" valign=middle>
							<!--<button onclick="history.go(-1);">&lt;&nbsp;Back</button>-->
							
							<button accesskey="S" onClick="javascript:Docheck()"onresize="document.recalc('true')" style="width:expression(buttonspan.offsetWidth + 10)"><span id="buttonspan" name="buttonspan"><u>S</u>ubmit</span></button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<div>
<a href="http://www.microsoft.com/misc/cpyright.htm" target="_blank" id="eCopyright">� 2001 Microsoft Corporation. All rights reserved.</a>
</div>
</body>
</html>
<script language="javascript">

function window::onResize() {
	fnPositionCopyrightLink()
}
function window::onload(){
	document.oncontextmenu = new Function("return false;");
}
function checkrightclick(){
event.cancelBubble=true;
return true;
}
function fnPositionCopyrightLink(){
	eCopyright.style.position = "static";
	var tmr = window.setTimeout("fnPCL()",1000);
	eCopyright.style.display = "none";
}
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
</script>