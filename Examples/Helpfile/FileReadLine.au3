;Ҫ�򿪵��ļ�
Local $file = FileOpen("test.txt", 0)

; ���򿪵��ļ��Ƿ�ɶ�
If $file = -1 Then
	MsgBox(0, "����", "���ܴ��ļ�.")
	Exit
EndIf

; ÿ�ζ�ȡһ���ı�,ֱ���ļ�����.
While 1
	Local $line = FileReadLine($file)
	If @error = -1 Then ExitLoop
	MsgBox(0, "��ȡ����:", $line)
Wend

FileClose($file)
