Local $var = DriveGetDrive("all")
If Not @error Then
	MsgBox(4096,"", "�ҵ� " & $var[0] & " ��������")
	For $i = 1 To $var[0]
		MsgBox(4096,"������ " & $i, $var[$i])
	Next
EndIf
