#Include <Constants.au3>
#NoTrayIcon

Opt("TrayMenuMode",1)	; Default tray menu items (Script Paused/Exit) will not be shown.

$settingsitem	= TrayCreateMenu("����")
$displayitem	= TrayCreateItem("��ʾ", $settingsitem)
$printeritem	= TrayCreateItem("��ӡ", $settingsitem)
TrayCreateItem("")
$aboutitem		= TrayCreateItem("����")
TrayCreateItem("")
$exititem		= TrayCreateItem("�˳�")

TraySetState()
TraySetClick(16)

While 1
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $aboutitem
			Msgbox(64,"����:","AutoIt3-����-����")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit
