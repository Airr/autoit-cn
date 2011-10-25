
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiTreeView.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_TV = False ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄观察其工作

_Main()

Func _Main()

	Local $hItem[10], $hRandItem, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView Get Next Sibling", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)

	For $x = 0 To 3
		$hItem[$x] = GUICtrlCreateTreeViewItem( StringFormat( "[%02d] New
		Item" ,  $x ),  $hTreeView )

		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem( StringFormat("[%02d] New Child", $y), $hItem[$x])

		Next
	Next
	$hItem[4] = GUICtrlCreateTreeViewItem( StringFormat("[%02d] New Item", 4), $hTreeView)
	For $x = 5 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem( StringFormat("[%02d] New Item", $x), $hTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem( StringFormat("[%02d] New Child", $y), $hItem[$x])

		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)


	$hRandItem = Random(0, 8, 1)
	MsgBox(4160, "Information", StringFormat( "Index %d,
	Next: %s" ,  $hRandItem ,  _GUICtrlTreeView_GetNextSibling ( $hTreeView ,  $hItem [ $hRandItem ])))

	_GUICtrlTreeView_SelectItem($hTreeView, _GUICtrlTreeView_GetNextSibling($hTreeView, $hItem[$hRandItem]))


	; 循环至用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

