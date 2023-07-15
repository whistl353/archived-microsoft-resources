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

<script language="JScript" type="text/javascript" src="shared/js/troubleshooter.js"></script>
<script language="JScript" type="text/javascript">

		var userlang = parent.conLangCode;
		var contentwindow = new Array(10);
		var windowcounter = 0;
		var divcountjs = 4;
		var pingbackURL = "http://v5stats.windowsupdate.microsoft.com/v5sitereporting/report.aspx";
		var currentdiv = 1;
		var pingbacktext = "Thank you. Your response has been sent to Microsoft.";
		function fnProblemHeaderClicked(articleid){
			
			contentwindow[windowcounter++] = window.open('showarticle.aspx?articleid=' + articleid + '&ln=' + userlang,"window" + articleid,"directories=no,width=600,height=600,location=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes,top = 100,left = 100");
			if (windowcounter > 10){
				contentwindow = contentwindow.concat(windowcounter);
			}
			
		}
		function fnClearText () { 
			
			if (Form1.TextBoxSearch.value == "Type keywords here:"){
				Form1.TextBoxSearch.value = "";
			}
			

		}
		function fnPurify(){
			//onkeyup="fnPurify();"
			var inputstring;
			inputstring = Form1.TextBoxSearch.value
			while(inputstring.indexOf("<") != -1 ){
				inputstring = inputstring.replace(/</,"");
			}
			while(inputstring.indexOf(">") != -1){
				inputstring = inputstring.replace(/>/,"");
			}
			if (inputstring != Form1.TextBoxSearch.value) {
				Form1.TextBoxSearch.value = inputstring;
			}

		}
	
		function fnunload(){
					
			for (var i = 0; i < windowcounter; i++)
			{
				contentwindow[i].close();
			}
		}
function fnShowOtherIssues(i){
	//i = the page number that was clicked on, what the user wants to see
	//divcountjs = total number of pages
	//currentdiv = current page being shown.
	
	currentdiv = i;	
	// hide all of the divs
	for(var a = 1; a < divcountjs + 1; a++)
	{
		document.all["divMainIssuesContents" + a].style.display="none";
	}
	// show the desired div	
	document.all["divMainIssuesContents" + currentdiv].style.display="block";

	// build whole set of anchor tags anew:
	// if we're at the first page
	if (currentdiv ==1){
		labelMainIssuesPages.innerHTML  =currentdiv + "&nbsp" +
									"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
									"<a href='javascript:fnShowNext()'  class='sys-link-normal'>Next&gt;&gt;</a>"
	}
	//          what if we're at page 2? what will be shown?

	// if we're at the last page
	if (currentdiv == divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv - 1) + ")'  class='sys-link-normal'>" + (currentdiv -1) + "</a>&nbsp;" +
										 currentdiv + "&nbsp";
	}
	//          what if we're at divcountjs - 1 page? what will be shown?

	// if we're in the middle
	if (currentdiv != 1 && currentdiv != divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										currentdiv + "&nbsp" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
										"<a href='javascript:fnShowNext()'  class='sys-link-normal'>Next&gt;&gt;</a>"
	}
    
}

function fnShowPrev(){
	//divcountjs = total number of pages
	//currentdiv = current page shown.
	
	currentdiv = currentdiv - 1;	
	// hide all of the divs
	for(var a = 1; a < divcountjs + 1; a++)
	{
		document.all["divMainIssuesContents" + a].style.display="none";
	}
	// show the desired div	
	document.all["divMainIssuesContents" + currentdiv].style.display="block";

	// if we're at the first page
	if (currentdiv ==1){
		labelMainIssuesPages.innerHTML  =currentdiv + "&nbsp" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
										"<a href='javascript:fnShowNext()' class='sys-link-normal'>Next&gt;&gt;</a>"
	}
	// if we're in the middle
	if (currentdiv != 1 && currentdiv != divcountjs){
	labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
									currentdiv + "&nbsp" +
									"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
									"<a href='javascript:fnShowNext()' class='sys-link-normal'>Next&gt;&gt;</a>"
	}


}

