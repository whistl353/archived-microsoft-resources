

			var g_sLang;
//			var g_sXslText;
			var g_sDir;
			var g_sUserAgent;
			var g_oLearnPrivacy = null;

//var L_Copyright_Address_Text = "http://www.microsoft.com/info/cpyright.htm";
//var L_Accessibility_Address_Text = "http://www.microsoft.com/enable/";
//var L_Copyright_Text = "&#169; 2003 Microsoft Corporation. All rights reserved.";
//var L_TermsOfUse_Text = "Terms of use.";
//var L_Accessibility_Text = "Accessibility.";





			function fnGetLanguageSettings()
			{
				g_sDir = "ltr";
				var oRegExp = new RegExp("(.*)-");
				oRegExp.global = true;
				var arr = oRegExp.exec(navigator.systemLanguage);
				if (null == arr || null == arr[1])
				{
					g_sLang = navigator.systemLanguage;
				}
				else
				{
					g_sLang = arr[1];
				}
				if ("ar" == g_sLang || "he" == g_sLang)
				{
					g_sDir = "rtl"
				}
			}

			function fnProblemHeaderClicked()
			{
				var oDivProblemHeader = window.event.srcElement.parentNode.parentNode.parentNode.parentNode.parentNode;
				var oDivIssueDetails = oDivProblemHeader.all.item("divIssueDetails");
				var oSpanProblemHeader = oDivProblemHeader.all.item("spanProblemHeader");
				var oImgProblemHeader = oDivProblemHeader.all.item("imgProblemHeader");
				if (null != oDivIssueDetails)
				{
					if (oDivIssueDetails.style.display == "block")
					{
						oSpanProblemHeader.className = "sys-font-body-bold sys-header-color sys-cursor-hand";
						oDivIssueDetails.style.display = "none";
						oImgProblemHeader.src = "/shared/images/icon.plus.gif";
					}
					else
					{
						oSpanProblemHeader.className = "sys-font-body-bold sys-cursor-hand sys-header-bgcolor-selected sys-header-color-selected";
						oDivIssueDetails.style.display = "block";
						oImgProblemHeader.src = "/shared/images/icon.minus.gif";

						// set the height of the text areas
						var oColOfTextAreas = oDivIssueDetails.all.tags("Textarea");
						if (null != oColOfTextAreas)
						{
							var cTextAreas = oDivIssueDetails.all.tags("Textarea").length;
							for (var i=0; i < cTextAreas ; i++)
							{
								oColOfTextAreas[i].style.height = oColOfTextAreas[i].scrollHeight;
							}
						}
					}
				}
			}

			function fnPingUserResponse(iIssueId, strHelped /* true if problem helped otherwise false */)
			{
				window.event.srcElement.parentElement.children(0).disabled = true;
				window.event.srcElement.parentElement.children(1).disabled = true;

				// the above 2 lines are needed to disable the Buttons for IE 5, BECAUSE the below lines which diable the TR DOES NOT work for IE 5 thru script

				window.event.srcElement.parentElement.parentElement.disabled = true;
				window.event.srcElement.parentElement.parentElement.previousSibling.disabled = true;
				var strPingBack = "http://supportstats.windowsupdate.com/wutrack.bin?U=User&C=TS&A=P&I=" + iIssueId + "&P=" + g_sUserAgent + "&L=" + g_sLang + "&S=" + strHelped;
				iframeForPingBack.location.replace(strPingBack);
			}

			function fnLoadAndTransformXML()
			{

				// Load XML
				var xmlIssue = new ActiveXObject("Microsoft.XMLDOM");
				xmlIssue.async = false;
				// to support future localization
				//xmlIssue.load(g_sLang + "/IssuesXml.xml");
				xmlIssue.load("en/IssuesXml.xml");

				// create the XSL String

				/*
				// works on IE 6 ONLY
				g_sXslText = "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?><xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"><xsl:template match=\"Issues\"><div id=\"divCategoryList\"><h1>" + L_PageHeader_Text + "</h1><P>" + L_Disclaimer_Text + "</P><P>" + L_PleaseSelectCategory_Text + "<BR></BR>" + L_HowToFind_Text + "</P><ul><xsl:for-each select=\"Category\"><li> <a id=\"aCategoryAnchor\" class=\"sys-font-body-bold sys-text-underlined\" ><xsl:attribute name=\"HREF\">#<xsl:number value=\"position()\" format=\"1\"/></xsl:attribute> <xsl:value-of select=\"@categoryTitle\" /> </a></li></xsl:for-each>	</ul></div><hr color=\"#C0C0C0\" width=\"100%\" size=\"1\"></hr><br></br>";
				g_sXslText += "<xsl:for-each select=\"Category\"><a><xsl:attribute name=\"name\"><xsl:number value=\"position()\" format=\"1\"/></xsl:attribute></a><div id=\"divCategory\" style=\"LEFT: 15px; POSITION: relative\"><span id=\"spanCategory\" class=\"sys-font-body-bold sys-text-underlined\"><xsl:value-of select=\"@categoryTitle\" /></span><BR></BR><xsl:for-each select=\"Issue\" >	<div id=\"divProblemHeader\" style=\"LEFT: 15px; POSITION: relative\" ><table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"left\" valign=\"top\" width=\"15px\"><img src=\"/shared/images/icon.plus.gif\" id=\"imgProblemHeader\" onclick=\"fnProblemHeaderClicked()\" class=\"imgPlusMinus-size sys-cursor-hand\" /></td><td width=\"3px\"></td><td><span id=\"spanProblemHeader\" class=\"sys-font-body-bold sys-header-color sys-cursor-hand\" onclick=\"fnProblemHeaderClicked()\"><xsl:value-of select=\"ProblemHeader\" /></span></td></tr></tbody></table><div id=\"divIssueDetails\" class=\"issuedetails-color-border issuedetails-size display-none\" ><br /><table width=\"85%\" style=\"LEFT: 30px; POSITION: relative\"><!-- Problem Desc --><tr><td class=\"sys-font-body-bold\">";
				g_sXslText += L_ProblemDescription_Text + "</td></tr><tr><td class=\"sys-left-indented\"><textarea class=\"DisplayIssueTextForTextAreas\" readonly=\"true\" ><xsl:value-of select=\"ProblemDesc\" /></textarea></td></tr><tr><td><BR /></td></tr><tr><td class=\"sys-font-body-bold\">";
				g_sXslText += L_Resolutions_Text + "</td></tr><tr><td class=\"sys-left-indented\"><xsl:for-each select=\"Resolutions/Resolution\" ><textarea class=\"DisplayIssueTextForTextAreas\" readonly=\"true\" ><xsl:value-of select=\".\" /></textarea><hr color=\"#C0C0C0\" width=\"100%\" size=\"1\" /></xsl:for-each></td></tr><tr><td><BR /></td></tr><tr><td class=\"sys-font-body-bold\">";
				g_sXslText += L_IssueAppliesTo_Text + "</td></tr><tr><td class=\"sys-left-indented\"><xsl:for-each select=\"AppliesTo/Platform\" ><li><xsl:value-of select=\".\" /></li></xsl:for-each></td></tr><tr><td><BR /></td></tr><xsl:if test=\"ExtraInfo/ExtraInfoItem\"><tr><td class=\"sys-font-body-bold\">";
				g_sXslText += L_AdditionalInformation_Text + "</td></tr><xsl:for-each select=\"ExtraInfo/ExtraInfoItem\" ><tr><td class=\"sys-left-indented\"><xsl:copy-of select=\".\"/></td></tr></xsl:for-each><tr><td><BR /></td></tr></xsl:if><tr><td class=\"sys-font-body-bold\">";
				g_sXslText += L_DidThisResolveYourProblem_Text + "</td></tr><tr><td class=\"sys-left-indented\">									<input class=\"button-width\" id=\"btnYes\" type=\"button\" value=\"Yes\" NAME=\"btnYes\"><xsl:attribute name=\"onclick\">fnPingUserResponse(<xsl:value-of select=\"IssueId\" />, true)</xsl:attribute></input><input class=\"sys-left-indented button-width\" id=\"btnNo\" type=\"button\" value=\"No\" NAME=\"btnNo\"><xsl:attribute name=\"onclick\">fnPingUserResponse(<xsl:value-of select=\"IssueId\" />, false)</xsl:attribute></input></td></tr>		<tr><td><BR /></td></tr>					</table>											</div><BR /></div>				</xsl:for-each>  <!-- end of for each Issue --></div> <!-- end of Category div --><BR/></xsl:for-each></xsl:template>	</xsl:stylesheet>";
				*/

				// works on IE 5 - IE6
//				g_sXslText = "<?xml version=\"1.0\" ?><SPAN xmlns:xsl=\"http://www.w3.org/TR/WD-xsl\"><div id=\"divCategoryList\"><h1>" + L_PageHeader_Text + "</h1><P>" + L_Disclaimer_Text + "</P><P>" + L_PleaseSelectCategory_Text + "<BR></BR>" + L_HowToFind_Text + "</P><ul><xsl:for-each select=\"Issues/Category\"><li> <a id=\"aCategoryAnchor\" class=\"sys-font-body-bold sys-text-underlined\" ><xsl:attribute name=\"HREF\">#<xsl:value-of select=\"@categoryTitle\"/></xsl:attribute> <xsl:value-of select=\"@categoryTitle\" /> </a></li></xsl:for-each>	</ul></div><hr color=\"#C0C0C0\" width=\"100%\" size=\"1\"></hr><br></br>";
//				g_sXslText += "<xsl:for-each select=\"Issues/Category\"><a><xsl:attribute name=\"name\"><xsl:value-of select=\"@categoryTitle\"/></xsl:attribute></a><div id=\"divCategory\" style=\"LEFT: 15px; POSITION: relative\"><span id=\"spanCategory\" class=\"sys-font-body-bold sys-text-underlined\"><xsl:value-of select=\"@categoryTitle\" /></span><BR></BR><xsl:for-each select=\"Issue\" >	<div id=\"divProblemHeader\" style=\"LEFT: 15px; POSITION: relative\" ><table width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"left\" valign=\"top\" width=\"15px\"><img src=\"/shared/images/icon.plus.gif\" id=\"imgProblemHeader\" onclick=\"fnProblemHeaderClicked()\" class=\"imgPlusMinus-size sys-cursor-hand\" /></td><td width=\"3px\"></td><td><span id=\"spanProblemHeader\" class=\"sys-font-body-bold sys-header-color sys-cursor-hand \" onclick=\"fnProblemHeaderClicked()\"><xsl:value-of select=\"ProblemHeader\" /></span></td></tr></tbody></table><div id=\"divIssueDetails\" class=\"issuedetails-color-border issuedetails-size display-none\" ><br /><table width=\"85%\" style=\"LEFT: 30px; POSITION: relative\"><!-- Problem Desc --><tr><td class=\"sys-font-body-bold\">";
//				g_sXslText += L_ProblemDescription_Text + "</td></tr><tr><td class=\"sys-left-indented\"><textarea class=\"DisplayIssueTextForTextAreas\" readonly=\"true\" onresize=\"this.style.height=this.scrollHeight\"><xsl:value-of select=\"ProblemDesc\" /></textarea></td></tr><tr><td><BR /></td></tr><tr><td class=\"sys-font-body-bold\">";
//				g_sXslText += L_Resolutions_Text + "</td></tr><tr><td class=\"sys-left-indented\"><xsl:for-each select=\"Resolutions/Resolution\" ><textarea class=\"DisplayIssueTextForTextAreas\" readonly=\"true\" onresize=\"this.style.height=this.scrollHeight\" ><xsl:value-of select=\".\" /></textarea><hr color=\"#C0C0C0\" width=\"100%\" size=\"1\" /></xsl:for-each></td></tr><tr><td><BR /></td></tr><tr><td class=\"sys-font-body-bold\">";
//				g_sXslText += L_IssueAppliesTo_Text + "</td></tr><tr><td class=\"sys-left-indented\"><xsl:for-each select=\"AppliesTo/Platform\" ><li><xsl:value-of select=\".\" /></li></xsl:for-each></td></tr><tr><td><BR /></td></tr><xsl:if test=\"ExtraInfo/ExtraInfoItem\"><tr><td class=\"sys-font-body-bold\">";
//				g_sXslText += L_AdditionalInformation_Text + "</td></tr><xsl:for-each select=\"ExtraInfo/ExtraInfoItem\" ><tr><td class=\"sys-left-indented\"><xsl:value-of select=\".\"/></td></tr></xsl:for-each><tr><td><BR /></td></tr></xsl:if><tr><td class=\"sys-font-body-bold\">";
//				g_sXslText += L_DidThisResolveYourProblem_Text + "</td></tr><tr><td class=\"sys-left-indented\"><input class=\"button-width\" id=\"btnYes\" type=\"button\" value=\"Yes\" NAME=\"btnYes\"><xsl:attribute name=\"onclick\">fnPingUserResponse(<xsl:value-of select=\"IssueId\" />, true)</xsl:attribute></input><input class=\"sys-left-indented button-width\" id=\"btnNo\" type=\"button\" value=\"No\" NAME=\"btnNo\"><xsl:attribute name=\"onclick\">fnPingUserResponse(<xsl:value-of select=\"IssueId\" />, false)</xsl:attribute></input></td></tr><tr><td>";
//				g_sXslText += L_HelpImproveContent1_Text + "<a ><xsl:attribute name=\"href\">javascript:fnOpenPrivacy()</xsl:attribute>" + L_HelpImproveContent2_Text + "</a></td></tr><tr><td><BR /></td></tr>					</table>											</div><BR /></div>				</xsl:for-each>  <!-- end of for each Issue --></div> <!-- end of Category div --><BR/></xsl:for-each></SPAN>";


				// Load XSL
				var xslIssue = new ActiveXObject("Microsoft.XMLDOM");
				xslIssue.async = false;
				//xslIssue.loadXML(g_sXslText);
				xslIssue.load("en/IssuesXml.xsl");
				


				// Transform
				document.all["divMainIssuesContents"].innerHTML = "<BR>" + xmlIssue.transformNode(xslIssue);
//				fnResize();
			}

			function fnOpenPrivacy(){
				if (g_oLearnPrivacy == null) {
					g_oLearnPrivacy = window.showModelessDialog("privacy.aspx",window,"help:no;status:no;resizable:no;dialogWidth:500px;dialogHeight:400px" );
				}
			}

			function fnSetFooter()
			{
//				document.getElementById("divFooter").innerHTML = L_Copyright_Text + "&nbsp <a id=hrefCopyright href=\"" + L_Copyright_Address_Text + "\">" + L_TermsOfUse_Text + "</a> &nbsp; <a id=hrefAccessibility href=\"" + L_Accessibility_Address_Text + "\">" + L_Accessibility_Text + "</a> &nbsp;";
//				s = "<%= UIStringManager.StringResource.GetString("L_Copyright_Text", CultureInfo.CurrentCulture)%>"  + "&nbsp <a id=hrefCopyright href=\"" + "<%= UIStringManager.StringResource.GetString("L_Copyright_Address_Text", CultureInfo.CurrentCulture)%>"  + "\">" + "<%= UIStringManager.StringResource.GetString("L_TermsOfUse_Text", CultureInfo.CurrentCulture)%>"  + "</a> &nbsp; <a id=hrefAccessibility href=\"" + "<%= UIStringManager.StringResource.GetString("L_Accessibility_Address_Text", CultureInfo.CurrentCulture) %>" + "\">" + "<%= UIStringManager.StringResource.GetString("L_Accessibility_Text", CultureInfo.CurrentCulture) %>"  + "</a> &nbsp;
	  			window.document.all["divFooter"].innerHTML = FooterStrings;
//				document.getElementById("divFooter").innerHTML = Consumer.troubleshoot.troubleshooter.UIStringManager.StringResource.GetString("L_Copyright_Text", CultureInfo.CurrentCulture)  + "&nbsp <a id=hrefCopyright href=\"" + Consumer.troubleshoot.troubleshooter.UIStringManager.StringResource.GetString("L_Copyright_Address_Text", CultureInfo.CurrentCulture)  + "\">" + Consumer.troubleshoot.troubleshooter.UIStringManager.StringResource.GetString("L_TermsOfUse_Text", CultureInfo.CurrentCulture)  + "</a> &nbsp; <a id=hrefAccessibility href=\"" + Consumer.troubleshoot.troubleshooter.UIStringManager.StringResource.GetString("L_Accessibility_Address_Text", CultureInfo.CurrentCulture) + "\">" + Consumer.troubleshoot.troubleshooter.UIStringManager.StringResource.GetString("L_Accessibility_Text", CultureInfo.CurrentCulture)  + "</a> &nbsp;";


			}

			function fnResize()
			{
			    divMainIssuesContents.style.height = document.body.clientHeight - 82;
			}

		      function fnLoadTshoot()
                     {
                        // get the lang, load the IssuesString.inc and then transform the xml
                        fnGetLanguageSettings();
                        // to support future localization
                        //scriptStringsFile.src = g_sLang + "/IssuesStrings.inc";
//                        window.setTimeout("fnSetFooter()", 0);
                        window.setTimeout("fnLoadAndTransformXML()", 0); // we do window.setTimeout so that by then the corresponding strings.inc file is loaded as we use its variables here
                        g_sUserAgent = navigator.userAgent;
                        window.setTimeout("fnDoReporting()",1000);
                     }
