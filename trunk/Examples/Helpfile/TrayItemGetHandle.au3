#include <Constants.au3>

Opt("TrayMenuMode", 1) ; ����ʾĬ�Ϲ����˵�

Global Const $MIM_APPLYTOSUBMENUS = 0x80000000
Global Const $MIM_BACKGROUND = 0x00000002

TraySetIcon("shell32.dll", 21)
TraySetToolTip("������һ��С������ʾ����ɫ������ͼ��" & @LF & "ֻ�����ϵͳ���� Windows 2000 ���ܿ���.")

Local $OptionsMenu	= TrayCreateMenu("ѡ��")
TrayCreateItem("������ǰ", $OptionsMenu)
TrayItemSetState(-1, $TRAY_CHECKED)
TrayCreateItem("�����ظ�", $OptionsMenu)
TrayCreateItem("")
Local $AboutItem	= TrayCreateItem("����")
TrayCreateItem("")
Local $ExitItem		= TrayCreateItem("�˳�����")

SetMenuColor(0, 0xEEBB99)   ; BGR ��ɫֵ, '0' ����˼�����̹����˵��Լ�.
SetMenuColor($OptionsMenu, 0x66BB99); BGR ��ɫֵ

While 1
	Local $Msg = TrayGetMsg()

	Switch $Msg
		Case $ExitItem
			ExitLoop

		Case $AboutItem
			MsgBox(64, "����...", "����ɫ������ͼ������")
	EndSwitch
WEnd

Exit


; Ӧ�ò˵���ɫ
Func SetMenuColor($nMenuID, $nColor)
	Local $hMenu  = TrayItemGetHandle($nMenuID) ; �õ��ڲ��˵����

	Local $hBrush = DllCall("gdi32.dll", "hwnd", "CreateSolidBrush", "int", $nColor)
	$hBrush = $hBrush[0]

	Local $stMenuInfo = DllStructCreate("dword;dword;dword;uint;dword;dword;ptr")
	DllStructSetData($stMenuInfo, 1, DllStructGetSize($stMenuInfo))
	DllStructSetData($stMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($stMenuInfo, 5, $hBrush)

	DllCall("user32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "ptr", DllStructGetPtr($stMenuInfo))
EndFunc   ;==>SetMenuColor
