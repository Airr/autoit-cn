#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Set Item Position32", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����Ŀ
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Set icon view
	_GUICtrlListView_SetView($hListView, 3)
	MsgBox(4160, "��Ϣ", "Moving item 2")
	_GUICtrlListView_SetItemPosition32($hListView, 1, 100, 100)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
