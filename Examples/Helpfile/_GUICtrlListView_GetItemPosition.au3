
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; 检查传递给ListView函数的类名,
设置为真并使用另一控件的句柄观察其工作

_Main()

Func _Main()
	Local $aPos, $hListView

	GUICreate("ListView Get Item Position", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)

	GUISetState()

	;
	添加列
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; 添加项目
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")



	; 获取项目2的位置
	$aPos = _GUICtrlListView_GetItemPosition($hListView, 1)
	MsgBox(4160, "Information", StringFormat( "Item 2
	Position :[%d, %d] " ,  $aPos [ 0 ],  $aPos [ 1 ]))

	; 循环至用户退出
	Do

	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

