$file = FileOpen("test.txt", 0)

; ���򿪵��ļ��Ƿ�ɶ�
If $file = -1 Then
	MsgBox(0, "����", "���ܴ��ļ�.")
	Exit
EndIf

FileClose($file)


; �Զ�����Ŀ¼�ṹ������һ������.
$file = FileOpen("test.txt", 10) ; ��ͬ 2 + 8 (��� + ����Ŀ¼)

If $file = -1 Then
	MsgBox(0, "����", "���ܴ��ļ�.")
	Exit
EndIf

FileClose($file)