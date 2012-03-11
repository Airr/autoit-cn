#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

$Debug_CB = False ; Check ClassName being passed to ComboBox/ComboBoxEx functions, set to True and use a handle to another control to see it work

_Main()

Func _Main()
	Local $hCombo

	; 创建 GUI
	GUICreate("ComboBox Set Dropped Width", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; 添加文件
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Set Dropped Width
	_GUICtrlComboBox_SetDroppedWidth($hCombo, 500)

	; Get Dropped Width
	MsgBox(4160, "信息", "Dropped Width: " & _GUICtrlComboBox_GetDroppedWidth($hCombo))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
