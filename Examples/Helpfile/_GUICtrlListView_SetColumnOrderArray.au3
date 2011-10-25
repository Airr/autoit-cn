
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $a_order[5] = [4, 3, 2, 0, 1], $hListView

	GUICreate( "ListView Set
	Column Order Array" ,  400 ,  300 )
	$hListView = GUICtrlCreateListView("Column 1|Column 2|Column 3|Column 4", 2, 2, 394, 268)
	GUISetState()


	; ������˳��
	MsgBox(4160, "Information", "Changing column order")
	_GUICtrlListView_SetColumnOrderArray($hListView, $a_order)

	;
	��ʾ��˳��
	$a_order = _GUICtrlListView_GetColumnOrderArray($hListView)
	MsgBox(4160, "Information", StringFormat("Column order: [%d, %d, %d, %d]", $a_order[1], $a_order[2], $a_order[3], $a_order[4]))

	; ѭ�����û��˳�
	Do

	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
endfunc   ;==>_Main

