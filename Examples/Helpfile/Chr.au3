Local $sText = ""
For $i = 65 To 90
	$sText = $sText & Chr($i) ; Or $sText &= Chr($i) can be used as well.
Next
MsgBox(4096, "Uppercase alphabet", $sText) ; Ӣ����ʹ�õ����д�д��ĸ(ASCII�е�65-90).
