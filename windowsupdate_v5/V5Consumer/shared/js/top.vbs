Function vbsToLocaleDateString(sDate)
	If Not IsDate(sDate) Then
		vbsToLocaleDateString = ""
	Else
		vbsToLocaleDateString = FormatDateTime(CDate(sDate), vbLongDate)
	End If
End Function
Function vbsFormatDateTime(sDate, iNamedFormat)
	If IsDate(sDate) Then
		vbsFormatDateTime = FormatDateTime(sDate, iNamedFormat)
	Else
		vbsFormatDateTime = sDate
	End If
End Function
Function vbsToLocaleNumber(n)
	If Not IsNumeric(n) Then
		vbsToLocaleNumber = "0"
	Else
		vbsToLocaleNumber = FormatNumber(n)
	End If
End Function
Function vbsCDate(vDate)
	vbsCDate = CDate(vDate)	
End Function