#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $aItem, $hTab

	; ���� GUI
	GUICreate("Tab Control Set Item", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState()

	; ��ӱ�ǩ
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; ��ȡ/�����׸���ǩ�Ĳ���
	_GUICtrlTab_SetItem($hTab, 0, -1, -1, -1, 1234)
	$aItem = _GUICtrlTab_GetItem($hTab, 0)
	MsgBox(4160, "Information", "Tab 1 parameter: " & $aItem[3])

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
