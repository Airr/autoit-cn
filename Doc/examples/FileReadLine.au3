$file = FileOpen("test.txt", 0)

; ����ļ������Ƿ�Ϊ�����Ա�ô�
If $file = -1 Then
	MsgBox(0, "����", "���ܴ��ļ�.")
	Exit
EndIf

; ���ı���ֱ���ļ�����
While 1
	$line = FileReadLine($file)
	If @error = -1 Then ExitLoop
	MsgBox(0, "��ȡ����:", $line)
Wend

FileClose($file)
