
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
</script><html >
<head>
<meta NAME="robots" CONTENT="noindex">
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'> 
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="../shared/css/content.css">
<script language="jscript">
function selectlink(){
	var vLinks =parent.frames["eTOC"].document.links;
	var iLinksLen = vLinks.length;
	for(i = 0; i < iLinksLen; i++)
		vLinks[i].className = "";
	parent.frames["eTOC"].eHardwareDrivers.className="selected";
}
</script>
<title></title>

</head>
<body onLoad="fnPositionCopyrightLink();selectlink()" bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td class="title">
			Hardware Drivers</td>
	</tr>
	<tr>
		<td class="8pt">
			Pick a hardware category, and search for the latest updates to keep your devices working properly.</td>
	</tr>
</table>
<img src="../shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="../images/ts.gif" width="25" height="1"></td>
		<td><img src="../images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Display&amp;clan=en&amp;lcat=Video">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Video</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				TV-Video cards, DVD decoder, AGP, ISA, 2-D/3-D cards...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Audio&amp;clan=en&amp;lcat=Sound">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Sound</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				PC card, sound card, speakers...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Printer&amp;clan=en&amp;lcat=Printers">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Printers</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				Laser-jet, ink-jet, dot-matrix, accessories...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Modem/Analog&amp;clan=en&amp;lcat=Modems">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Modems</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				Internal, external, wireless, PC card...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Imaging&amp;clan=en&amp;lcat=Cameras">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Cameras</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				Digital, Web Cam, camcorder...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Imaging&amp;clan=en&amp;lcat=Scanners">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Scanners</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				Flatbed, optical, multifunction device, slide...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Monitor&amp;clan=en&amp;lcat=Monitors">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Monitors</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				15-inch, 17-inch, 19-inch, 20-inch, LCD...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Network/Lan&amp;clan=en&amp;lcat=Networking">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Networking</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				LAN, ISDN, GSM IrDA, RF, xDSL, CM...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Input/Game&amp;clan=en&amp;lcat=Input Devices">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Input Devices</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				Mouse, keyboard, game controllers, joysticks...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Storage/SCSI Controller&amp;clan=en&amp;lcat=Storage">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Storage</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				CD-ROM drive, DVD-ROM drive, EIDE, USB, internal or external hard disk...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt">
				<a href="HardUpdates.asp?cat=Miscellaneous&amp;clan=en&amp;lcat=Computers">
				<img src="../shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Computers</b></a></td>
		</tr>
		<tr><td><img src="../shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt">
				Desktop, server, portable, PDA...</td>
		</tr>
	
</table>
<div>
<a href="http://www.microsoft.com/misc/cpyright.htm" target="_blank" id="eCopyright">© 2001 Microsoft Corporation. All rights reserved.</a>
</div>
</body>
</html>