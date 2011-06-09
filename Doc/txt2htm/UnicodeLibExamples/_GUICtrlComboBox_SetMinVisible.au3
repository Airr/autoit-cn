﻿#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; 检查传递给 ComboBox/ComboBoxEx 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $hCombo

	; 创建 GUI
	GUICreate("ComboBox Set Min Visible", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; 添加文件
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; 获取可见的最小数目
	MsgBox(4160, "Information", "Min Visible:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 3)

	; 显示下拉框
	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; 设置可见的最小数目
	_GUICtrlComboBox_SetMinVisible($hCombo, 50)

	; 显示下拉框
	_GUICtrlComboBox_ShowDropDown($hCombo)

	Sleep(500)

	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; 获取可见的最小数目
	MsgBox(4160, "Information", "Min Visible:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 3)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
