WinMove("[active]","",Default, Default, 200,300)	; ֻ��������ڴ�С(���ƶ�)

Example(Default, Default)

Func Example($vParam1 = Default, $vParam2 = "�ڶ�������", $vParam3 = Default)
	If $vParam1 = Default Then $vParam1 = "��һ������"
	If $vParam3 = Default Then $vParam3 = "����������"

	; Display the following parameters passed to the function.
	MsgBox(4096, "����", "1 = " & $vParam1 & @CRLF & _
			"2 = " & $vParam2 & @CRLF & _
			"3 = " & $vParam3)
EndFunc   ;==>Example
