
<script language="javascript">

/*function window::onResize() {
	fnPositionCopyrightLink()
}*/
function window::onload(){
	
if(!parent.conDevServer){
		document.ondragstart = new Function("return false;");
		document.oncontextmenu = new Function("return false;");
	}
	//document.oncontextmenu = new Function("return false;");
}
function checkrightclick(){
event.cancelBubble=true;
return true;
}
/*function fnPositionCopyrightLink(){
	eCopyright.style.position = "static";
	var tmr = window.setTimeout("fnPCL()",1000);
	eCopyright.style.display = "none";
}*/


function fnPCL() {
	var iContentHeight, iAvailableHeight;
	
	eCopyright.style.position = "static";
	iContentHeight = document.body.scrollHeight;
	iAvailableHeight = document.body.offsetHeight;

	if(iContentHeight <= (iAvailableHeight - 25)){
		eCopyright.style.position = "absolute";
		eCopyright.style.top = "auto";
		eCopyright.style.bottom = "0px";
	}else{
		eCopyright.style.position = "static";
	}
	eCopyright.style.display = "block"
	//window.status = "contentHeight=" + iContentHeight + ", AvailableHeight=" + iAvailableHeight + ", position=" + eCopyright.style.position
}


/* for sorting the the language*/
function sortlanguage(selectname,formname){
	var iTxt = new Array();
	var sTxt = new Array();
	var nLang = 25;

	iTxt[0]="Arabic" + "@" + "ar|1256"
	//iTxt[1]="Arabic enabled" + "@" + "en_arabic|1252"
	iTxt[1]="Turkish" + "@" + "tr|1254"
	iTxt[2]="Chinese Simplified " + "@" + "zhcn|936"
	iTxt[3]="Chinese Traditional " + "@" + "zhtw|950"
	iTxt[4]="Czech" + "@" + "cs|1250"
	iTxt[5]="Danish" + "@" + "da|1252"
	iTxt[6]="Dutch" + "@" + "nl|1252"
	iTxt[7]="English" + "@" + "en|1252"
	iTxt[8]="Finnish" + "@" + "fi|1252"
	iTxt[9]="French" + "@" + "fr|1252"
	iTxt[10]="German" + "@" + "de|1252"
	iTxt[11]="Greek" + "@" + "el|1253"
	//iTxt[12]="Greek IBM" + "@" + "el_ibm|869"
	iTxt[12]="Swedish" + "@" + "sv|1252"
	iTxt[13]="Hebrew" + "@" + "he|1255"
	//iTxt[14]="Hebrew enabled" + "@" + "en_hebrew|1252"
	iTxt[14]="Spanish" + "@" + "es|1252"
	iTxt[15]="Hungarian" + "@" + "hu|1250"
	iTxt[16]="Italian" + "@" + "it|1252"
	iTxt[17]="Japanese" + "@" + "ja|932"
	iTxt[18]="Japanese NEC" + "@" + "nec|932"
	iTxt[19]="Korean" + "@" + "ko|949"
	iTxt[20]="Norwegian" + "@" + "no|1252"
	iTxt[21]="Polish" + "@" + "pl|1250"
	iTxt[22]="Portuguese (Brazilian)" + "@" + "ptbr|1252"
	iTxt[23]="Portuguese (Standard)" + "@" + "pt|1252"
	iTxt[24]="Russian" + "@" + "ru|1251"
	//iTxt[25]="Slovak" + "@" + "sk|1250"
	//iTxt[26]="Slovenian" + "@" + "sl|1250"
	
	
	//iTxt[29]="Thai enabled" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="en"
	
	s += "<select NAME='" + selectname + "' ID='" + selectname + "' onchange='sethiddendata(" + selectname + "," + formname + ")'>"
	for(i=0; i < nLang; i++) {	
		a = jTxt[i].split("@")
		aa=a[1].split("|")
		if (aa[0].toLowerCase( )== lan.toLowerCase( )){
			s += "<option VALUE=" + a[1] + " Selected>" + a[0] + "</option>"
		}
		else{
			s += "<option VALUE=" + a[1] + ">" + a[0] + "</option>"
		}
		
	}
	s += "</select>"	
	
	languagecont.innerHTML=s
	HSelLang = eval(formname + ".HSelLang")
	if (HSelLang.value != 0 ){
		selecttext=eval(formname + "."  + selectname)		
		selecttext.value=HSelLang.value
	}
	
}


/*for sorting the the language*/

function sethiddendata(selectname,formname){
	HSelLang = eval(formname.name + ".HSelLang")	
	HSelLang.value=selectname.value	
}

</script><html >
<head>
<title>Microsoft Windows Update</title>
<meta NAME="robots" CONTENT="noindex">
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'>
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="/catalog/shared/css/content.css">
<link rel="stylesheet" type="text/css" href="hcp://system/css/shared.css" />
<script type="text/jscript" language="jscript" src="\shared\js\top.js"></script>
<script type="text/jscript">

function ESC_KeyDown() {
    //if the user presses the ESC key, close the window.
    if( 27 == event.keyCode ) {
        self.close();
    }
}
    conKB = 1024;
    conMB = 1048576;

    var MB="MB"
    var KB="KB"
    iSize = 
    function FormatSize(){
            if (iSize >= conMB) {
                Size = Math.round(iSize/conMB) + " " + MB
            }else{
                Size = Math.round(iSize/conKB) + " " + KB
            }
            return Size;
        }

        function window.onload(){
            hsize.innerText=FormatSize();
        }
