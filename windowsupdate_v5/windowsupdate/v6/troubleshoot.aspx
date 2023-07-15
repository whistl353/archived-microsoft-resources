<html dir='ltr'>
<head>
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))' /> 
<meta http-equiv='Content-Type' content='text/html;charset=windows-1252' />
<meta http-equiv='MSThemeCompatible' content='yes' />
<title>Microsoft Windows Update</title>
<link rel='shortcut icon' href='shared/images/banners/favicon.ico' type='image/x-icon'/>
<meta name='MSSmartTagsPreventParsing' content='yes' />
<meta name='ROBOTS' content='NOINDEX'>
<!--Copyright (c) Microsoft Corporation.  All rights reserved.-->
<script language='javascript' type='text/javascript'>
window.onerror = new Function('Message' ,'sURL' ,'sLine' , 'return true;')
</script>
<script language='JScript' type='text/javascript' src='shared/js/tgar.js?634258581310025103'></script>
<script language='JScript' type='text/javascript' src='shared/js/content.js?634258581310025103'></script>
<link rel='stylesheet' type='text/css' href='shared/css/hcp.css' />
<link rel='stylesheet' type='text/css' href='shared/css/content.css' />
<style type='text/css'>button {padding: 0px 14px 1px 14px;width: 80px;height: 21px;overflow: visible;line-height: 15px;cursor: default;}</style>
<script language="JScript" type="text/javascript" src="shared/js/troubleshooter.js?634258581310025103"></script>
<script language="JScript" type="text/javascript">

	var sUserLang = parent.conLangCode;
	var iArticlesPerPage = 10;
	var sContentWindow = new Array(iArticlesPerPage);
	var iWindowCounter = 0;
	var iDivCountJs = 5;
	var sPingBackUrl = "http://stats.update.microsoft.com";
	var iCurrentDiv = 1;
	var bIsMu = "False";
	var iArticleCount = 50;
	var iPrevDiv = 0;

		
	function fnProblemHeaderClicked(articleId){
		sContentWindow[iWindowCounter++] = window.open('showarticle.aspx?articleid=' + articleId + '&ln=' + sUserLang + '&IsMu=' + bIsMu,"window" + articleId,"directories=no,width=650,height=500,location=no,menubar=no,status=no,toolbar=no,resizable=yes,scrollbars=yes,top = 100,left = 100");
		if (iWindowCounter > 10){
			sContentWindow = sContentWindow.concat(iWindowCounter);
		}
	}
	function fnClearText () { 
		if (TroubleshooterForm.TextBoxSearch.value == "Type keywords here:"){
			TroubleshooterForm.TextBoxSearch.value = "";
		}
	}
	function fnPurify(){
		var inputstring;
		inputstring = TroubleshooterForm.TextBoxSearch.value
		while(inputstring.indexOf("<") != -1 ){
			inputstring = inputstring.replace(/</,"");
		}
		while(inputstring.indexOf(">") != -1){
			inputstring = inputstring.replace(/>/,"");
		}
		if (inputstring != TroubleshooterForm.TextBoxSearch.value) {
			TroubleshooterForm.TextBoxSearch.value = inputstring;
		}
	}
	
	function fnunload(){
		for (var i = 0; i < iWindowCounter; i++)
		{
			sContentWindow[i].close();
		}
	}
	function fnShowOtherIssues(iCurrentDiv){
		//iCurrentDiv = the page number that was clicked on, what the user wants to see
		//iDivCountJs = total number of pages
		//iPrevDiv = set to page previously shown

		// hide all of the divs
		for(var a = 1; a < iDivCountJs + 1; a++)
		{
			document.all["divMainIssuesContents" + a].style.display="none";
		}
		// show the desired div	
		document.all["divMainIssuesContents" + iCurrentDiv].style.display="block";

		// build whole set of anchor tags anew:
		// if we are showing the end page, include the final page count, otherwise show the full values
		if (iCurrentDiv + 1 >= iDivCountJs )
		{
			// if we're at the first page
			if (iCurrentDiv ==1){
				LabelMainIssuesPages.innerHTML  =((iCurrentDiv * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + (iCurrentDiv * iArticlesPerPage) + "&nbsp" +
											"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv + 1) * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + ((iCurrentDiv + 1) * iArticlesPerPage) + "</a>&nbsp;" +    
											"&nbsp;<a href='javascript:fnShowOtherIssues(2)'  class='sys-link-normal'>Next&gt;&gt;</a>"
			}
			// if we're at the last page
			if (iCurrentDiv == iDivCountJs){
				LabelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv - 1) * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + ((iCurrentDiv - 1) * iArticlesPerPage) + "</a>&nbsp;" +
												"&nbsp;" + ((iCurrentDiv * iArticlesPerPage)-(iArticlesPerPage - 1)) + "-" + iArticleCount + "&nbsp";
			}
			// if we're in the middle	
			if (iCurrentDiv != 1 && iCurrentDiv != iDivCountJs){
				if(iCurrentDiv + 1 <= iDivCountJs){
					LabelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
												"&nbsp;" + ((iCurrentDiv * iArticlesPerPage)-(iArticlesPerPage - 1)) + "-" + (iCurrentDiv * iArticlesPerPage) + "&nbsp" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv + 1) * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + iArticleCount + "</a>&nbsp;" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>Next&gt;&gt;</a>"
				}
				else
				{
					LabelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv - 1) * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + ((iCurrentDiv - 1) * iArticlesPerPage) + "</a>&nbsp;" +
												"&nbsp;" + ((iCurrentDiv * iArticlesPerPage)-(iArticlesPerPage - 1)) + "-" + (iCurrentDiv * iArticlesPerPage) + "&nbsp" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>Next&gt;&gt;</a>"
				}
			}
		}
 		else
		{	// not showing the end page
			// if we're at the first page
			if (iCurrentDiv ==1){
				LabelMainIssuesPages.innerHTML  =((iCurrentDiv * iArticlesPerPage)-(iArticlesPerPage - 1)) + "-" + (iCurrentDiv * iArticlesPerPage) + "&nbsp" +
											"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv + 1) * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + ((iCurrentDiv + 1)*iArticlesPerPage) + "</a>&nbsp;" +    
											"&nbsp;<a href='javascript:fnShowOtherIssues(2)'  class='sys-link-normal'>Next&gt;&gt;</a>"
			}
			// if we're at the last page
			if (iCurrentDiv == iDivCountJs){
				LabelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv - 1) * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + ((iCurrentDiv - 1)*iArticlesPerPage) + "</a>&nbsp;" +
												"&nbsp;" + ((iCurrentDiv * iArticlesPerPage)-(iArticlesPerPage - 1)) + "-" + (iCurrentDiv * iArticlesPerPage) + "&nbsp";
			}
			// if we're in the middle	
			if (iCurrentDiv != 1 && iCurrentDiv != iDivCountJs){
				
				if (iCurrentDiv > iPrevDiv)
				{
					LabelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
												"&nbsp;" + ((iCurrentDiv * iArticlesPerPage)-(iArticlesPerPage - 1)) + "-" + (iCurrentDiv * iArticlesPerPage) + "&nbsp" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv + 1)*iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + ((iCurrentDiv + 1) * iArticlesPerPage) + "</a>&nbsp;" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>Next&gt;&gt;</a>"
				}
				else
				{
					LabelMainIssuesPages.innerHTML  = "<a  href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")' class='sys-link-normal'>&lt;&lt;Previous</a>&nbsp;" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv - 1) + ")'  class='sys-link-normal'>" + (((iCurrentDiv) * iArticlesPerPage) - (iArticlesPerPage - 1)) + "-" + ((iCurrentDiv) * iArticlesPerPage) + "</a>&nbsp;" +
												"&nbsp;" + (((iCurrentDiv + 1) * iArticlesPerPage)-(iArticlesPerPage - 1)) + "-" + ((iCurrentDiv + 1) * iArticlesPerPage) + "&nbsp" +
												"&nbsp;<a href='javascript:fnShowOtherIssues(" + (iCurrentDiv + 1) + ")'  class='sys-link-normal'>Next&gt;&gt;</a>"
				}
			}
		}
		iPrevDiv = iCurrentDiv;   
	}

