﻿#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>

$Debug_SB = False ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()

	Local $hGUI, $hProgress, $hInput, $input, $progress, $hStatus
	Local $aParts[4] = [80, 160, 300, -1]

	; 创建 GUI
	$hGUI = GUICreate("StatusBar Embed Control", 400, 300)

	;===============================================================================
	; 默认为仅一个部分, 不含文本
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetMinHeight($hStatus, 20)

	;===============================================================================
	GUISetState()

	; 初始化各部分
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Part 1")
	_GUICtrlStatusBar_SetText($hStatus, "Part 2", 1)

	; 内嵌进度条
	If @OSType = "WIN32_WINDOWS" Then
		$progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_SMOOTH)
		$hProgress = GUICtrlGetHandle($progress)
		_GUICtrlStatusBar_EmbedControl($hStatus, 2, $hProgress)
	Else
		$progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_MARQUEE) ; 字幕样式在 Win XP 或更高版本有效
		$hProgress = GUICtrlGetHandle($progress)
		_GUICtrlStatusBar_EmbedControl($hStatus, 2, $hProgress)
		_SendMessage($hProgress, $PBM_SETMARQUEE, True, 200) ; 字幕样式在 Win XP 或更高版本有效
	EndIf

	$input = GUICtrlCreateInput("This is Embeded", 0, 0)
	$hInput = GUICtrlGetHandle($input)
	_GUICtrlStatusBar_EmbedControl($hStatus, 3, $hInput, 3)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
