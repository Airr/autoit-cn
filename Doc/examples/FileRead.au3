$file = FileOpen("test.txt", 0)

; ����ļ������Ƿ�Ϊ�����Ա�ô�
If $file = -1 Then
	MsgBox(0, "����", "���ܴ��ļ�.")
	Exit
EndIf

; �� 1 ��ʼÿ�δ���һ���ַ���ֱ���ļ����� ����ע�������ı�������ΪԶ����1��ֵ����
While 1
	$chars = FileRead($file, 1)
	If @error = -1 Then ExitLoop
	MsgBox(0, "�����ַ�:", $chars)
Wend

FileClose($file)
