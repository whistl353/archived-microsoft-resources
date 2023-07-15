
/* This Function populates the array g_aUpdateEvents with chunks of history data in pieces of 10 starting with index iLowerLimit */

function fnGetHistoryEventData(iLowerLimit) {
	
	
	/*
	try {
			g_oUpdateSearcher = parent.g_oControl.CreateObject("Microsoft.Update.Searcher");
			g_aUpdateEvents =g_ oUpdateSearcher.QueryEventHistory(null,g_iRecordsPerView,iLowerLimit);
	}	
	catch(e){
			parent.fnDisplayErrorPage(e.number, true);
			return false ;
	}
	*/
	
	//* Test Code *//
	var i;
	
	g_aTemp[0] = new String();
	g_aTemp[0].Date = "2003-02-24T14:01:09" ;
    g_aTemp[0].ResultCode = 0 ;
	g_aTemp[0].Title = "Windows Security Patch(French)" ;
	g_aTemp[0].UpdateIdentity = "" ;
	
	g_aTemp[1] = new String();
	g_aTemp[1].Date = "2003-02-23T14:01:09" ;
    g_aTemp[1].ResultCode = 1 ;
	g_aTemp[1].Title = "Media Player Speeder" ;
	g_aTemp[1].UpdateIdentity = "" ;
	
	g_aTemp[2] = new String();
	g_aTemp[2].Date = "2003-02-22T14:01:09" ;
    g_aTemp[2].ResultCode = 0 ;
	g_aTemp[2].Title = "Office Templates" ;
	g_aTemp[2].UpdateIdentity = "" ;
	
	g_aTemp[3] = new String();
	g_aTemp[3].Date = "2003-02-21T14:01:09" ;
    g_aTemp[3].ResultCode = 2 ;
	g_aTemp[3].Title = "Exchnage Security Update" ;
	g_aTemp[3].UpdateIdentity = "" ;
	
	g_aTemp[4] = new String();
	g_aTemp[4].Date = "2003-02-20T14:01:09" ;
    g_aTemp[4].ResultCode = 1 ;
	g_aTemp[4].Title = "Windows XP" ;
	g_aTemp[4].UpdateIdentity = "" ;
	
	g_aTemp[5] = new String();
	g_aTemp[5].Date = "2003-02-19T14:01:09" ;
    g_aTemp[5].ResultCode = 3 ;
	g_aTemp[5].Title = "SQL Slammer" ;
	g_aTemp[5].UpdateIdentity = "" ;
	
	g_aTemp[6] = new String();
	g_aTemp[6].Date = "2003-02-18T14:01:09" ;
    g_aTemp[6].ResultCode = 1 ;
	g_aTemp[6].Title = "Office Update" ;
	g_aTemp[6].UpdateIdentity = "" ;
	
	g_aTemp[7] = new String();
	g_aTemp[7].Date = "2003-02-17T14:01:09" ;
    g_aTemp[7].ResultCode = 0 ;
	g_aTemp[7].Title = "Windows 2000" ;
	g_aTemp[7].UpdateIdentity = "" ;
	
	g_aTemp[8] = new String();
	g_aTemp[8].Date = "2003-02-16T14:01:09" ;
    g_aTemp[8].ResultCode = 2 ;
	g_aTemp[8].Title = "Media Player" ;
	g_aTemp[8].UpdateIdentity = "" ;
			
	g_aTemp[9] = new String();
	g_aTemp[9].Date = "2003-02-15T14:01:09" ;
    g_aTemp[9].ResultCode = 3 ;
	g_aTemp[9].Title = "Windows SP1" ;
	g_aTemp[9].UpdateIdentity = "" ; 
	
	g_aTemp[10] = new String();
	g_aTemp[10].Date = "2003-02-15T14:01:09" ;
    g_aTemp[10].ResultCode = 3 ;
	g_aTemp[10].Title = "Windows SP10" ;
	g_aTemp[10].UpdateIdentity = "" ; 
	
	g_aTemp[11] = new String();
	g_aTemp[11].Date = "2003-02-15T14:01:09" ;
    g_aTemp[11].ResultCode = 3 ;
	g_aTemp[11].Title = "Windows SP11" ;
	g_aTemp[11].UpdateIdentity = "" ; 
	
	g_aTemp[12] = new String();
	g_aTemp[12].Date = "2003-02-15T14:01:09" ;
    g_aTemp[12].ResultCode = 3 ;
	g_aTemp[12].Title = "Windows SP12" ;
	g_aTemp[12].UpdateIdentity = "" ; 
	
	g_aTemp[13] = new String();
	g_aTemp[13].Date = "2003-02-15T14:01:09" ;
    g_aTemp[13].ResultCode = 3 ;
	g_aTemp[13].Title = "Windows SP13" ;
	g_aTemp[13].UpdateIdentity = "" ;
	 
	g_aTemp[14] = new String();
	g_aTemp[14].Date = "2003-02-15T14:01:09" ;
    g_aTemp[14].ResultCode = 3 ;
	g_aTemp[14].Title = "Windows SP14" ;
	g_aTemp[14].UpdateIdentity = "" ; 
	
	g_aTemp[15] = new String();
	g_aTemp[15].Date = "2003-02-15T14:01:09" ;
    g_aTemp[15].ResultCode = 3 ;
	g_aTemp[15].Title = "Windows SP15" ;
	g_aTemp[15].UpdateIdentity = "" ; 
	
	g_aTemp[16] = new String();
	g_aTemp[16].Date = "2003-02-15T14:01:09" ;
    g_aTemp[16].ResultCode = 3 ;
	g_aTemp[16].Title = "Windows SP16" ;
	g_aTemp[16].UpdateIdentity = "" ; 
	
	g_aTemp[17] = new String();
	g_aTemp[17].Date = "2003-02-15T14:01:09" ;
    g_aTemp[17].ResultCode = 3 ;
	g_aTemp[17].Title = "Windows SP17" ;
	g_aTemp[17].UpdateIdentity = "" ; 
	
	g_aTemp[18] = new String();
	g_aTemp[18].Date = "2003-02-15T14:01:09" ;
    g_aTemp[18].ResultCode = 3 ;
	g_aTemp[18].Title = "Windows SP18" ;
	g_aTemp[18].UpdateIdentity = "" ; 
	
	g_aTemp[19] = new String();
	g_aTemp[19].Date = "2003-02-15T14:01:09" ;
    g_aTemp[19].ResultCode = 3 ;
	g_aTemp[19].Title = "Windows SP19" ;
	g_aTemp[19].UpdateIdentity = "" ; 
	
	g_aTemp[20] = new String();
	g_aTemp[20].Date = "2003-02-15T14:01:09" ;
    g_aTemp[20].ResultCode = 3 ;
	g_aTemp[20].Title = "Windows SP20" ;
	g_aTemp[20].UpdateIdentity = "" ; 
	
	g_aTemp[21] = new String();
	g_aTemp[21].Date = "2003-02-15T14:01:09" ;
    g_aTemp[21].ResultCode = 3 ;
	g_aTemp[21].Title = "Windows SP21" ;
	g_aTemp[21].UpdateIdentity = "" ; 
	
	g_aTemp[22] = new String();
	g_aTemp[22].Date = "2003-02-15T14:01:09" ;
    g_aTemp[22].ResultCode = 3 ;
	g_aTemp[22].Title = "Windows SP22" ;
	g_aTemp[22].UpdateIdentity = "" ;
	 
	g_aTemp[23] = new String();
	g_aTemp[23].Date = "2003-02-15T14:01:09" ;
    g_aTemp[23].ResultCode = 3 ;
	g_aTemp[23].Title = "Windows SP23" ;
	g_aTemp[23].UpdateIdentity = "" ; 
	
	g_aTemp[24] = new String();
	g_aTemp[24].Date = "2003-02-15T14:01:09" ;
    g_aTemp[24].ResultCode = 3 ;
	g_aTemp[24].Title = "Windows SP24" ;
	g_aTemp[24].UpdateIdentity = "" ; 
	
	g_aTemp[25] = new String();
	g_aTemp[25].Date = "2003-02-15T14:01:09" ;
    g_aTemp[25].ResultCode = 3 ;
	g_aTemp[25].Title = "Windows SP25" ;
	g_aTemp[25].UpdateIdentity = "" ; 
	
	g_aTemp[26] = new String();
	g_aTemp[26].Date = "2003-02-15T14:01:09" ;
    g_aTemp[26].ResultCode = 3 ;
	g_aTemp[26].Title = "Windows SP26" ;
	g_aTemp[26].UpdateIdentity = "" ; 
	
	g_aTemp[27] = new String();
	g_aTemp[27].Date = "2003-02-15T14:01:09" ;
    g_aTemp[27].ResultCode = 3 ;
	g_aTemp[27].Title = "Windows SP27" ;
	g_aTemp[27].UpdateIdentity = "" ; 
	
	g_aTemp[28] = new String();
	g_aTemp[28].Date = "2003-02-15T14:01:09" ;
    g_aTemp[28].ResultCode = 3 ;
	g_aTemp[28].Title = "Windows SP28" ;
	g_aTemp[28].UpdateIdentity = "" ; 
	
	g_aTemp[29] = new String();
	g_aTemp[29].Date = "2003-02-15T14:01:09" ;
    g_aTemp[29].ResultCode = 3 ;
	g_aTemp[29].Title = "Windows SP29" ;
	g_aTemp[29].UpdateIdentity = "" ; 
	
	g_aTemp[30] = new String();
	g_aTemp[30].Date = "2003-02-15T14:01:09" ;
    g_aTemp[30].ResultCode = 3 ;
	g_aTemp[30].Title = "Windows SP30" ;
	g_aTemp[30].UpdateIdentity = "" ; 
	
	g_aTemp[31] = new String();
	g_aTemp[31].Date = "2003-02-15T14:01:09" ;
    g_aTemp[31].ResultCode = 3 ;
	g_aTemp[31].Title = "Windows SP31" ;
	g_aTemp[31].UpdateIdentity = "" ; 
	
	g_aTemp[32] = new String();
	g_aTemp[32].Date = "2003-02-15T14:01:09" ;
    g_aTemp[32].ResultCode = 3 ;
	g_aTemp[32].Title = "Windows SP32" ;
	g_aTemp[32].UpdateIdentity = "" ; 
	
	g_aTemp[33] = new String();
	g_aTemp[33].Date = "2003-02-15T14:01:09" ;
    g_aTemp[33].ResultCode = 3 ;
	g_aTemp[33].Title = "Windows SP33" ;
	g_aTemp[33].UpdateIdentity = "" ; 
	
	g_aTemp[34] = new String();
	g_aTemp[34].Date = "2003-02-15T14:01:09" ;
    g_aTemp[34].ResultCode = 3 ;
	g_aTemp[34].Title = "Windows SP34" ;
	g_aTemp[34].UpdateIdentity = "" ; 
	
	g_aTemp[35] = new String();
	g_aTemp[35].Date = "2003-02-15T14:01:09" ;
    g_aTemp[35].ResultCode = 3 ;
	g_aTemp[35].Title = "Windows SP35" ;
	g_aTemp[35].UpdateIdentity = "" ; 
	
	g_aTemp[36] = new String();
	g_aTemp[36].Date = "2003-02-15T14:01:09" ;
    g_aTemp[36].ResultCode = 3 ;
	g_aTemp[36].Title = "Windows SP36" ;
	g_aTemp[36].UpdateIdentity = "" ; 
	
	g_aTemp[37] = new String();
	g_aTemp[37].Date = "2003-02-15T14:01:09" ;
    g_aTemp[37].ResultCode = 3 ;
	g_aTemp[37].Title = "Windows SP37" ;
	g_aTemp[37].UpdateIdentity = "" ; 
	
	g_aTemp[38] = new String();
	g_aTemp[38].Date = "2003-02-15T14:01:09" ;
    g_aTemp[38].ResultCode = 3 ;
	g_aTemp[38].Title = "Windows SP38" ;
	g_aTemp[38].UpdateIdentity = "" ; 
	
	
	g_aTemp[39] = new String();
	g_aTemp[39].Date = "2003-02-15T14:01:09" ;
    g_aTemp[39].ResultCode = 3 ;
	g_aTemp[39].Title = "Windows SP39" ;
	g_aTemp[39].UpdateIdentity = "" ; 
	
	g_aTemp[40] = new String();
	g_aTemp[40].Date = "2003-02-15T14:01:09" ;
    g_aTemp[40].ResultCode = 3 ;
	g_aTemp[40].Title = "Windows SP40" ;
	g_aTemp[40].UpdateIdentity = "" ; 
	
	g_aTemp[41] = new String();
	g_aTemp[41].Date = "2003-02-15T14:01:09" ;
    g_aTemp[41].ResultCode = 3 ;
	g_aTemp[41].Title = "Windows SP41" ;
	g_aTemp[41].UpdateIdentity = "" ; 
	
	g_aTemp[42] = new String();
	g_aTemp[42].Date = "2003-02-15T14:01:09" ;
    g_aTemp[42].ResultCode = 3 ;
	g_aTemp[42].Title = "Windows SP42" ;
	g_aTemp[42].UpdateIdentity = "" ; 
	
	g_aTemp[43] = new String();
	g_aTemp[43].Date = "2003-02-15T14:01:09" ;
    g_aTemp[43].ResultCode = 3 ;
	g_aTemp[43].Title = "Windows SP43" ;
	g_aTemp[43].UpdateIdentity = "" ; 
	
	g_aTemp[44] = new String();
	g_aTemp[44].Date = "2003-02-15T14:01:09" ;
    g_aTemp[44].ResultCode = 3 ;
	g_aTemp[44].Title = "Windows SP44" ;
	g_aTemp[44].UpdateIdentity = "" ; 
	
	g_aTemp[45] = new String();
	g_aTemp[45].Date = "2003-02-15T14:01:09" ;
    g_aTemp[45].ResultCode = 3 ;
	g_aTemp[45].Title = "Windows SP45" ;
	g_aTemp[45].UpdateIdentity = "" ; 
	
	g_aTemp[46] = new String();
	g_aTemp[46].Date = "2003-02-15T14:01:09" ;
    g_aTemp[46].ResultCode = 3 ;
	g_aTemp[46].Title = "Windows SP46" ;
	g_aTemp[46].UpdateIdentity = "" ; 
	
	g_aTemp[47] = new String();
	g_aTemp[47].Date = "2003-02-15T14:01:09" ;
    g_aTemp[47].ResultCode = 3 ;
	g_aTemp[47].Title = "Windows SP47" ;
	g_aTemp[47].UpdateIdentity = "" ; 
	
	g_aTemp[48] = new String();
	g_aTemp[48].Date = "2003-02-15T14:01:09" ;
    g_aTemp[48].ResultCode = 3 ;
	g_aTemp[48].Title = "Windows SP48" ;
	g_aTemp[48].UpdateIdentity = "" ; 
	
	g_aTemp[49] = new String();
	g_aTemp[49].Date = "2003-02-15T14:01:09" ;
    g_aTemp[49].ResultCode = 3 ;
	g_aTemp[49].Title = "Windows SP49" ;
	g_aTemp[49].UpdateIdentity = "" ; 
	
	g_aTemp[50] = new String();
	g_aTemp[50].Date = "2003-02-15T14:01:09" ;
    g_aTemp[50].ResultCode = 3 ;
	g_aTemp[50].Title = "Windows SP50" ;
	g_aTemp[50].UpdateIdentity = "" ; 
	
	g_aTemp[51] = new String();
	g_aTemp[51].Date = "2003-02-15T14:01:09" ;
    g_aTemp[51].ResultCode = 3 ;
	g_aTemp[51].Title = "Windows SP51" ;
	g_aTemp[51].UpdateIdentity = "" ; 
	
	
	
	
	g_aUpdateEvents.length = 0 ; //Empty this array before populating again on clicking the Paging Links.
	
	for (i = 0 ;i < g_iRecordsPerView ; i++)
	{
		g_aUpdateEvents[i] = new String();
		g_aUpdateEvents[i].Date = g_aTemp[iLowerLimit].Date ;
		g_aUpdateEvents[i].Description = g_aTemp[iLowerLimit].Description ;    
		g_aUpdateEvents[i].Exception = g_aTemp[iLowerLimit] ;
		g_aUpdateEvents[i].Operation = g_aTemp[iLowerLimit].Operation ;
		g_aUpdateEvents[i].ClientApplicationID = g_aTemp[iLowerLimit].ClientApplicationID ;
		g_aUpdateEvents[i].ResultCode = g_aTemp[iLowerLimit].ResultCode ;
		g_aUpdateEvents[i].ServerSelection = g_aTemp[iLowerLimit].ServerSelection ;
		g_aUpdateEvents[i].Title = g_aTemp[iLowerLimit].Title ;
		g_aUpdateEvents[i].UpdateIdentity = g_aTemp[iLowerLimit].UpdateIdentity ; 
		if (g_aTemp[iLowerLimit + 1] == null) break ;  // e.g if last paging link 51-54 is clicked
		else iLowerLimit ++ ;
	}
	
	
	//* Test Code *//
			
	}
