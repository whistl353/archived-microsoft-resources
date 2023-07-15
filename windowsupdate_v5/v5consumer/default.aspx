<html dir='ltr'>
<head>
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))' /> 
<meta http-equiv='Content-Type' content='text/html;charset=windows-1252' />
<meta http-equiv='MSThemeCompatible' content='yes' />
<title>Microsoft Update</title>
<link rel='shortcut icon' href='shared/images/bannersmu/favicon.ico' type='image/x-icon'/>
<meta name='MSSmartTagsPreventParsing' content='yes' />
<meta name='ROBOTS' content='NOINDEX'>
<!--Copyright (c) Microsoft Corporation.  All rights reserved.-->
<script language='javascript' type='text/javascript'>
window.onerror = new Function('Message' ,'sURL' ,'sLine' , 'return true;')
</script>
<script language='JScript' type='text/javascript' src='shared/js/tgar.js?633548122928057783'></script>
<script language='JScript' type='text/javascript' src='shared/js/content.js?633548122928057783'></script>
<link rel='stylesheet' type='text/css' href='shared/css/hcp.css' />
<link rel='stylesheet' type='text/css' href='shared/css/content.css' />
<style type='text/css'>button {padding: 0px 14px 1px 14px;width: 80px;height: 21px;overflow: visible;line-height: 15px;cursor: default;}</style>

		<script language="JScript" type="text/javascript">
			var WGAErr = 0
			
			
			if (WGAErr > 0)
			{
				window.setTimeout("fnDoReporting('" + window.location.pathname + "')",1000);
			}
			var sSelfUpdateURL = 'http://update.microsoft.com/windowsupdate/v6/selfupdate.aspx';

			function fnContinue(){
				var iRadioCount, iRadioValue, sFinishUrl, sQuerystring = "";	
				var iRadioLength =document.forms[0].ResolSelect.length;		
				for (iRadioCount = 0; iRadioCount<iRadioLength; iRadioCount++)
				{
					if (document.forms[0].ResolSelect[iRadioCount].checked)
					{
						iRadioValue = document.forms[0].ResolSelect[iRadioCount].value;
					}
				}		
				if(iRadioValue == 0){
					sFinishUrl = window.parent.location.href;
					sFinishUrl = sFinishUrl.toLowerCase();
					iReturnURLIndex = sFinishUrl.indexOf("returnurl")
					if(iReturnURLIndex > 0) sFinishUrl = parent.g_sReturnUrl;
					while(sFinishUrl.indexOf("&") > -1)
					{
						sFinishUrl = sFinishUrl.replace("&","|@|");
					}
					location.href = sSelfUpdateURL + "?ln=en&ReReg=true" + "&finishurl=" + sFinishUrl;
					
				} else {
					location.href = "troubleshoot.aspx?err=0x8DDD000F&ln=en";
				}

			}
			function fnPingback() {

				var errnumber = 15;
				var pingbackURL2 = "http://stats.update.microsoft.com";
				if(pingbackURL2.length == 0) return false;
				var longerrnumber = "-1914896369";

				if ((errnumber != 15) && (errnumber != 16)) {
					var queryString;
					

					var oDate;
					var sEventID = 620;// – 620 = site error, 601 = Tshoot Yes, 602 = Tshoot No.
					var sEventNamespaceID = 3;// – 3
					var sTimeAtTarget;// – Client time
					var sUpdateId;// another ssite identifier
					var sWin32HResult;// - decimal error number
					var sAppName = "SiteEvent";// – This is currently an nvarchar(256) which seems expensive given the data
					var sComputerID = "";
					var iOSMajorVersion = 0;
					var iOSMinorVersion = 0;
					var iOSBuildNumbe = 0;
					var iOSServicePackMajorNumber = 0;
					var iOSServicePackMinorNumber = 0;
					var sOSLocale;
					var sProcArch;
					var iOSBuildNumber = 0;
					var iOSServicePackBuildNumber = 0;					
					var iSuiteMask = 0;
					var iProductType = 0;
					var sClientVersion = 0;

					if (parent.g_bControlInitialized == true)
					{
					
						iOSServicePackBuildNumber = parent.g_iOSServicePackBuildNumber; 
						iSuiteMask = parent.g_iSuiteMask;
						iProductType = parent.g_iProductType;
						sClientVersion = parent.g_sClientVersion
			  
						iOSMajorVersion = parent.g_iOSMajor; //osMajor = 5
						iOSMinorVersion = parent.g_iOSMinor; //osMinor = 2
						iOSServicePackMajorNumber = parent.g_iOSSPMajor; //spMajor = 0
						iOSServicePackMinorNumber = parent.g_iOSSPMinor; //spMinor = 0
						iOSBuildNumber = parent.g_sOSBuildNumber; //osBuildNumber = 3790

					}
					else {

						var UA = navigator.userAgent.toLowerCase();
						if(UA.indexOf("windows nt 5.0") > 0){
							iOSMajorVersion = 5;
							iOSMinorVersion = 0;
						}
						else if(UA.indexOf("windows nt 5.1") > 0){

							iOSMajorVersion = 5;
							iOSMinorVersion = 1;
						}
						else if(UA.indexOf("windows nt 5.2") > 0){

							iOSMajorVersion = 5;
							iOSMinorVersion = 2;
						}
						else {
							iOSMajorVersion = 0;
							iOSMinorVersion = 0;
						}
					}

					switch (navigator.cpuClass.toLowerCase()){
						case "x86":
							sProcArch = "X86Compatible";
							break;
						case "ia64":
							sProcArch = "IA64Compatible";
							break;
						case "amd64":
							sProcArch = "Amd64Compatible";
							break;
						default: 
							sProcArch = "Unknown";
					}
					sOSLocale = parent.conLangCode;
					oDate = new Date();
					sTimeAtTarget =  oDate.getFullYear() + "/" + (oDate.getMonth() + 1) + "/" + oDate.getDate() + "-" + oDate.getHours() + ":" + oDate.getMinutes();
					sUpdateId = "12345678-1234-1234-1234-123456789123";
					sWin32HResult = longerrnumber; 

					queryString = "?error=" + sWin32HResult + "&eventid=" + sEventID + 
					"&timeattarget=" + sTimeAtTarget + "&appname=" + sAppName + 
					"&updateid=" + sUpdateId +
					"&loc=" + sOSLocale + "&procarc=" + sProcArch + 
					"&osvermaj=" + iOSMajorVersion + "&osvermin=" + iOSMinorVersion + 
					"&build=" + iOSBuildNumber + "&spmaj=" + iOSServicePackMajorNumber + 
					"&spmin=" + iOSServicePackMinorNumber + 
					"&spbuild=" + iOSServicePackBuildNumber +
					"&suitemask=" + iSuiteMask +
					"&prodtype=" + iProductType +
					"&clientver=" + sClientVersion ;

					pingback2.location.replace(pingbackURL2 + queryString);
				}
			}
			
			function window.onload(){
				fnPingback();
				if(self != top && 'function' ==  typeof(fnInit)) fnInit(0, 15);			
				if("undefined" != typeof(errTD) )errTD.focus();
			}
		</script>





