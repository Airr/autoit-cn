
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Get Column Width", 400, 300)
	$hListView = GUICtrlCreateListView("Column 1|Column 2|Column 3", 2, 2, 394, 268)
	GUISetState()


	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)

	; �ı���1���
	MsgBox(4160, "Information", "Column 1 Width:
	"  &  _GUICtrlListView_GetColumnWidth ( $hListView ,  0 ))
	_GUICtrlListView_SetColumnWidth($hListView, 0, 150)
	MsgBox(4160, "Information", "Column 1 Width:" & _GUICtrlListView_GetColumnWidth($hListView, 0))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

