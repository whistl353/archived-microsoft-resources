
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

	iTxt[0]="arabia" + "@" + "ar|1256"
	//iTxt[1]="arabia otettu k‰yttˆˆn" + "@" + "en_arabic|1252"
	iTxt[1]="turkki" + "@" + "tr|1254"
	iTxt[2]="yksinkertaistettu kiina " + "@" + "zhcn|936"
	iTxt[3]="perinteinen kiina " + "@" + "zhtw|950"
	iTxt[4]="tsekki" + "@" + "cs|1250"
	iTxt[5]="tanska" + "@" + "da|1252"
	iTxt[6]="hollanti" + "@" + "nl|1252"
	iTxt[7]="englanti" + "@" + "en|1252"
	iTxt[8]="suomi" + "@" + "fi|1252"
	iTxt[9]="ranska" + "@" + "fr|1252"
	iTxt[10]="saksa" + "@" + "de|1252"
	iTxt[11]="kreikka" + "@" + "el|1253"
	//iTxt[12]="kreikka (IBM)" + "@" + "el_ibm|869"
	iTxt[12]="ruotsi" + "@" + "sv|1252"
	iTxt[13]="heprea" + "@" + "he|1255"
	//iTxt[14]="heprea otettu k‰yttˆˆn" + "@" + "en_hebrew|1252"
	iTxt[14]="espanja" + "@" + "es|1252"
	iTxt[15]="unkari" + "@" + "hu|1250"
	iTxt[16]="italia" + "@" + "it|1252"
	iTxt[17]="japani" + "@" + "ja|932"
	iTxt[18]="japani (NEC)" + "@" + "nec|932"
	iTxt[19]="korea" + "@" + "ko|949"
	iTxt[20]="norja" + "@" + "no|1252"
	iTxt[21]="puola" + "@" + "pl|1250"
	iTxt[22]="portugali (Brasilia)" + "@" + "ptbr|1252"
	iTxt[23]="portugali (standardi)" + "@" + "pt|1252"
	iTxt[24]="ven‰j‰" + "@" + "ru|1251"
	//iTxt[25]="slovakki" + "@" + "sk|1250"
	//iTxt[26]="sloveeni" + "@" + "sl|1250"
	
	
	//iTxt[29]="thai otettu k‰yttˆˆn" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="fi"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'>
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="/catalog/shared/css/content.css">
<link rel="stylesheet" type="text/css" href="hcp://system/css/shared.css" />
<script type="text/jscript">
function ESC_KeyDown()
{
              //if the user presses the ESC key, close the window.

                if( 27 == event.keyCode )
                {
		self.close();
	}
}

function window::onbeforeunload()
{
	window.dialogArguments.g_oLearnMoreDlg = null;
}
</script>
</head>
<body onkeydown="ESC_KeyDown();" scroll="no"  style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;padding:10px;"class="8pt sys-font-body sys-color-body">
<table id="eHeaderTbl" width="100%" style="margin-bottom:25px;" border=0>
<tr>
     <td id="eHeaderTD" width="80%">
          <span id="eHeaderSpn" class="Title sys-font-heading3 sys-rhp-color-title">
               Sanojen k‰ytt‰minen Windows Update -luetteloon kohdistuvan etsinn‰n rajoittamiseksi
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Kun lis‰‰t etsint‰‰n tietyt sanat, etsinn‰n tuloksissa n‰kyv‰t vain p‰ivitykset, joiden otsikoissa tai kuvauksissa esiintyy ainakin kerran kaikki lis‰‰m‰si sanat siin‰ j‰rjestyksess‰, jossa ne kirjoitit.
</p>

<P>Jos esimerkiksi kirjoitat <B>Windowsin komentosarjojen tuki</B>, etsint‰toiminto n‰ytt‰‰ p‰ivitykset, joiden otsikossa tai tekstiss‰ on tarkalleen t‰m‰ merkkijono.
</p>
<P>Muita vihjeit‰ sanojen k‰ytt‰miseksi etsinn‰n rajoittamisessa:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Jos etsint‰ ei lˆyd‰ haluamaasi kohdetta, yrit‰ k‰ytt‰‰ muita samaa tarkoittavia sanoja (kirjoita esimerkiksi "Internet" sen sijaan, ett‰ kirjoittaisit "Web").</li>
		<li>Etsint‰toiminto huomioi kaikki v‰limerkit, jotka kirjoitat kyselyyn. </li>
		<li>Etsint‰toiminto ei ota huomioon kirjainkokoa: <B>Windowsin komentosarjojen tuki</B> antaa saman tuloksen kuin <B>windowsin komentosarjojen tuki</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Tulosta</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Sulje</button>
</body>
</html>
