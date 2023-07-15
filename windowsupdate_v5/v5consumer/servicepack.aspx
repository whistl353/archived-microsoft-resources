<html dir='ltr'>
<head>
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))' /> 
<meta http-equiv='Content-Type' content='text/html;charset=windows-1252' />
<meta http-equiv='MSThemeCompatible' content='yes' />
<title>Microsoft Windows Update</title>
<meta name='MSSmartTagsPreventParsing' content='yes' />
<meta name='ROBOTS' content='NOINDEX'>
<!--Copyright (c) Microsoft Corporation.  All rights reserved.-->
<script language='JScript' type='text/javascript' src='shared/js/tgar.js'></script>
<script language='JScript' type='text/javascript' src='shared/js/content.js'></script>
<link rel='stylesheet' type='text/css' href='shared/css/hcp.css' />
<link rel='stylesheet' type='text/css' href='shared/css/content.css' />
 
<script language="javascript">
	var iUpdate = parent.g_iSPPresentIndex; 
	function fnDisplaySP() {
		var oUpdate = parent.g_UpdateCol(iUpdate);
		var aUpdate = parent.g_aUpdate[iUpdate];
		parent.eTOC.eHidden.onclick = null;
		parent.eTOC.fnEnableLink(parent.eTOC.eHidden, false);
		parent.eTOC.fnLinkSelect(parent.eTOC.eBasketUpdates);
		var sTitle = parent.fnSanitize(oUpdate.Title);
		title1.innerText = title2.innerText = title3.innerText = sTitle;
		if(parent.g_bSPAU){
			SPAU.style.display = "block";
			return;
		}
		SPInstall.style.display = "block";
		if(parent.g_bSPCoolOff){
			initalCoolOffText.style.display = "block";
			install.disabled = true;
		}else{		
			initalText.style.display = "block";
			SPDiv.style.display = "block";
			if(aUpdate.IsHidden) {
				Why.style.display = "block";
			}			
			var sUpdateDescription = parent.fnSanitize(oUpdate.Description);
			var sUpdateDetails = "&nbsp;&nbsp;<a href='javascript:fnDisplaySPDetails(\"" + iUpdate + "\");' style='color:blue;text-decoration:underline' >" + parent.L_RListReadMore_Text + "</a>";

			var	vSize = aUpdate.Size;
			if (vSize == null) {
				vSize = "1000";
			}
			var iSize = parseInt(vSize);
			var sSizeText = parent.fnGetDownloadSizeText(iSize,aUpdate.DownloadSec);
			if(iSize == 0) {
				sSizeText += "&nbsp;<img src='shared/images/info_16x.gif' title='" + parent.L_RListInfoGifAlt_Text + "'>";
			}

			var	str = "<div class='gradGray' style='margin-top:8px;margin-bottom:-5px;'></div><div style='padding:3px' class='gradYellow'>" + "Download size: " + sSizeText + "<div class='update'>" + sUpdateDescription;
			str += sUpdateDetails + "</div></div>" + "<div class='gradGray' style='margin-top:2px;margin-bottom:-5px;'></div><br>" ; 
			SPDiv.innerHTML = str;
			
		}
	}

	function fnDisplaySPDetails(iUpdate) {
		parent.fnTrace("fnDisplayDetails");
		var sWindowName = "window" + iUpdate;
		var sURL= "itemdetails.aspx?iPage=0&index=" + iUpdate + "&"  +  parent.conQueryString;
		window.open(sURL, sWindowName, "directories=no,width=400,height=400,location=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes,top = 100,left = 100");
	}
	function fnInstallSP() {
		parent.fnInstallUpdates(iUpdate);
	}
	function fnCDSP(){		
		window.open("http://go.microsoft.com/fwlink/?LinkId=32115", "orderCD");
	}
	function fnRescanSP() {
		parent.g_bSPMode = true;
		parent.fnInitScan();
	}

</script>
</head>
<body onLoad="fnDisplaySP()">

<table id="SPBnr" cellpadding=0 cellspacing=0 border=0 style="position:relative;left:-16;top:-10;">

	<tr>
		<td align="left" valign="top" height=40 width=170><img src="shared/images/SP2_banner.jpg"></td>
		<td align="left" valign="top" height=40 width=100% style="background-color:#0067a1">
		<nobr><div style="font-size:16px;color:#ffffff;padding-left:20px;">			
		<b>Windows XP Service Pack 2<br>with Advanced Security Technologies</b></div></nobr></td>
	</tr>
