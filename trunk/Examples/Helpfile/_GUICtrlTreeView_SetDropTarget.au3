
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiTreeView.au3>
#include  <GuiImageList.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_TV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()

	Local $hItem[6], $hRandomItem, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView Drop Target", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)

	For $x = 0 To UBound($hItem) - 1
		$hItem[$x] = GUICtrlCreateTreeViewItem( StringFormat("[%02d] New Item", $x + 1), $hTreeView)
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)


	$hRandomItem = Random(0, UBound($hItem) - 1, 1)
	MsgBox(4160, "Information", StringFormat("Item %d Drop Target? %s", $hRandomItem, _GUICtrlTreeView_GetDropTarget($hTreeView, $hItem[$hRandomItem])))

	_GUICtrlTreeView_SetDropTarget($hTreeView, $hItem[$hRandomItem])

	MsgBox(4160, "Information", StringFormat( "Item %d Drop
	Target? %s" ,  $hRandomItem ,  _GUICtrlTreeView_GetDropTarget ( $hTreeView ,  $hItem [ $hRandomItem ])))

	; �������û��˳�
	Do

	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

