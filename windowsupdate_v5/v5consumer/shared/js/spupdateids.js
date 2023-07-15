//Copyright (c) Microsoft Corporation.  All rights reserved.
var g_bSPDetectOn = true; // turn SP detection  
var g_bSPCoolOff = false;//cool off SP
var g_bSPAU = false;//get SP from AU
var spUpdateIds = new Array();
fnInitSPArray();

function fnInitSPArray(){
	
	if (g_bSPDetectOn){
		spUpdateIds[0] = "7477af62-8f9b-4f32-9daf-7ab452e52396"; // 2180
		spUpdateIds[1] = "8637dfe0-0a70-4b3d-bdfb-9790d0835182"; // 2180 non-au bundle guid - since 20040819
	}
	else {
		spUpdateIds.length = 0 ;
	}	
}	
