#include <Constants.au3>
#NoTrayIcon

Opt("TrayMenuMode",1)	; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ. 

Local $chkitem		= TrayCreateItem("ѡ����")
TrayCreateItem("")
Local $checkeditem	= TrayCreateItem("��ѡ��")
TrayCreateItem("")
Local $exititem		= TrayCreateItem("�˳�")

TraySetState()

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $chkitem
			TrayItemSetState($checkeditem, $TRAY_CHECKED)
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