</head>
<body >
	 
		<table id="SPBnr" cellpadding=0 cellspacing=0 border=0 style="position:relative;left:-16;top:-10;">
			<tr height=40>
				<td align="left" valign="top" height=40 width=394><img src="shared/images/bannersmu/en/information.jpg"></td>
				<td align="left" valign="top" height=40 width=100% style="background-image:url(shared/images/banner-bg.jpg);background-repeat:repeat-x">&nbsp;</td>
				<td align="left" valign="top" height=40 width=158><img src="shared/images/bannersmu/en/banner-right.jpg"></td>  
			</tr>
		</table>
	
	
	<table cellpadding=0 cellspacing=0 border=0 >
		<tr height="0">
			<td width="560"></td>
			<td width="100%"></td>
		</tr>
		<tr><td colspan="2" width="100%" id="errTD">		
			<br>
			
						<div style = "text-align: right;color: gray;padding-bottom :10px ">
					[Error number: 0x8DDD000F]
			</div>
			
			<table border="0" width="100%">
			<tr>
			<td width="20" valign="top">
								
					<img src="shared/images/warning.gif" alt="See which updates failed to install" width="16" height="16" ><span class="sys-font-heading3 sys-rhp-color-title"></span>
								
				</td>
				<td width=100% valign="top">
				HTTP Error 404 - File or directory not found.<br>
			<br>
			Cannot find the page you are looking for. It might have been removed, had its name changed, or is temporarily unavailable. <br>
			<br>
			<br>
			Please try the following:<br>
			<ul style='margin-left = 40'>
			<li>Ensure that the Web site address displayed in the address bar of your browser is spelled and formatted correctly.</li>
			<li>If you reached this page by clicking a link, contact the Web site administrator to alert them that the link is incorrectly formatted.</li>
			<li>Click the <a href="javascript:history.back(1)">Back</a> button to try another link.</li>
			</ul>
			<br>
				</td>
			</tr>
			</table>
		</td></tr>
	</table>
	
	<IFRAME ID="pingback2" src="blank.aspx" HEIGHT=0 WIDTH=0></IFRAME> 
	<br>
	<br>
	
	<iframe name='eReporting' src='blank.aspx' noresize='yes' height='0px' width='0px' style='display:none;' />
</body>
