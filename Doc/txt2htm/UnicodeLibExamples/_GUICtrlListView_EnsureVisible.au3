﻿#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; 检查传递给 ListView 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Ensure Visible", 400, 300)
	$hListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
	GUISetState()

	_GUICtrlListView_BeginUpdate($hListView)
	For $i = 1 To 100
		GUICtrlCreateListViewItem("Item " & $i, $hListView)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	MsgBox(4160, "Information", "Making item 50 visible")
	_GUICtrlListView_EnsureVisible($hListView, 49)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
