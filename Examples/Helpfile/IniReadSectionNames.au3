Local $var = IniReadSectionNames(@WindowsDir & "\win.ini")
If @error Then
	MsgBox(4096, "", "����, ��ȡINI�ļ�ʧ��.")
Else
	For $i = 1 To $var[0]
		MsgBox(4096, "", "�ֶ���:" & $var[$i])
	Next
EndIf
