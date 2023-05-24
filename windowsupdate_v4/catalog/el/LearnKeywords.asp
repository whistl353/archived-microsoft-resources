
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
               Χρήση λέξεων για περιορισμό της αναζήτησής σας στον κατάλογο του Windows Update
         </span>
     </td>
     <td ><img id="eImgUA" src="/catalog/images/UAbrand.gif" WIDTH=33 HEIGHT=29></td>
</tr>
</table>
<div id="eContainer" style="overflow-y:auto;height:290px;">
<p>
Όταν περιλαμβάνετε συγκεκριμένες λέξεις στο ερώτημά σας, η αναζήτηση εμφανίζει αποτελέσματα που περιορίζονται στις ενημερωμένες εκδόσεις, των οποίων οι τίτλοι και οι περιγραφές περιέχουν μία τουλάχιστον εμφάνιση των συγκεκριμένων λέξεων που πληκτρολογήσατε και με την ίδια ακριβώς σειρά που τις πληκτρολογήσατε.
</p>

<P>Για παράδειγμα: Εάν πληκτρολογήσετε τη φράση <B>Υποστήριξη δέσμης ενεργειών των Windows</B>, η αναζήτηση θα εμφανίσει ενημερωμένες εκδόσεις που περιέχουν την ακριβή φράση είτε στον τίτλο είτε στην περιγραφή.
</p>
<P>’λλες συμβουλές σχετικά με τη χρήση λέξεων για τον περιορισμό της αναζήτησής σας:
</p>
	<div style="padding-left:15px;">
		<ul>
		<li>Εάν αντιμετωπίζετε δυσκολίες στη λήψη αποτελεσμάτων για το ερώτημά σας, προσπαθήστε να χρησιμοποιήσετε άλλες λέξεις που σημαίνουν το ίδιο πράγμα (για παράδειγμα, δοκιμάστε τη λέξη "Internet" αντί της λέξης "Web").</li>
		<li>Η αναζήτηση δεν παραβλέπει τη στίξη που περιλαμβάνετε στο ερώτημά σας. </li>
		<li>Στην αναζήτηση δεν γίνεται διάκριση πεζών-κεφαλαίων: Η φράση <B>Υποστήριξη για δέσμες ενεργειών των Windows</B> θα εμφανίσει τα ίδια αποτελέσματα με τη φράση <B>υποστήριξη για δέσμες ενεργειών των windows</B>.</li>
		</ul>
	</div>
</p>



</div>
     <button id="ePrintBtn" style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:150px;'   onclick="window.print();">Εκτύπωση</button><button id="eCloseBtn"  style='font:messagebox;position:absolute;padding-left:10px;padding- right:10px;bottom:10px;right:20px;'  onclick="window.close();">Κλείσιμο</button>
</body>
</html>
