#NoTrayIcon

Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode",1)	; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ. 

TraySetClick(16)	; ֻ�е����ڶ�����갴��(Ĭ���Ҽ�)�Ż���ʾ���̲˵�.

TrayCreateItem("��Ϣ")
TrayItemSetOnEvent(-1, "ShowInfo")

TrayCreateItem("")

TrayCreateItem("�˳�")
TrayItemSetOnEvent(-1, "ExitScript")

TraySetState()

While 1
	Sleep(10)	; ����ѭ��
WEnd

Exit


; Functions
Func ShowInfo()
	MsgBox(0,"Info","���� OnEvent ģʽ��ʾ")
EndFunc   ;==>ShowInfo


Func ExitScript()
	Exit
EndFunc   ;==>ExitScript
