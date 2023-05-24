
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

	iTxt[0]="Αραβικά" + "@" + "ar|1256"
	//iTxt[1]="Ενεργοποίηση αραβικών" + "@" + "en_arabic|1252"
	iTxt[1]="Τουρκικά" + "@" + "tr|1254"
	iTxt[2]="Απλοποιημένα κινέζικα " + "@" + "zhcn|936"
	iTxt[3]="Παραδοσιακά κινέζικα " + "@" + "zhtw|950"
	iTxt[4]="Τσεχικά" + "@" + "cs|1250"
	iTxt[5]="Δανικά" + "@" + "da|1252"
	iTxt[6]="Ολλανδικά" + "@" + "nl|1252"
	iTxt[7]="Αγγλικά" + "@" + "en|1252"
	iTxt[8]="Φινλανδικά" + "@" + "fi|1252"
	iTxt[9]="Γαλλικά" + "@" + "fr|1252"
	iTxt[10]="Γερμανικά" + "@" + "de|1252"
	iTxt[11]="Ελληνικά" + "@" + "el|1253"
	//iTxt[12]="Ελληνικά IBM" + "@" + "el_ibm|869"
	iTxt[12]="Σουηδικά" + "@" + "sv|1252"
	iTxt[13]="Εβραϊκά" + "@" + "he|1255"
	//iTxt[14]="Ενεργοποίηση εβραϊκών" + "@" + "en_hebrew|1252"
	iTxt[14]="Ισπανικά" + "@" + "es|1252"
	iTxt[15]="Ουγγρικά" + "@" + "hu|1250"
	iTxt[16]="Ιταλικά" + "@" + "it|1252"
	iTxt[17]="Ιαπωνικά" + "@" + "ja|932"
	iTxt[18]="Ιαπωνικά NEC" + "@" + "nec|932"
	iTxt[19]="Κορεατικά" + "@" + "ko|949"
	iTxt[20]="Νορβηγικά" + "@" + "no|1252"
	iTxt[21]="Πολωνικά" + "@" + "pl|1250"
	iTxt[22]="Πορτογαλικά (Βραζιλίας)" + "@" + "ptbr|1252"
	iTxt[23]="Πορτογαλικά (Επίσημα)" + "@" + "pt|1252"
	iTxt[24]="Ρωσικά" + "@" + "ru|1251"
	//iTxt[25]="Σλοβακικά" + "@" + "sk|1250"
	//iTxt[26]="Σλοβενικά" + "@" + "sl|1250"
	
	
	//iTxt[29]="Ενεργοποίηση ταϊλανδικών" + "@" + "en_thai|1252"
	

	jTxt = iTxt.sort();

	var s, i, a

	s = ""
	lan="el"
	
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
<meta http-equiv="Content-Type" content="text/html;charset=windows-1253" />
<meta http-equiv="PICS-Label" content='(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l gen true comment "RSACi North America Server" by "inet@microsoft.com" on "1997.06.30T14:48-0500" r (n 0 s 0 v 0 l 0))'>
<meta http-equiv="MSThemeCompatible" content="Yes">
<link rel="stylesheet" type="text/css" href="/catalog/shared/css/content.css">
<link rel="stylesheet" type="text/css" href="hcp://system/css/shared.css" />
<script language="jscript">

function selectlink(){
	var vLinks =parent.frames["eTOC"].document.links;
	var iLinksLen = vLinks.length;
	for(i = 0; i < iLinksLen; i++)
		vLinks[i].className = "";
	parent.frames["eTOC"].eHardwareDrivers.className="selected";
}
</script>
</head>
<body onLoad="parent.eTOC.fnSyncTOC(window.location.href, -1, -1)" style="MARGIN-TOP: 11px;MARGIN-LEFT: 16px;MARGIN-RIGHT: 16px;">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<span class="title sys-font-heading3 sys-rhp-color-title">Προγράμματα οδήγησης υλικού</span></td>
	</tr>
	<tr>
		<td class="8pt sys-font-body sys-color-body">
			Επιλέξτε μια κατηγορία υλικού και αναζητήστε τις πιο πρόσφατες ενημερωμένες εκδόσεις, για να διατηρήσετε τη σωστή λειτουργία των συσκευών σας.</td>
	</tr>
