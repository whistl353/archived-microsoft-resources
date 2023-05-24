
<html dir="ltr">
	<head>
		<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))' />
		<meta http-equiv="Content-Type" content="text/html;charset=windows-1252" />
		<meta http-equiv="MSThemeCompatible" content="yes" />
		<meta name="MSSmartTagsPreventParsing" content="yes" />
		<script language="JScript" type="text/javascript">function window.onerror(sMessage, sURL, sLine){ return true; }</script><script language="JScript" type="text/javascript" src="/shared/js/dialog2.js"></script><link rel="stylesheet" type="text/css" href="/shared/css/hcp.css" />
		<link rel="stylesheet" type="text/css" href="/shared/css/dialog2.css" />
		
		<title>Windows Update</title>
	</head>
	<body onload="fnInitDialog(10);" class="progress">
		<table cellspacing="0">
			<tbody>
				<tr>
					<td class="pageIcon"><img src="/shared/images/install.gif" /></td>
					<td id="eWindowMessage">Windows Update is downloading the updates to be installed on your computer. Please wait.</td>
				</tr>
			</tbody>
		</table>
		<div class="progressDetails">
			<table cellspacing="0">
				<colgroup>
					<col class="left" />
					<col class="right" />
				</colgroup>
				<tbody>
					<tr><td id="eStatusMessage" colspan="2">Preparing to download...</td></tr>
					<tr><td nowrap="true">Download progress:</td><td id="eDownloadSize" nowrap="true" dir="ltr">&nbsp;</td></tr>
					<tr><td colspan="2" class="progressBar"><div id="eDownloadProgress"></div></td></tr>
					<tr><td id="eDownloadTimeText" nowrap="true">Download time remaining:</td><td id="eDownloadTime" style="padding-bottom: 12px;" nowrap="true">&nbsp;</td></tr>

					<tr><td>Install progress:</td><td>&nbsp;</td></tr>
					<tr><td colspan="2" class="progressBar"><div id="eInstallProgress"></div></td></tr>

				</tbody>
			</table>
		</div>
		<div style="text-align: center;">
			<button id="eCancelButton" onclick="window.close();">Cancel</button>
		</div>
	</body>
</html>