/*Stats.Net Web Metrix Reporting*/

function fnDoReporting(){
	var ToolBar_Supported = false;
	var doImage = doImage;
	var TType = TType;
	if (navigator.userAgent.indexOf("MSIE")    != -1 && 
		navigator.userAgent.indexOf("Windows") != -1 && 
		navigator.appVersion.substring(0,1) > 3)
		{
			ToolBar_Supported = true;
		}

		if(doImage == null)
		{
			var a= new Array();
			a[0] = fnprepTrackingString(window.location.hostname,7);
			if (TType == null)
			{	
				a[1] = fnprepTrackingString('PV',8);
			}
			else
			{
				a[1] = fnprepTrackingString(TType,8);
			}
			a[2] = fnprepTrackingString(window.location.pathname,0);
			if( '' != window.document.referrer)
			{
				a[a.length] = fnprepTrackingString(window.document.referrer,5);
			}
			if (navigator.userAgent.indexOf("SunOS") == -1 && navigator.userAgent.indexOf("Linux") == -1)
			{
				fnbuildIMG(a);
			}
		}

}

function fnbuildIMG(pArr){

	var TG= window.location.protocol + "//c.microsoft.com/trans_pixel.asp?" ;
	for(var i=0; i<pArr.length; i++)
	{
		if(0 == i)
		{
			TG +=  pArr[i];
		}
		else
		{
			TG += '&' + pArr[i];
		}
	}
	
	document.all["eReporting"].src = TG ;
				
}