</table>
<img src="/catalog/shared/images/ts.gif" HEIGHT="20" WIDTH="1">
<table cellpadding="0" cellspacing="0" border="0">
	<tr><td width="15"><img src="/catalog/shared/images/ts.gif" width="25" height="1"></td>
		<td><img src="/catalog/shared/images/ts.gif" width="100%" height="1"></td>
	</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Video&amp;clan=el&amp;lcat=&#914;&#943;&#957;&#964;&#949;&#959;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Βίντεο</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Κάρτες βίντεο, ολοκληρωμένα κυκλώματα (chipsets) βίντεο μητρικής πλακέτας, αποκωδικοποιητής DVD, κάρτες καταγραφής βίντεο, δέκτες τηλεόρασης...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Sound&amp;clan=el&amp;lcat=&#905;&#967;&#959;&#962;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Ήχος</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 Ηχεία, μικρόφωνα, φορητές συσκευές αναπαραγωγής πολυμέσων, κάρτες ήχου, synthesizers...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Printers&amp;clan=el&amp;lcat=&#917;&#954;&#964;&#965;&#960;&#969;&#964;&#941;&#962;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Εκτυπωτές</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Εκτυπωτής φωτογραφιών, λέιζερ, ακίδων, συμπαγούς μελάνης, εξαρτήματα...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Modems&amp;clan=el&amp;lcat=&#924;&#972;&#957;&#964;&#949;&#956;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Μόντεμ</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Εξωτερικά, κάρτα μόντεμ, ISDN, DSL, καλώδιο...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Cameras&amp;clan=el&amp;lcat=&#922;&#940;&#956;&#949;&#961;&#949;&#962;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Κάμερες</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Ψηφιακή φωτογραφική μηχανή, ψηφιακή βίντεο κάμερα, Web /βίντεο κάμερα...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Scanners&amp;clan=el&amp;lcat=&#931;&#945;&#961;&#969;&#964;&#941;&#962;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Σαρωτές</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Επίπεδος σαρωτής, κύλισης, τσέπης...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Monitors&amp;clan=el&amp;lcat=&#927;&#952;&#972;&#957;&#949;&#962;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Οθόνες</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CRT, επίπεδη οθόνη LCD, LED, πλάσμα, συσκευές προβολής...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Networking&amp;clan=el&amp;lcat=&#916;&#943;&#954;&#964;&#965;&#945;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Δίκτυα</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				LAN, ασύρματη σύνδεση, ISDN, HPNA, IrDA, WAN, ATM (τρόπος ασύγχρονης μεταφοράς)...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Input Devices&amp;clan=el&amp;lcat=&#931;&#965;&#963;&#954;&#949;&#965;&#941;&#962; &#949;&#953;&#963;&#972;&#948;&#959;&#965;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Συσκευές εισόδου</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Ποντίκι, πληκτρολόγιο, ελεγκτές παιχνιδιών, trackball, μικρόφωνα, επιφάνειες επαφής, πένες φωτός...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Storage&amp;clan=el&amp;lcat=&#913;&#960;&#959;&#952;&#942;&#954;&#949;&#965;&#963;&#951;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Αποθήκευση</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 Προσαρμογείς και ελεγκτές αποθήκευσης, μονάδες δίσκου CD-DVD, μονάδες σκληρού δίσκου, αφαιρούμενες μονάδες πολυμέσων, RAID, μονάδες μαγνητοταινίας...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Personal Computers&amp;clan=el&amp;lcat=&#928;&#961;&#959;&#963;&#969;&#960;&#953;&#954;&#959;&#943; &#965;&#960;&#959;&#955;&#959;&#947;&#953;&#963;&#964;&#941;&#962;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Προσωπικοί υπολογιστές</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				 Επιτραπέζια συστήματα, κινητά συστήματα, συστήματα υπολογιστών τσέπης ή PDA </td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Servers and Cluster Solutions&amp;clan=el&amp;lcat=&#923;&#973;&#963;&#949;&#953;&#962; &#948;&#953;&#945;&#954;&#959;&#956;&#953;&#963;&#964;&#974;&#957; &#954;&#945;&#953; &#963;&#965;&#956;&#960;&#955;&#941;&#947;&#956;&#945;&#964;&#959;&#962;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>Λύσεις διακομιστών και συμπλέγματος</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				Λύση συμπλέγματος, datacenter server, λύση GEOCluster, διακομιστής...</td>
		</tr>
	

		<tr>
			<td valign="top" colspan="2" class="8pt sys-font-body sys-color-body">
				<a class="sys-link-normal" href="HardUpdates.asp?cat=Other Hardware&amp;clan=el&amp;lcat=&#902;&#955;&#955;&#959; &#965;&#955;&#953;&#954;&#972;">
				<img src="/catalog/shared/images/DriverCatBullet.gif" border="0" style="position:relative;top:2px">
				<b>’λλο υλικό</b></a></td>
		</tr>
		<tr><td><img src="/catalog/shared/images/DriverCatBullet.gif" style="visibility:hidden"></td>
			<td valign="top" WIDTH="100%" class="8pt sys-font-body sys-color-body">
				CPU, μητρική πλακέτα, διανομέας USB, UPS (Αδιάλειπτη Παροχή Ενέργειας), Cardbus/PCMCIA, ελεγκτές 1394...</td>
		</tr>
	
</table>
<br/>

</body>
</html>