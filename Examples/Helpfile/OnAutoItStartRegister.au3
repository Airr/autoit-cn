#OnAutoItStartRegister "MyTestFunc"
#OnAutoItStartRegister "MyTestFunc2"

Sleep(1000)

Func MyTestFunc()
	MsgBox(64, "��ʼ��� 2", '��ʼ��Ϣ�� MyTestFunc() ����')
EndFunc   ;==>MyTestFunc

Func MyTestFunc2()
	MsgBox(64, "��ʼ��� 3", '��ʼ��Ϣ�� MyTestFunc() ����')
EndFunc   ;==>MyTestFunc2
