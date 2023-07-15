<html dir='ltr'>
<head>
<meta http-equiv='pics-label' content='(pics-1.1 'http://www.icra.org/ratingsv02.html' comment 'Single file v2.0' l gen true for 'http://windowsupdate.microsoft.com'  r (nz 1 vz 1 lz 1 oz 1 cz 1) 'http://www.rsac.org/ratingsv01.html' l gen true for 'http://windowsupdate.microsoft.com'  r (n 0 s 0 v 0 l 0))' />
<meta http-equiv='Content-Type' content='text/html;charset=windows-1252' />
<meta http-equiv='MSThemeCompatible' content='yes' />
<title>Microsoft Windows Update</title>
<meta name='MSSmartTagsPreventParsing' content='yes' />
<script language='JScript' type='text/javascript' src='shared/js/content.js'></script>
<link rel='stylesheet' type='text/css' href='shared/css/hcp.css' />
<link rel='stylesheet' type='text/css' href='shared/css/content.css' />

<script language='JScript' type='text/javascript' src='shared/js/history.js'></script>
<script language='JScript' type='text/javascript' src='shared/js/tempdata_vikas.js'></script>
</head>
<body  class="history"  onloadComment = "fnInitHistory(4,-1);">
	<table id="tbHistory" border="0" cellspacing="0" style="height:84%;width:97%;display:none">
			<tbody>
				<tr>
					<td id="Title" style="height:80px;vertical-align:top;" >
						<div id="eNoUpdatesAvailable" style="display:none;height:80px;overflow:auto">
							<span class="sys-font-heading3 sys-rhp-color-title">View Installation History</span><br /><br/> 
								Keep track of what you've installed from Windows Update.<br /><br />
								<b>You have not installed any updates.</b><br />
						</div> 
						<div id="eUpdatesAvailable" style="display:none;height:80px;overflow:auto">
							<span class="sys-font-heading3 sys-rhp-color-title">View Installation History</span><br /><br/>  
							You can view the history of your update installations. To see the updates you’ve installed, go to Add and Remove Programs.<br /><br />
							<!--<b><b>Note:</b></b> The items listed on this page reflect only the actions you've performed on Windows Update. If you have subsequently restored your computer, or reinstalled or uninstalled programs, some items listed here might no longer be installed on your computer.<br /><br /> -->
						</div> 
					</td>
				</tr>
				<tr><td style="height:30px;text-align:right;vertical-align:middle;padding-right:12px;"><a id="ePrint" href="javascript:window.print();" class="sys-link-normal"><img align="absmiddle" style="width:20px;padding-right:20px;" src="shared/images/print.gif" /><span style="padding:1px;"></span>Print</a></td></tr>
				<tr> 
					<td id="eSortTableHeaderContainer" style="background-color:#6681D9;" >
						<table cellspacing="0" class="sys-table-header-bgcolor1"  >
							<colgroup>
								<col style="width: 35%;" />
								<col style="width: 19%;" />
								<col style="width: 25%;" />
								<col style="width: 21%;" />
							</colgroup>
							<tbody id="eSortTableHeader" firstrow="0" applystyles="false">
								<tr>
									<td nowrap="1"><a href="" onclick="fnSortTable(0);fnHighlightCells(0);return false;" title="" class="sys-table-color-border sys-font-body-bold">Update Name<img id="eCol0" src="/consumer/shared/images/sortTableD.gif"</a></td>
									<td nowrap="1" style="border-left: 1px solid white;"><a href="" onclick="fnSortTable(1);fnHighlightCells(0);return false;" title="" class="sys-table-color-border sys-font-body-bold">Status<img id="eCol1" src="/consumer/shared/images/sortTableD.gif"</a></td>
									<td nowrap="1" style="border-left: 1px solid white;border-right-width:0px"><a href="" onclick="fnSortTable(2);fnHighlightCells(0);return false;" title="" class="sys-table-color-border sys-font-body-bold" sortby="value">Date<img id="eCol2" src="/consumer/shared/images/sortTableD.gif"</a></td>
									<td nowrap="1" style="border-left: 1px solid white;border-right:3px solid #6681D9"><a href="" onclick="fnSortTable(3);fnHighlightCells(0);return false;" title="" class="sys-table-color-border sys-font-body-bold">Action<img id="eCol3" src="/consumer/shared/images/sortTableD.gif"</a></td>
								</tr>
							</tbody> 
						</table>
					</td>
				</tr>
				<tr>
					<td id="eSortTableContainer" style="padding-top:0px;padding-bottom:0px;" valign="top" >
						<table cellspacing="0" class="sys-table-color-border" border="0" >
							<colgroup>
								<col style="width: 35%;" class="sys-table-color-border" />
								<col style="width: 19%;" class="sys-table-color-border" />
								<col style="width: 25%;" class="sys-table-color-border" />
								<col style="width: 21%;" class="sys-table-color-border" />
							</colgroup>
							<tbody id="eSortTable">
							</tbody>
						</table>	
					</td>
				</tr>
				<tr>
					<td id="ePagingContainer" style="height:40px;"valign="top">
					</td>
				</tr>
				<tr>
					<td style="font-size:12pt;">Disclaimer:Right now the history you are seeing is being generated from fake data.</td>
				</tr>
				<tr>
					<td ><a href="Quarantine.aspx">Test Quarantine</a></td>
				</tr>		
			</tbody>
		</table>
		
		<!-- This code would be removed once we publish History live -->
		
		<table id="tbHistoryTemp" border="0" cellspacing="0" style="height:84%;width:97%;">
			<tbody>
				<tr>
					<td id="Title" style="vertical-align:top;" >
						<div style="overflow:auto">
							<span class="sys-font-heading3 sys-rhp-color-title">View installation history - Coming Soon!</span><br /><br/>
								The installation history is not available in this beta release. To see which updates you have installed from this beta site, you can find update event information in the following sources:<br /><br />
								<ul>
									<li>c:\windows\SoftwareDistribution\trace.log in your Windows directory.</li>
									<li>c:\windows\SoftwareDistribution\ReportingEvents.log in your Windows directory.</li>
									<li>System Event Viewer – From your Start menu, click Control Panel, Administrative Tools, Event Viewer, and choose System in the left-hand pane.</li>
								</ul>
								In the event that you want to uninstall software you've downloaded and installed from Windows Update, or see a full listing of your currently installed updates, you can do so by using Add or Remove Programs, in Control Panel.<br />
						</div> 
					</td>	
				</tr> 
			</tbody>
		</table>	
		
		<!-- This code would be removed once we publish History live -->
				
	</body>
</html>
