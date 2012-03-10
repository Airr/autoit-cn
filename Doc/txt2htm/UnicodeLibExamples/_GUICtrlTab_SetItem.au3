﻿#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; 检查传递给函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

_Main()

Func _Main()
	Local $aItem, $hTab

	; 创建 GUI
	GUICreate("Tab Control Set Item", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState()

	; 添加标签
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; 获取/设置首个标签的参数
	_GUICtrlTab_SetItem($hTab, 0, -1, -1, -1, 1234)
	$aItem = _GUICtrlTab_GetItem($hTab, 0)
	MsgBox(4160, "Information", "Tab 1 parameter: " & $aItem[3])

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
