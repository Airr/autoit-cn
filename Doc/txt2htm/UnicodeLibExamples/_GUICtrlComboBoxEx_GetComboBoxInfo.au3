﻿#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; 检查传递给 ComboBox/ComboBoxEx 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $hGUI, $tInfo, $hCombo

	; 创建 GUI
	$hGUI = GUICreate("ComboBoxEx Get ComboBox Info", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState()

	; 添加文件
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	If _GUICtrlComboBoxEx_GetComboBoxInfo($hCombo, $tInfo) Then _
			MsgBox(4160, "Information", StringFormat("Edit Rect [%d][%d][%d][%d]", _
			DllStructGetData($tInfo, "EditLeft"), DllStructGetData($tInfo, "EditTop"), _
			DllStructGetData($tInfo, "EditRight"), DllStructGetData($tInfo, "EditBottom")))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
