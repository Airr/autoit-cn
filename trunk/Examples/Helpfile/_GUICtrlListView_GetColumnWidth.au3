#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����Ϊ True ��ʹ��ָ����һ�ؼ��ľ����������Ƿ���

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Get Column Width", 400, 300)
	$hListView = GUICtrlCreateListView("Column 1|Column 2|Column 3", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)

	; �ı����п��
	MsgBox(4160, "Information", "Column 1 Width: " & _GUICtrlListView_GetColumnWidth($hListView, 0))
	_GUICtrlListView_SetColumnWidth($hListView, 0, 150)
	MsgBox(4160, "Information", "Column 1 Width: " & _GUICtrlListView_GetColumnWidth($hListView, 0))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