</table>
<br />
<div >
	<p>To help protect your computer, Microsoft strongly recommends that you install <span id="title1"></span>
	. Learn more about <a href="http://go.microsoft.com/fwlink/?LinkId=26348" target="_blank" class="sys-link-normal">what’s new for security in SP2</a>.	
	<br/><br/>
	<div id="Why" style="display:none;">
		<div style="padding:3px;border:1px solid #CECECE;background-color:#ffffce">
			<table cellpadding=5 cellspacing=0 border=0>
				<tr><td width=23 align="left" valign="top">
					<img src="shared/images/info_16x.gif"></td>
					<td align="left" valign="top">
					<b>Why am I being offered an update that I have previously hidden?</b><br />
					<span id="title2"></span>&nbsp; is an important update to help ensure customers stay secure and up-to-date. Microsoft highly recommends installing this update. </td>
				</tr>
			</table>
		</div><br />
	</div>
	<div id="SPInstall" name="SPInstall" style="padding-left:20px;display:none">
		<table cellpadding=0 cellspacing=0 border=0>
			<tr><td	width="60%"	align="left" valign="bottom">
					<span  style="display:none;" id="initalCoolOffText" name ="initalCoolOffText" ><b>Download and install it now &nbsp;<span style='color:red'>- Currently not available</span> </b>&nbsp; <img src='shared/images/warning_icon.gif'>
					<br>We are currently experiencing a high level of demand for Windows XP Service Pack 2, so please check back later for availability. We apologize for any inconvenience.  If you prefer to obtain SP2 another way, the easiest way to get Service Pack 2 is to turn on the Automatic Updates feature in Windows XP and it will be downloaded when you are connected to the Internet without you having to take any further action (<a class="sys-link-normal" href="http://go.microsoft.com/fwlink/?linkID=33177" target="_new">how does Automatic Updates work?</a>). You also can <a class="sys-link-normal" href="http://go.microsoft.com/fwlink/?linkID=32115" target="_new">order SP2 on a CD</a>.
	
					</span>
					<span style="display:none;" id="initalText" name ="initalText" ><b>Download and install it now</b><br>
		<ul><li>You can use other programs while you wait. If the download is interrupted, it will resume the next time you    connect to Windows Update. </li>
		<li>You can also <a  class="sys-link-normal" href="http://go.microsoft.com/fwlink/?linkID=33177" target=”_new”>enable Automatic Updates</a> to download it for you or <a class="sys-link-normal" href="http://go.microsoft.com/fwlink/?linkID=32115" target ="_new">order SP2 on CD</a></li>
		<li><a href="http://go.microsoft.com/fwlink/?LinkId=26347" target="_blank" class="sys-link-normal">What to know before installing…</a></li>
		</span>
					
					</td>
				<td width="40%" align="right" valign="top">
					<button id="install" name="install" style="width:220" onclick="fnInstallSP();">Download and Install Now</button></td>
			</tr>
		</table>		
		<div id="SPDiv" style="display:none" ></div>
		
	</div>
	<div id="SPAU" style="padding-left:20px;display:none"><b>Download and install it using Automatic Updates</b><br/>
If you have Automatic Updates turned on, you don’t need to take any further action for SP2 to be downloaded to your computer while you are connected to the Internet. Depending on how long and how often you are connected to the Internet, it may take awhile before SP2 is fully downloaded. Once SP2 is completely downloaded from the Internet, you will be notified that it is ready to be installed on your computer. You can check your Automatic Updates setting on the <a class="sys-link-normal" href="default.aspx" target="_new">Windows Update home page</a> or by following the instructions on the <a class="sys-link-normal" href="http://go.microsoft.com/fwlink/?linkID=33177" target="_new">Get computer updates</a> page on the Microsoft Protect Your PC website.  
<br/><br/>
Automatic Updates is the only way to download SP2 from Windows Update at this time. Other methods to install SP2 will be available soon.<br/><br/> </div>
	<hr style="color:#CECECE;height:2px;"><br />	
	<div style="padding-left:20px;">
		<table cellpadding=0 cellspacing=0 border=0>
			<tr><td	width="60%" align="left" valign="top">
					<b>Review and install other updates</b><br />
					If you do not install <span id="title3"></span>, other updates might still apply to your computer.</td>			
				<td width="40%" align="right" valign="top">
					<button style="width:220" onclick="fnRescanSP();">Review Other Updates</button></td>
			</tr>
		</table>
	</div>
	<P>
	<hr style="color:#0067a1;height:2px;"><br />
	</P>
</div>	
<iframe name='eReporting' src='blank.aspx' noresize='yes' height='0px' width='0px' style='display:none;' />
</body>
</html>
