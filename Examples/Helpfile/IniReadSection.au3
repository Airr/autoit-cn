IniWrite("C:\Temp\myfile.ini", "����", "��������", "12345")

Local $var = IniReadSection("C:\Temp\myfile.ini", "section2")
If @error Then
	MsgBox(4096, "", "����, ��ȡINI�ļ�ʧ��.")
Else
	For $i = 1 To $var[0][0]
		MsgBox(4096, "", "�ؼ���: " & $var[$i][0] & @CRLF & "ֵ: " & $var[$i][1])
	Next
EndIf
