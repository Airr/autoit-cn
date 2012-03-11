#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Ensure Visible", 400, 300)
	$hListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState()

	_GUICtrlListView_BeginUpdate($hListView)
	For $i = 1 To 100
		GUICtrlCreateListViewItem("Item " & $i, $hListView)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	MsgBox(4160, "��Ϣ", "Making item 50 visible")
	_GUICtrlListView_EnsureVisible($hListView, 49)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
