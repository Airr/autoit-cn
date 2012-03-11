#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

$Debug_CB = False ;��鴫�ݸ� ComboBox/ComboBoxEx ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hCombo

	; ���� GUI
	GUICreate("ComboBox Set Dropped Width", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Set Dropped Width
	_GUICtrlComboBox_SetDroppedWidth($hCombo, 500)

	; Get Dropped Width
	MsgBox(4160, "��Ϣ", "Dropped Width: " & _GUICtrlComboBox_GetDroppedWidth($hCombo))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