function fnprepTrackingString(ts, type){
	var rArray;
	var rString;
	var pName = '';
	if (0 == type)
	{
		pName = 'p=';
		rString = ts.substring(1);
		rArray = rString.split('/');
	}
	if (1 == type)
	{
		pName = 'qs=';
		rString = ts.substring(1);
		rArray = rString.split('&');		
	}
	if (2 == type)
	{
		pName = 'f=';
		rString = escape(ts);
		return pName + rString;
	}
	if (3 == type)
	{
		pName = 'tPage=';
		rString = escape(ts);
		return pName+rString;
	}
	if (4 == type)
	{
		pName = 'sPage=';
		rString = escape(ts);
		return pName + rString;
	}
	if (5 == type)
	{
		pName = 'r=';
		rString = escape(ts);
		return pName + rString;
	}
	if (6 == type)
	{
		pName = 'MSID=';
		rString = escape(ts);
		return pName + rString;
	}
	if (7 == type)
	{
		pName = 'source=';
		rString = ts.toLowerCase();
		if(rString.indexOf("microsoft.com") != -1)
		{
			rString = rString.substring(0,rString.indexOf("microsoft.com"));
			if('' == rString)
			{
				rString = "www";
			}	
			else
			{
				rString = rString.substring(0,rString.length -1);
			}
		}
		return pName + rString;
	}
	if (8 == type)
	{
		pName = 'TYPE=';
		rString = escape(ts);
		return pName + rString;
	}
	rString = '';
	if(null != rArray)
	{
		if(0 == type)
		{
			for( j=0; j < rArray.length - 1; j++)
			{	
				rString += rArray[j] + '_';  
			} 
		}
		else
		{
			for( j=0; j < rArray.length  ; j++)
			{
				rString += rArray[j] + '_';  
			} 
		}
	}
	rString = rString.substring(0, rString.length - 1);  	 	
	return pName + rString;
}

/*Stats.Net Web Metrix Reporting*/