function fnShowNext(){
	//divcountjs = total number of pages
	//currentdiv = current page shown.
	
	currentdiv = currentdiv + 1;
	// hide all of the divs
	for(var a = 1; a < divcountjs + 1; a++)
	{
		document.all["divMainIssuesContents" + a].style.display="none";
	}
	// show the desired div	
	document.all["divMainIssuesContents" + currentdiv ].style.display="block";

	// if we're in the middle
	if (currentdiv != 1 && currentdiv != divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										currentdiv + "&nbsp" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv + 1) + ")'  class='sys-link-normal'>" + (currentdiv + 1) + "</a>&nbsp;" +
										"<a href='javascript:fnShowNext()' class='sys-link-normal'>Next&gt;&gt;</a>"
	}
	
	// if we're at the last page
	if (currentdiv == divcountjs){
		labelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowPrev()' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
										"<a href='javascript:fnShowOtherIssues(" + (currentdiv - 1) + ")' class='sys-link-normal'>" + (currentdiv -1) + "</a>&nbsp;" +
										 currentdiv + "&nbsp";
	}


}



</script>
<body id="bodyTag" leftmargin="0" topmargin="0" height="100%" onunload="fnunload();">
	<span class="sys-font-heading3 sys-rhp-color-title">
		Windows Update Troubleshooter
	</span><br>
	<br>
	Type a word or phrase to search for, and then click Search.
	<br>
	<br>
	<!-- search window here --> <!-- sys-toppane-bgcolor sys-lhp-bgcolor -->
	<div class="sys-toppane-bgcolor" STYLE="BORDER-RIGHT:blue 1px solid; PADDING-RIGHT:10px; BORDER-TOP:blue 1px solid; PADDING-LEFT:15px; PADDING-BOTTOM:10px; BORDER-LEFT:blue 1px solid; WIDTH:90%; PADDING-TOP:15px; BORDER-BOTTOM:blue 1px solid">
		<form name="Form1" method="post" action="troubleshoot.aspx" id="Form1">
<input type="hidden" name="__VIEWSTATE" value="dDwxMjMxNDg0NDYwOzs+" />

			<nobr>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="320">
							Type keywords here:
							<br>
							<input name="TextBoxSearch" type="text" maxlength="100" id="TextBoxSearch" onclick="fnClearText();" onkeyup="fnPurify();" style="FONT-SIZE:100%" /></td>
						<td valign="bottom">
							<input type="submit" name="Button1" value="Search" id="Button1" /></td>
					</tr>
				</table>
				
				<br>
				<span id="LabelforselectOS" style="MARGIN-BOTTOM:-10px">Select an operating system:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="LabelforselectCategory" style="MARGIN-BOTTOM:-10px">Select a category:</span>
				<br>
				<select name="selectOS" id="selectOS" style="MARGIN-BOTTOM:-15px">
	<option value="0">All operating systems</option>
	<option value="1">Windows 2000</option>
	<option value="2">Windows XP</option>
	<option value="3">Windows Server 2003</option>

</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="selectCategory" id="selectCategory" style="MARGIN-BOTTOM:-15px">
	<option value="0">All categories</option>
	<option value="1">Driver download failure</option>
	<option value="2">Driver installation failure</option>
	<option value="3">Driver post-installation failure</option>
	<option value="4">Problem accessing Windows Update</option>
	<option value="5">Problem using Automatic Update</option>
	<option value="6">Problem using Windows Update Catalog</option>
	<option value="7">Problem when scanning</option>
	<option value="8">Software download failure</option>
	<option value="9">Software installation failure</option>
	<option value="10">Software post-installation failure</option>
	<option value="11">Other</option>

