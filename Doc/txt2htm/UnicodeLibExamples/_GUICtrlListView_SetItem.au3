﻿#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; 检查传递给 ListView 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Set Item", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; 添加列
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; 添加项目
	GUICtrlCreateListViewItem("Item 1", $hListView)
	GUICtrlCreateListViewItem("Item 2", $hListView)
	GUICtrlCreateListViewItem("Item 3", $hListView)

	; 改变第二项
	MsgBox(4160, "Information", "Changing item 2")
	_GUICtrlListView_SetItem($hListView, "New Item 2", 1)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
