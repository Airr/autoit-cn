;ʾ�� 1 ��ʾ�� 1 �� 10 �г��� 7 �������������
For $i = 1 to 10
	If $i = 7 Then ContinueLoop
	MsgBox(0, "$i �ĵ�ǰֵΪ:", $i, 1)
Next

;ʾ�� 2 ��ʾ�� 1 �� 10 �г��� 3 �� 7 �������������
For $i = 1 to 10
	If $i = 3 Or $i = 7 Then ContinueLoop
	MsgBox(0, "$i �ĵ�ǰֵΪ:", $i, 1)
Next