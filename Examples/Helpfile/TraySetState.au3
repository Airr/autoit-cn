#NoTrayIcon

Opt("TrayMenuMode",1)	; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ. 

Local $exititem		= TrayCreateItem("�˳�")

TraySetIcon("����")
TraySetToolTip("SOS")

TraySetState()	; ��ʾ����ͼ��

Local $toggle = 0

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			Sleep(1000)
			If $toggle = 0 Then
				TraySetState()	; ��ʾ����ͼ��
				$toggle = 1
			Else
				TraySetState(2)	; ��������ͼ��
				$toggle = 0
			EndIf
		Case $msg = $exititem
			ExitLoop
	EndSelect

WEnd

Exit
