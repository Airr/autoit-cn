#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ;��鴫�ݸ� ComboBox/ComboBoxEx ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hCombo

	; ���� GUI
	GUICreate("ComboBox Delete String", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; Add drives
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)

	;Delete string
	MsgBox(4160, "��Ϣ", "Deleting string at index 1")
	_GUICtrlComboBox_DeleteString($hCombo, 1)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
