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
 
<script language="JScript" type="text/javascript" src="shared/js/personalize.js"></script>
<script language ="javascript">
	var sLan = "Arabic@|Chinese (Simplified)@|Chinese (Traditional)@|Chinese (Hong Kong S.A.R.)@|Czech@|Danish@|Dutch@|English@|Finnish@|French@|German@|Greek@|Hebrew@|Hungarian@|Italian@|Japanese@|Korean@|Norwegian@|Polish@|Portuguese (Brazil)@|Portuguese (Portugal)@|Russian@|Spanish@|Swedish@|Turkish"
	var sRecommended = "(Recommended)"
	var sLN = "";
</script>
</head>
<body onload="fnInitPersonalization(13, -1);" onclick="fnUpdatePersonalization();" onbeforeunload="fnUnloadPersonalization();" class="personalization">
	<span class="sys-font-heading3 sys-rhp-color-title">
		Settings for Windows Update
	</span><br>	
	<br>
	<hr style="color:#cccccc;height:3px">
	<b>Language</b> <br /><br/>
	Windows Update displays Web pages in the same language you use to view Windows. You can change the language you use to view Windows Update, but some pages might display information in more than one language.
		<p>
		<b>Important:</b>  If you change the recommended language setting,  <b>you must install the corresponding language pack for Internet Explorer</b>.
	<br>
	<br>
	<div id="LanDiv"></div>
	<br>
	<hr style="color:#cccccc;height:3px">
	<b>Advanced</b> <br />
	<input type="checkbox" id="eBetaLink" class="checkbox"><label for="eBetaLink">Show beta products and related updates</label><br>
	Windows Update can offer you pre-released "beta" versions of products as they become available.
	<br><br>
	<div >NOTE: Use beta software at your own risk; it is intended for testing and evaluation purposes only. Do not install beta software on your primary computer or production environment.</div>
	<br /> 
	<hr style="color:#cccccc;height:3px">

	<button id="eSaveSettings" onclick="fnSaveSettings();" disabled type="button">
		Apply changes now
	</button>
	<iframe name='eReporting' src='blank.aspx' noresize='yes' height='0px' width='0px' style='display:none;' />
</body>
