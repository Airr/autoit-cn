
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ;
��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Set Item", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)

	GUISetState()

	;
	�����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����Ŀ
	GUICtrlCreateListViewItem("Item 1", $hListView)

	GUICtrlCreateListViewItem("Item 2", $hListView)
	GUICtrlCreateListViewItem("Item 3", $hListView)


	; �ı���Ŀ 2
	MsgBox(4160, "Information", "Changing item 2")
	_GUICtrlListView_SetItem($hListView, "New Item 2", 1)

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

