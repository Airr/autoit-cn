; ****************
; * ��һ������	 *
; ****************

#NoTrayIcon

Opt("TrayMenuMode",1)	; Ĭ�����̲˵���Ŀ(�ű�����ͣ/�˳��ű�) (Script Paused/Exit) ������ʾ.

Local $prefsitem	= TrayCreateItem("����")
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
		Case $msg = $prefsitem
			MsgBox(64, "����:", "ϵͳ�汾:" & @OSVersion)
		Case $msg = $aboutitem
			MsgBox(64, "����:", "AutoIt3-����-����.")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit


; *****************
; * �ڶ�������	 *
; *****************

#include <Constants.au3>
#NoTrayIcon

Opt("TrayMenuMode",1)	; Ĭ�����̲˵���Ŀ(�ű�����ͣ/�˳��ű�) (Script Paused/Exit) ������ʾ.

; Let's create 2 radio menuitem groups
Local $radio1	= TrayCreateItem("��ѡ1", -1, -1, 1)
TrayItemSetState(-1, $TRAY_CHECKED)
TrayCreateItem("��ѡ2", -1, -1, 1)
TrayCreateItem("��ѡ3", -1, -1, 1)

TrayCreateItem("")	; ��ѡ��ť����ʹ�÷ָ������зָ�,�����������͵Ĳ˵���Ŀ.

TrayCreateItem("��ѡ4", -1, -1, 1)
TrayCreateItem("��ѡ5", -1, -1, 1)
TrayItemSetState(-1, $TRAY_CHECKED)
TrayCreateItem("��ѡ6", -1, -1, 1)

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
			MsgBox(64, "����:", "AutoIt3-����-���� ʹ�õ�ѡ�Ӳ˵�.")
		Case $msg = $exititem
			ExitLoop
	EndSelect
WEnd

Exit