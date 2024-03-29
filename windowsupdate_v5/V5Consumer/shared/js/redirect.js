
	var UA = navigator.userAgent.toLowerCase();
	var neededSite = 3;
	var IE5or6 = ((UA.indexOf("msie 5") > 0) || (UA.indexOf("msie 6") > 0));
	var unsupported = false;
	var oWUWeb;

	if((UA.indexOf("windows nt 5.0") != -1) && (UA.indexOf("; data center") != -1)) unsupported = true;	 //Windows 2000 datacenter
	if(UA.indexOf("; mspie") != -1) unsupported = true;         // windows ce
	if(UA.indexOf("opera") != -1) unsupported = true;           // opera

	if(!IE5or6 || unsupported)
	{
		if(curSite == 4) location.href = "thanks.asp";
		else location.href = "http://V4.WindowsUpdate.microsoft.com";
	}
	else
	{
		//Set neededSite based on the OS reported in the user agent string
		if(UA.indexOf("windows 95") > 0) neededSite = 3;
		else if(UA.indexOf("windows 98") > 0) neededSite = 4;
		else if(UA.indexOf("windows nt 4.0") > 0) neededSite = 3;
		else if(UA.indexOf("windows nt 5.0") > 0) neededSite = 5;
		else if(UA.indexOf("windows nt 5.1") > 0) neededSite = 5;
		else if(UA.indexOf("windows nt 5.2") > 0) neededSite = 5;

		//Go to neededSite
		if(neededSite == 3)
		{
			if(curSite == 3)
			{
			//YOU ARE ON V3
				document.open();
				document.write("<FRAMESET ROWS=100%>");
				if(UA.indexOf("windows 95") > 0)  // Windows 95
				{
						document.write("<FRAME SRC=\"Static_w95/V31site/default.htm" + location.search + "\">");
				}
				else  // Windows NT
				{
					if(location.search == "" || location.search == null)
					{
						document.write("<FRAME SRC=\"scripts/redir.dll?\">");
					}
					else
					{
						document.write("<FRAME SRC=\"R1150/V31site/default.htm" + location.search + "\">");
					}
				}
				document.write("</FRAMESET>");
				document.close();
			}
			else
			{
				// not on v3, go there
				window.location.replace("http://WindowsUpdate.microsoft.com");
			}
		}
		else if(neededSite == 4)
		{
			if(curSite == 4)
			{
				//YOU ARE ON V4
			}
			else
			{
				window.location.replace("http://V4.WindowsUpdate.microsoft.com/default.asp");
			}
		}
		else
		{
			var OSLang = navigator.browserLanguage;
			
			//Revised for test version
			try {
				oWUWeb = new ActiveXObject("SoftwareDistribution.WebControl");
			}
			catch(e) {
				//Failed to create V5 control
				oWUWeb = "";
				neededSite = 4;
			}
			if("object" == typeof(oWUWeb))
			{
				try {
					var iTmp = oWUWeb.GetDownloadSpeed();
					neededSite = 51;
				} 
				catch(e) {
					if(e.number == -2147418113) { // 0x8000FFFF
						neededSite = 51;
					}
				}
			}
			oWUWeb = null;
			// Now redirect as necessary
			if(neededSite == 4) 
			{
				window.location.replace("http://V4.WindowsUpdate.microsoft.com/default.asp");
			} 
			else if(neededSite == 5 && curSite != 5)
			{	
				window.location.replace("http://v5.WindowsUpdate.microsoft.com/V5Consumer/default.aspx?ln=" + OSLang);
			}
			else if(neededSite == 51 && curSite == 5) 
			{
				window.location.replace("http://Test.v5.WindowsUpdate.microsoft.com/V5Consumer/default.aspx?ln=" + OSLang);
			}
			
			// Revised for test version
		}
	}
