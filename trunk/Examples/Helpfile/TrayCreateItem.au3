; ****************
; * ��һ������	 *
; ****************

#Include <Constants.au3>
#NoTrayIcon

Opt("TrayMenuMode",1)	; Default tray menu items (Script Paused/Exit) will not be shown.

$prefsitem	= TrayCreateItem("����")
TrayCreateItem("")
$aboutitem	= TrayCreateItem("����")
TrayCreateItem("")
$exititem	= TrayCreateItem("�˳�")

TraySetState()

While 1
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $prefsitem
			Msgbox(64, "����:", "ϵͳ�汾:" & @OSVersion)
		Case $msg = $aboutitem
			Msgbox(64, "����:", "AutoIt3-����-����.")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit


; *****************
; * �ڶ�������	 *
; *****************

#Include <Constants.au3>
#NoTrayIcon

Opt("TrayMenuMode",1)	; Default tray menu items (Script Paused/Exit) will not be shown.

; Let's create 2 radio menuitem groups
$radio1	= TrayCreateItem("��ѡ1", -1, -1, 1)
TrayItemSetState(-1, $TRAY_CHECKED)
$radio2	= TrayCreateItem("��ѡ2", -1, -1, 1)
$radio3	= TrayCreateItem("��ѡ3", -1, -1, 1)

TrayCreateItem("")	; Radio menuitem groups can be separated by a separator line or another norma menuitem

$radio4	= TrayCreateItem("��ѡ4", -1, -1, 1)
$radio5	= TrayCreateItem("��ѡ5", -1, -1, 1)
TrayItemSetState(-1, $TRAY_CHECKED)
$radio6	= TrayCreateItem("��ѡ6", -1, -1, 1)

TrayCreateItem("")

$aboutitem	= TrayCreateItem("����")
TrayCreateItem("")
$exititem	= TrayCreateItem("�˳�")

TraySetState()

While 1
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			ContinueLoop
		Case $msg = $aboutitem
			Msgbox(64, "����:", "AutoIt3-����-���� ʹ�õ�ѡ�Ӳ˵�.")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit