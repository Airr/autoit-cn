
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $iID, $hListView

	GUICreate("ListView Map ID To Index", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)

	GUISetState()

	;
	�����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����Ŀ
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")


	; ��ʾ��Ŀ 2 �ı��
	$iID = _GUICtrlListView_MapIndexToID($hListView, 1)
	MsgBox(4160, "Information", "Index to ID:" & $iID)
	MsgBox(4160, "Information", "ID to Index:
	"  &  _GUICtrlListView_MapIDToIndex ( $hListView ,  $iID ))

	; ѭ�����û��˳�
	Do

	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