</select>
			</nobr>
		</form>
	</div>
	<br>
	The following information has helped people troubleshoot problems reported to Microsoft Product Support. Conditions for using this information are in Microsoft's <A href="http://go.microsoft.com/fwlink/?LinkId=9482"  class='sys-link-normal' target="_blank" >terms of use</A>.
	<br>
	<hr>
	
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td valign="top"><span id="LabelOS"><b> - </b></span><span id="LabelCat"><b>All categories</b></span></td>
			<td valign="top" align="right"><a href='http://go.microsoft.com/fwlink/?LinkId=27095' target='_blank' class='sys-link-normal'><nobr>Go to Knowledge Base articles</a></NOBR></td>
		</tr>
	</table>
	<br>
	<br>
	<span id="labelMainIssuesContents"><div id=divMainIssuesContents1 style='DISPLAY:block'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('34');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('34');" >When accessing the Windows Update site, you receive the 0x80245003 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('29');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('29');" >When searching for available updates on the Windows Update site, you receive the 0x8024402C error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('14');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('14');" >When searching for available updates on the Windows Update site, you see the 0x80244001 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('33');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('33');" >When searching for available updates on the Windows Update site, you receive the 0x800B0001 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('24');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('24');" >When clicking the Details or History link, nothing happens</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('22');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('22');" >When searching for available updates on the Windows Update site, you see the 0x80072EE7 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('20');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('20');" >When searching for available updates on the Windows Update site, you receive the 0x800A0046 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('19');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('19');" >When searching for available updates on the Windows Update site, you see the 0x8007043B error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('18');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('18');" >Javascript error on Page, Line: 59, Char: 2</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('3');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('3');" >When tying to save Advanced settings on the Windows Update site, you see the  Need to enable Userdata for this feature error</a></td></tr></tbody></table><br></div><div id=divMainIssuesContents2 style='DISPLAY:none'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('1');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('1');" >When trying to access the Windows Update site, you see a blank page</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('15');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('15');" >When searching for available updates on the Windows Update site, you see the 0x800A01AD error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('16');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('16');" >When accessing the Windows Update site, you receive the 0x80072EFD error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('23');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('23');" >When clicking a link, you see the HTTP Error 500 - Internal Server Error, Error 0x8ddd0010</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('9');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('9');" >The necessary services are disabled or unavailable. Error 0x80246008</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('6');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('6');" >When trying to access the Windows Update site, you see the 0x8ddd0003 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('32');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('32');" >When attempting to download or install and update, you receive error 0x80070070.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('12');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('12');" >When searching for available updates on the Windows Update site, you see the 0x80072F8F error while looking for available updates</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('21');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('21');" >When searching for available updates on the Windows Update site, you receive the 0x80248011 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('31');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('31');" >When accessing the Windows Update site, you receive the 0x80072EE2 error.</a></td></tr></tbody></table><br></div><div id=divMainIssuesContents3 style='DISPLAY:none'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('26');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('26');" >When searching for available updates on the Windows Update site, you receive the 0x8024502d error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('27');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('27');" >When accessing the Windows Update site, you receive the 0x8007045A error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('28');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('28');" >When accessing the Windows Update site, you receive the 0x8ddd0007 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('30');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('30');" >When searching for available updates on the Windows Update site, you receive the 0x80240030 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('25');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('25');" >When clicking a link on the View Installation History page, you see the home page within the main window</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('17');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('17');" >When searching for available updates on the Windows Update site, you see the 0x80070002 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('13');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('13');" >When searching for available updates on the Windows Update site, you see the  0x800A01AD error while looking for updates</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('11');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('11');" >When searching for available updates on the Windows Update site, you see the 0x80248013 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('10');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('10');" >Error 0x80246008 during the download process</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('7');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('7');" >When trying to access the Windows Update site, you see the Windows Update was disabled by your system administrator error</a></td></tr></tbody></table><br></div><div id=divMainIssuesContents4 style='DISPLAY:none'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('2');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('2');" >When clicking Details, you see a blank dialog box</a></td></tr></tbody></table><br></div><br><br></span>
	<span id="labelMainIssuesPages">1 &nbsp;<a href='javascript:fnShowOtherIssues(2)'  class='sys-link-normal'>2</a>&nbsp<a href='javascript:fnShowNext()'  class='sys-link-normal'>Next&gt;&gt;</a></span>
	<iframe src="blank.aspx" name='eReporting' noresize height='0' width='0' style='DISPLAY:none' />
	<IFRAME ID="iframeForPingBack" BORDER="0" HEIGHT="0" WIDTH="0" FRAMEBORDER="0" SCROLLING="no"
		style="VISIBILITY:hidden"></IFRAME>
	<script language="JavaScript"> 
		function window::onLoad() {
			fnLoadTshoot();
			document.all["TextBoxSearch"].focus();
			document.all["TextBoxSearch"].value = document.all["TextBoxSearch"].value;
		}
	</script>
</body>
