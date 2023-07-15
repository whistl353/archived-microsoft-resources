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


		<script language="JScript" type="text/javascript">
			function fnPingback() {

				var errnumber = 0;
				var pingbackURL2 = "http://v5stats.windowsupdate.microsoft.com/v5sitereporting/report.aspx";
				var longerrnumber = "-1914896384";

				if ((errnumber != 15) && (errnumber != 16)) {
					var queryString;
					//var pingbackURL = "http://supportstats.windowsupdate.com/v5track.bin"; 
					//queryString = "?v5_rc1_1825_err=0x" + errnumber; 
					//pingback.location.replace(pingbackURL + queryString);

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

					if (parent.g_bControlInitialized == true){
			  
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
					"&spmin=" + iOSServicePackMinorNumber ; 

					pingback2.location.replace(pingbackURL2 + queryString);
				}
			}
		</script>





</head>
<body onload="fnPingback();if(self != top && 'function' ==  typeof(fnInit)) fnInit(0, 0);">
	
		<table id="SPBnr" cellpadding=0 cellspacing=0 border=0 style="position:relative;left:-16;top:-10;">
			<tr height=40>
				<td align="left" valign="top" height=40 width=300><img src="shared/images/Banners/en/Hdr_ErrorPages.jpg"></td>
				<td align="left" valign="top" height=40 width=100% style="background-image:url(shared/images/Hdr_Shrt_Middle.jpg);background-repeat:repeat-x">&nbsp;</td>
				<td align="left" valign="top" height=40 width=32><img src="shared/images/Hdr_Shrt_Right.jpg"></td>  
			</tr>
		</table>
	
			
	<br>
	
				<div style = "text-align: right;color: gray;padding-bottom :10px ">
			[Error number: 0x8DDD0000]
	</div>
	
	<table border="0" width="100%">
	<tr>
	   <td width="20" valign="top">
			<img src="shared/images/warning.gif" alt="Error Icon" width="16" height="16" ><span class="sys-font-heading3 sys-rhp-color-title"></span>
		</td>
		<td width=100% valign="top">
		Windows Update has encountered an error and cannot display the requested page. You may find the following resources helpful in resolving the problem:
		<p>For self-help options:
		<ul>
		<li><a class="sys-link-normal" target="_blank" HREF="http://go.microsoft.com/fwlink/?linkID=25127">Windows Update Response Center</a><br>
		<li><a class="sys-link-normal" target="eContent" HREF="troubleshoot.aspx?ln=en">Windows Update Troubleshooter</a><br><li><a class="sys-link-normal" target="_blank" HREF="http://go.microsoft.com/fwlink/?linkID=9581">Windows Update Newsgroups</a>  
		</ul>
		<p>  For assisted support options:  
		<ul>
		<li><a class="sys-link-normal" target="_blank" HREF="http://go.microsoft.com/fwlink/?linkID=21608">Microsoft Online Assisted Support</a> (no-cost for Windows Update issues)
		</ul>
		 
		</td>
	</tr>
	</table> 
	<IFRAME ID="pingback" src="blank.aspx" HEIGHT=0 WIDTH=0></IFRAME> 
	<IFRAME ID="pingback2" src="blank.aspx" HEIGHT=0 WIDTH=0></IFRAME> 
	<br>
	<br>
	<iframe name='eReporting' src='blank.aspx' noresize='yes' height='0px' width='0px' style='display:none;' />
</body>
