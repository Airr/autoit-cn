#NoTrayIcon

Opt("TrayMenuMode",1)	; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ. 

Local $getitem	= TrayCreateItem("�õ��ı�")
TrayCreateItem("")
Local $aboutitem	= TrayCreateItem("����")
TrayCreateItem("")
Local $exititem	= TrayCreateItem("�˳�")

TraySetState()

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $getitem
			MsgBox(64,"״̬",TrayItemGetText($aboutitem))
		Case $msg = $aboutitem
			MsgBox(64,"����:","AutoIt3-��������")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