</script>
</head>
<body id="bodyTag" leftmargin="0" topmargin="0" height="100%" onunload="fnunload();">

	
		<table cellpadding=0 cellspacing=0 border=0 style="position:relative;left:-16;top:-10;">
			<tr>
				<td align="left" valign="top" width=290><img src="shared/images/bannersmu/en/hdr_options_left.jpg"></td>
				<td align="left" valign="top" width=100% style="background-image:url(shared/images/banner-bg.jpg);background-repeat:repeat-x"></td>
				<td align="left" valign="top" width=158><img src="shared/images/bannersmu/en/banner-right.jpg"></td>
			</tr>
		</table>
	
	<table cellpadding=0 cellspacing=0 border=0 >
		<tr height="0">
			<td width="464"></td>
			<td width="100%"></td>
		</tr>
		<tr><td colspan="2" width="100%">
			<span class="sys-font-heading3 sys-rhp-color-title">
				Find Solutions
			</span><br>
			Type a word or phrase to search for, and then click Search.
			<br>
			<br>
			<div class="sys-toppane-bgcolor" STYLE="PADDING-RIGHT:10px; PADDING-LEFT:15px; PADDING-BOTTOM:10px;  WIDTH:80%; PADDING-TOP:15px"><!--STYLE="BORDER-RIGHT:blue 1px solid; PADDING-RIGHT:10px; BORDER-TOP:blue 1px solid; PADDING-LEFT:15px; PADDING-BOTTOM:10px; BORDER-LEFT:blue 1px solid; WIDTH:90%; PADDING-TOP:15px; BORDER-BOTTOM:blue 1px solid"> -->
				<form name="TroubleshooterForm" method="post" action="troubleshoot.aspx" id="TroubleshooterForm">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJODM0MTIwMzE1ZGQ=" />

