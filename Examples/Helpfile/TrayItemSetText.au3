#include <Constants.au3>
#NoTrayIcon

Opt("TrayAutoPause",0)	; ���������ͼ��ʱ�ű�������ͣ.

Local $valitem	= TrayCreateItem("ֵ:")
TrayCreateItem("")
Local $aboutitem	= TrayCreateItem("����")

TraySetState()

TrayItemSetText($TRAY_ITEM_EXIT,"�˳�����")
TrayItemSetText($TRAY_ITEM_PAUSE,"��ͣ����")

While 1
	Local $msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $valitem
			TrayItemSetText($valitem,"ֵ:" & Int(Random(1,10,1)))
		Case $msg = $aboutitem
			MsgBox(64,"����:","AutoIt3-����-����")
	EndSelect
WEnd

Exit
