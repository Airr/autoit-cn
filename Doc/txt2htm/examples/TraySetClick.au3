#NoTrayIcon

Opt("TrayMenuMode",1)	; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ. 

Local $settingsitem	= TrayCreateMenu("����")
TrayCreateItem("��ʾ", $settingsitem)
TrayCreateItem("��ӡ", $settingsitem)
TrayCreateItem("")
Local $aboutitem		= TrayCreateItem("����")
TrayCreateItem("")
Local $exititem		= TrayCreateItem("�˳�")

TraySetState()
TraySetClick(16)

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $aboutitem
			MsgBox(64,"����:","AutoIt3-����-����")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
