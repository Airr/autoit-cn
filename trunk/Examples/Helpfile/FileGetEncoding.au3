Local $encoding = FileGetEncoding(@WindowsDir & "\system.ini")
If $encoding=-1 Then
	MsgBox(4096, "����", "���ܻ�ȡ�ļ�����.")
	Exit
Else
	MsgBox(4096, "", "�ļ�����Ϊ:" & $encoding)
EndIf
