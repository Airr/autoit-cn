#Include <Constants.au3>
#NoTrayIcon

Opt("TrayAutoPause",0)	; Script will not be paused when clicking the tray icon.

$valitem	= TrayCreateItem("ֵ:")
TrayCreateItem("")
$aboutitem	= TrayCreateItem("����")

TraySetState()

TrayItemSetText($TRAY_ITEM_EXIT,"�˳�����")
TrayItemSetText($TRAY_ITEM_PAUSE,"��ͣ����")

While 1
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $valitem
			TrayItemSetText($valitem,"ֵ:" & Int(Random(1,10,1)))
		Case $msg = $aboutitem
			Msgbox(64,"����:","AutoIt3-����-����")
	EndSelect
WEnd

Exit
