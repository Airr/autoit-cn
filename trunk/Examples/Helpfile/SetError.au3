Local $iResult = myDiv(5, 0)
If @error Then
	MsgBox(4096,"����", "����Ϊ 0")
Else
	MsgBox(4096, "���", $iResult)
EndIf
Exit

Func myDiv($iDividend, $iDivisor)
	If $iDividend = 0 And $iDivisor = 0 Then
		SetError(2) ;���ʽΪ 0/0
	ElseIf $iDivisor = 0 Then
		SetError(1) ;����Ϊ 0
	EndIf
	Return $iDividend / $iDivisor
EndFunc   ;==>myDiv
