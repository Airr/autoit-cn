#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Insert Column", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; ������
	_GUICtrlListView_InsertColumn($hListView, 0, "Column 1", 100)
	_GUICtrlListView_InsertColumn($hListView, 1, "Column 2", 100)
	_GUICtrlListView_InsertColumn($hListView, 2, "Column 3", 100)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