<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWEwLzqITXCwK57MfCBALR1viaCQLOgIyWBALRgIyWBALQgIyWBALTgIyWBAKXtLGzCgKItLGzCgKJtLGzCgKKtLGzCgKLtLGzCgKMtLGzCgKNtLGzCgKOtLGzCgKftLGzCgKQtLGzCgKItPGwCgKItP2wCg==" />
					
					<nobr>
						<table cellpadding="0" cellspacing="0" border="0" width ="400">
							<tr>
								<td width=320>
									Type keywords here:
									<br>
									<input name="TextBoxSearch" type="text" maxlength="100" id="TextBoxSearch" onclick="fnClearText();" onChange="fnPurify();" onKeyUp="fnPurify();" style="FONT-SIZE:100%" /></td>
								<td valign="bottom" width=60>
									<input type="submit" name="SearchButton" value="Search" id="SearchButton" /></td>
							</tr>
						</table >
						
						<br>
						<table cellpadding="0" cellspacing="0" border="0" width ="600">
							
							<tr>
								<td align="left"><span id="LabelSelectOS" style="display:inline-block;MARGIN-BOTTOM:3px">Select an operating system:</span></td>
							</tr>
							<tr>
								<td align="left"><select name="DropdownSelectOs" id="DropdownSelectOs">
	<option value="0">All operating systems</option>
	<option value="1">Windows 2000</option>
	<option value="2">Windows XP</option>
	<option value="3">Windows Server 2003</option>

</select></td>
							</tr>	
							<tr><td height = "8px">&nbsp;</td></tr>
							<tr>
								<td align="left"><span id="LabelSelectCategory" style="display:inline-block;MARGIN-BOTTOM:3px">Select a category:</span></td>
							</tr>
							<tr>
								<td align="left"><select name="DropdownSelectCategory" id="DropdownSelectCategory">
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

