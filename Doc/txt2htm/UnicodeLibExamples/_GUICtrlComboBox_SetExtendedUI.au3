﻿#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

$Debug_CB = False ;检查传递给 ComboBox/ComboBoxEx 函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

Global $iMemo

_Main()

Func _Main()
	Local $hCombo

	; 创建 GUI
	GUICreate("ComboBox Set Extended UI", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 添加文件
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; 获取扩展 UI
	MemoWrite("Extended UI: " & _GUICtrlComboBox_GetExtendedUI($hCombo))

	; 设置扩展 UI
	_GUICtrlComboBox_SetExtendedUI($hCombo, True)

	; 获取扩展 UI
	MemoWrite("Extended UI: " & _GUICtrlComboBox_GetExtendedUI($hCombo))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; 写入一行到 memo 控件
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
