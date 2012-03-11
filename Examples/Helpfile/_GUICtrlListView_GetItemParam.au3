#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

; ���治Ҫ�� SetItemParam ����ʹ�� GuiCtrlCreateListViewItem ��������Ŀ��
; Param Ϊ�����ú�����������Ŀ�Ŀؼ� ID

Example_UDF_Created()

Func Example_UDF_Created()
	Local $GUI, $hListView

	$GUI = GUICreate("(UDF Created) ListView Get Item Param", 400, 300)
	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����Ŀ
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; ���õڶ���Ĳ���
	_GUICtrlListView_SetItemParam($hListView, 1, 1234)
	MsgBox(4160, "��Ϣ", "Item 2 Parameter: " & _GUICtrlListView_GetItemParam($hListView, 1))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_UDF_Created
