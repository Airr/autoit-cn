#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $tRect, $hListView

	GUICreate("ListView Get Item Rectangle Ex", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����Ŀ
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Get item 2 rectangle
	$tRect = _GUICtrlListView_GetItemRectEx($hListView, 1)
	MsgBox(4160, "��Ϣ", StringFormat("Item 2 Rectangle : [%d, %d, %d, %d]", DllStructGetData($tRect, "Left"), _
			DllStructGetData($tRect, "Top"), DllStructGetData($tRect, "Right"), DllStructGetData($tRect, "Bottom")))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
