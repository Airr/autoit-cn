;Ҫ�򿪵��ļ�
Local $file = FileOpen("test.txt", 0)

; ���򿪵��ļ��Ƿ��Ϊ��
If $file = -1 Then
	MsgBox(0, "����", "���ܴ��ļ�.")
	Exit
EndIf

; ÿ�ζ�ȡһ���ַ�,ֱ���ļ�����(��ע:�����ı�������ΪԶ����1��ֵ!)(��ע����ע(thesnow):ANSI������,һ������Ϊ�����ַ�/�ֽ�)
While 1
	Local $chars = FileRead($file, 1)
	If @error = -1 Then ExitLoop
	MsgBox(0, "��ȡ���ַ�:", $chars)
WEnd

FileClose($file)