</select></td>
							</tr>
						</table>
					</nobr>
				</form>
			</div>
			<div STYLE="WIDTH:80%">
				<br>
				The following information has helped people troubleshoot problems reported to Microsoft Product Support. Conditions for using this information are in Microsoft's <A href="http://go.microsoft.com/fwlink/?LinkId=9482"  class='sys-link-normal' target="_blank" >terms of use</A>.
				<br>
			</div>
			<br>
			
			<table cellpadding="0" cellspacing="0" border="0" width = 80%>
				<tr>
					<td width = 65% valign="top">Results for:&nbsp;<span id="LabelOS"><b> - </b></span><span id="LabelCategory"><b>All categories</b></span></td>
					<td width = 35% valign="top" align="right"><a href='http://go.microsoft.com/fwlink/?LinkId=27095' target='_blank' class='sys-link-normal'>Go to Knowledge Base articles</a></td>
				</tr>
			</table>
			<br>
			<span id="LabelMainIssuesContents" style="display:inline-block;"><div id=divMainIssuesContents1 style='DISPLAY:block'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('32');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('32');" >When accessing the Update site, you receive the 0x80072EE2 or 0x80072EFD error. (Resolution 1)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('22');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('22');" >When searching for available updates on the Update site, you see the 0x80072EE7 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('44');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('44');" >If Windows 2003 SP1 is not installed you may not see any Critical Updates other than SP1</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('9');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('9');" >The necessary services are disabled or unavailable. Error 0x80246008 (Resolution 1)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('8');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('8');" >The necessary service &quot;Automatic Updates&quot; (WUAUSERV) is not started or is unavailable. Error 0x80070422 (Resolution 1)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('47');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('47');" >The necessary services are disabled or unavailable. Error 0x80246008 (Resolution 2)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('65');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('65');" >When installing Microsoft SQL Server 2005 Express Edition Service Pack 2 (KB 921896) you may receive error 0x2B26</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('55');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('55');" >When searching for available updates on the Update site, you see the 0x8024D00C error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('26');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('26');" >When searching for available updates on the Update site, you receive the 0x8024502d error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('31');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('31');" >When searching for available updates on the Update site, you receive the 0x80240030 error. (Resolution 1)</a></td></tr></tbody></table><br></div><div id=divMainIssuesContents2 style='DISPLAY:none'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('29');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('29');" >When accessing the Update site, you receive the 0x8ddd0007 error.(Resolution 1)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('37');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('37');" >When accessing the Update site, you receive the 0x8ddd0011 error (Resolution 1)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('12');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('12');" >When searching for available updates on the Update site, you see the 0x80072F8F error while looking for available updates (Resolution 1)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('36');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('36');" >When accessing the Update site, you receive the 0x8ddd0004 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('17');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('17');" >When searching for available updates on the Update site, you see the 0x80070002 or 0x80070003 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('20');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('20');" >When searching for available updates on the Update site, you receive the 0x800A0046 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('33');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('33');" >When attempting to download or install an update, you receive error 0x80070070.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('49');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('49');" >When installing .Net Framework 2.0 you may receive error 0x1011</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('38');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('38');" >When accessing the Update site, you receive the 0x800A01AE error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('48');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('48');" >When accessing the Update site, you receive the 0x80072EE2 or 0x80072EFD error. (Resolution 2)</a></td></tr></tbody></table><br></div><div id=divMainIssuesContents3 style='DISPLAY:none'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('34');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('34');" >When searching for available updates on the Update site, you receive the 0x800B0001 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('6');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('6');" >When trying to access the Update site, you see the 0x8ddd0003 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('45');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('45');" >While the Windows Update Web site is loading, you receive Initialization Error 0x800A1391</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('46');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('46');" >The necessary service &quot;Automatic Updates&quot; (WUAUSERV) is not started or is unavailable. Error 0x80070422 (Resolution 2)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('43');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('43');" >When accessing the Update site, you may receive the 0x800700C1 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('40');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('40');" >When Downloading or installing from the Update Site, you may receive error 0x8007F0DA</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('15');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('15');" >When searching for available updates on the Update site, you see the 0x800A01AD error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('39');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('39');" >When accessing the Update site, you receive the 0x80240020 error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('30');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('30');" >When searching for available updates on the Update site, you receive the 0x8024402C error.</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('21');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('21');" >When searching for available updates on the Update site, you receive the 0x80248011 error.</a></td></tr></tbody></table><br></div><div id=divMainIssuesContents4 style='DISPLAY:none'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('19');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('19');" >When searching for available updates on the Update site, you see the 0x8007043B error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('14');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('14');" >When searching for available updates on the Update site, you see the 0x80244001 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('13');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('13');" >When searching for available updates on the Update site, you see the  0x800A01AD error while looking for updates</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('11');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('11');" >When searching for available updates on the Update site, you see the 0x80248013 error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('7');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('7');" >When trying to access the Update site, you see the Windows Update was disabled by your system administrator error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('5');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('5');" >When trying to access the Update site, you see an Administrators only error. The text reads: Your current security settings prohibit running ActiveX controls</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('4');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('4');" >When trying to access the Update site, you see a Thank you page</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('3');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('3');" >When tying to save Advanced settings on the Update site, you see the  Need to enable Userdata for this feature error</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('1');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('1');" >When trying to access the Update site, you see a blank page</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('28');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('28');" >When accessing the Update site, you receive the 0x8007045A error.</a></td></tr></tbody></table><br></div><div id=divMainIssuesContents5 style='DISPLAY:none'><table width="90%" border="0" cellspacing="1" cellpadding="1"><tbody><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('24');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('24');" >When clicking the Details or History link, nothing happens</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('23');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('23');" >When clicking a link, you see the HTTP Error 500 - Internal Server Error, Error 0x8ddd0010</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('25');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('25');" >When clicking a link on the View Installation History page, you see the home page within the main window</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('18');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('18');" >Javascript error on Page, Line: 59, Char: 2</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('2');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('2');" >When clicking Details, you see a blank dialog box</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('54');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('54');" >When searching for available updates on the Update site, you receive the 0x80240030 error. (Resolution 2)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('53');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('53');" >When accessing the Update site, you receive the 0x8ddd0007 error. (Resolution 2)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('52');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('52');" >When accessing the Update site, you receive the 0x8ddd0011 error (Resolution 2)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('50');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('50');" >When searching for available updates on the Update site, you see the 0x80072F8F error while looking for available updates (Resolution 2)</a></td></tr><tr><td align="left" valign="middle" width="15px" ><a href="javascript:fnProblemHeaderClicked('51');" class="sys-link-normal" ><img src="shared/images/ts_bullet.gif" /></a></td><td width="3px"></td><td><a id="spanProblemHeader" class="sys-link-normal" href="javascript:fnProblemHeaderClicked('51');" >When searching for available updates on the Update site, you see the 0x80072F8F error while looking for available updates (Resolution 3)</a></td></tr></tbody></table><br></div></span>
			<div>
			<span id="LabelMainIssuesPages" align="left">1 - 10 &nbsp;&nbsp;<a href='javascript:fnShowOtherIssues(2)'  class='sys-link-normal'>11-20</a>&nbsp&nbsp;<a href='javascript:fnShowOtherIssues(2)'  class='sys-link-normal'>Next&gt;&gt;</a></span>
			</div>
		</td></tr>
	</table>
	<iframe src="blank.aspx" name='eReporting' noresize height='0' width='0' style='DISPLAY:none' />
	<iframe ID="iframeForPingBack" BORDER="0" HEIGHT="0" WIDTH="0" FRAMEBORDER="0" SCROLLING="no"
		style="VISIBILITY:hidden"></IFRAME>
	<script language="JavaScript"> 
		function window::onLoad() {
			fnLoadTshoot();
			document.all["TextBoxSearch"].focus();
			document.all["TextBoxSearch"].value = document.all["TextBoxSearch"].value;
		}
	</script>
		
</body>
</html>