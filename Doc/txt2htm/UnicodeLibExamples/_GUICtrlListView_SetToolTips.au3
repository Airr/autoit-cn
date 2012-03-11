﻿#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; 检查传递给 ListView 函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

_Main()

Func _Main()
	Local $hToolTip, $hListView

	GUICreate("ListView Set ToolTips", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
;~ 	$hListView = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 268)
	GUISetState()

	; 添加列
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; 添加项目
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; 显示工具提示句柄
	$hToolTip = _GUICtrlListView_GetToolTips($hListView)
	MsgBox(4160, "Information", "ToolTip Handle: 0x" & Hex($hToolTip))
	Local $hPrevTooltips = _GUICtrlListView_SetToolTips($hListView, $hToolTip)
	MsgBox(4160, "Information", "Previous ToolTip Handle: 0x" & Hex($hPrevTooltips) & @CRLF & _
			"IsPtr = " & IsPtr($hPrevTooltips) & " IsHWnd = " & IsHWnd($hPrevTooltips))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