</script>
<script language="vbscript">
    Function vbsToLocaleDateString(sDate)
    vbsToLocaleDateString = FormatDateTime(CDate(sDate), vbLongDate)
End Function
</script>

</head>
<body onkeydown="ESC_KeyDown();" scroll="no" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">
<div id="sizediv" name="sizediv">
<table id="eHeaderTbl" width="96%" style="margin-bottom:5px;" border=0 >
    <tr>
        <td id="eHeaderTD" width="90%">
            <span id="eHeaderSpn" class="Title sys-font-heading3 sys-rhp-color-title"></span></td>
        <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
    </tr>
</table>


<table cellpadding=5 cellspacing=0 width="96%"  class="sys-table-color-border ">


    <tr>
        <td width="20%" align="left" valign="top" class="8pt details_td1 sys-font-body sys-color-body sys-table-color-border ">
            <b>Location:</td>
        <td width="80%"  align="left" valign="top" class="8pt details_td2 sys-font-body sys-color-body sys-table-color-border">
            <span id="hdownloaded"></span><span id="ahdownloaded"></span></td>
    </tr>



<tr>
    <td  align="left" valign="top"class="8pt details_td1 sys-font-body sys-color-body sys-table-color-border ">
        <b>Read More:</td>
    <td  align="left" valign="top" class="8pt details_td2 sys-font-body sys-color-body sys-table-color-border">
        <span id="hreadmore"></span><a id="ahreadmore" href="" class="sys-link-normal" ></a></td>
</tr>



<tr>
    <td align="left" valign="top"class="8pt details_td1 sys-font-body sys-color-body sys-table-color-border ">
        <b>Platform:</td>
    <td  align="left" valign="top" class="8pt details_td2 sys-font-body sys-color-body sys-table-color-border">
        <span id="hplatform"></span></td>
</tr>
<tr>
    <td  align="left" valign="top" class="8pt details_td1 sys-font-body sys-color-body sys-table-color-border ">
        <b>Language:</td>
    <td align="left" valign="top" class="8pt details_td2 sys-font-body sys-color-body sys-table-color-border">
        
			&nbsp;</td>
		
</tr>
<tr>
    <td  align="left" valign="top"class="8pt details_td1 sys-font-body sys-color-body sys-table-color-border ">
        <b>Manufacturer:</td>
    <td  align="left" valign="top" class="8pt details_td2 sys-font-body sys-color-body sys-table-color-border">
        <span id="hmanuyfacturer"></span></td>
</tr>
<tr>
    <td  align="left" valign="top"class="8pt details_td1 sys-font-body sys-color-body sys-table-color-border ">
        <b>Date Posted:</td>
    <td align="left" valign="top" class="8pt details_td2 sys-font-body sys-color-body sys-table-color-border">
        <span id="hdateposted"></span></td>
</tr>
<tr>
    <td  align="left" valign="top" class="8pt details_td3 sys-font-body sys-color-body sys-table-color-border">
        <b>Size:</td>
    <td align="left" valign="top"  class="8pt details_td4 sys-font-body sys-color-body sys-table-color-border">
        <span id="hsize"></span></td>
</tr>

</table>


     <button id="ePrintBtn" onresize="document.recalc('true')"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'  onclick="window.print();">  <span id="printspan" name="printspan">Print</span></button>
     <button id="ePrintBtn" onresize="document.recalc('true')"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:35px;'  onclick="window.close();"> Close</button>

</div>
</body>

</html>
<script language="javascript">


function window::onLoad() {
window.dialogHeight=(sizediv.offsetHeight + 120) + "px"  ;

}
var timestamp=""
var id=""
var oUpdate=window.dialogArguments[0].g_oInstallationXML.selectSingleNode("itemStatus[identity/@itemID='" + id + "' $and$ @timestamp='" +  timestamp +"']" )

//for title
eHeaderSpn.innerText=oUpdate.selectSingleNode("description/descriptionText/title").text


//for download path
var bSuccessful = (oUpdate.selectSingleNode("downloadStatus[@value = 'COMPLETE']") != null);
if(bSuccessful){
    ahdownloaded.innerText=oUpdate.selectSingleNode("downloadPath").text
    //ahdownloaded.href=oUpdate.selectSingleNode("downloadPath").text
    ahdownloaded.title=oUpdate.selectSingleNode("downloadPath").text
}else{
    hdownloaded.innerText = "Failed to download"
    if(oUpdate.selectSingleNode("downloadStatus/@errorCode").text == "-2147467260")
    {
    hdownloaded.innerText = "Cancelled download"
    }
}

//for date posted
var sDatePosted=oUpdate.selectSingleNode("description/@timestamp").text

sDatePosted = sDatePosted.substring(0, 10);
sDatePosted = vbsToLocaleDateString(sDatePosted);
hdateposted.innerText = sDatePosted


//for manufacturer
hmanuyfacturer.innerText=oUpdate.selectSingleNode("identity/publisherName").text


//for read more
var detailsNode=oUpdate.selectSingleNode("description/descriptionText/details/@href");
if(detailsNode == null ) {
    hreadmore.innerText=" ";
    ahreadmore.style.display = "none";
} else {

    ahreadmore.innerText = "Read More..."
    ahreadmore.readMoreUrl = detailsNode.text;
    ahreadmore.attachEvent("onclick",fnShowReadMore);
    hreadmore.style.display="none"

    if(parent.conLangCode != "en"){
    	var oText = document.createTextNode(" (This site may be in English.)");
    	ahreadmore.parentElement.appendChild(oText);
    }
}


</script>