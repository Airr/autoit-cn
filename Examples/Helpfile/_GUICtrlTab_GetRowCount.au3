#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hTab

	; ���� GUI
	GUICreate("Tab Control Get Row Count", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_MULTILINE)
	GUISetState()

	; ��ӱ�ǩ
	For $x = 0 To 10
		_GUICtrlTab_InsertItem($hTab, $x, "Tab " & $x + 1)
	Next

	; Get row count
	MsgBox(4160, "Information", "Row count: " & _GUICtrlTab_GetRowCount($hTab))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
