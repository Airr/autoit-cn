#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $bFormat, $hTab

	; ���� GUI
	GUICreate("Tab Control Get Unicode Format", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState()

	; ��ӱ�ǩ
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; ��ȡ/���� Unicode ��ʽ
	$bFormat = _GUICtrlTab_GetUnicodeFormat($hTab)
	MsgBox(4160, "Information", "Unicode format: " & $bFormat)
	_GUICtrlTab_SetUnicodeFormat($hTab, Not $bFormat)
	MsgBox(4160, "Information", "Unicode format: " & _GUICtrlTab_GetUnicodeFormat($hTab))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
