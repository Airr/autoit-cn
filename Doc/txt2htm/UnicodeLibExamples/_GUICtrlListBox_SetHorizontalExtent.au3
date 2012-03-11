﻿#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_LB = False ;检查传递给 ListBox 函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

_Main()

Func _Main()
	Local $hListBox

	; 创建 GUI
	GUICreate("List Box Set Horizontal Extent", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState()

	; 添加长字符串
	_GUICtrlListBox_AddString($hListBox, "AutoIt v3 is a freeware BASIC-like scripting language designed for automating the Windows GUI.")

	; 显示当前水平范围
	MsgBox(4160, "信息", "Horizontal Extent: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	_GUICtrlListBox_SetHorizontalExtent($hListBox, 500)

	; 显示当前水平范围
	MsgBox(4160, "信息", "Horizontal Extent: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
