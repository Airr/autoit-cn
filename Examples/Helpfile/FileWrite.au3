Local $file = FileOpen("test.txt", 1)

; ���򿪵��ļ���д
If $file = -1 Then
	MsgBox(4096, "����", "���ܴ��ļ�.")
	Exit
EndIf

FileWrite($file, "Line1")
FileWrite($file, "Still Line1" & @CRLF)
FileWrite($file, "Line2")

FileClose($file)
