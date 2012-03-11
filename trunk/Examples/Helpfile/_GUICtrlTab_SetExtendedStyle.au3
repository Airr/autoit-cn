#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hTab

	; ���� GUI
	GUICreate("Tab Control Set Extended Style", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, BitOR($TCS_BUTTONS, $TCS_FLATBUTTONS))
	GUISetState()

	; ��ӱ�ǩ
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Get/Set extended styles
	_GUICtrlTab_SetExtendedStyle($hTab, $TCS_EX_FLATSEPARATORS)
	MsgBox(4160, "��Ϣ", "Extended styles: 0x" & Hex(_GUICtrlTab_GetExtendedStyle($hTab)))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
