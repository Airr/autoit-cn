#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

$Debug_CB = False ;��鴫�ݸ� ComboBox/ComboBoxEx ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hCombo

	; ���� GUI
	GUICreate("ComboBox Replace Edit Sel", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; Set Edit Text
	_GUICtrlComboBox_SetEditText($hCombo, "Old Edit Text")

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	Sleep(500)

	; Set selected text in edit box
	_GUICtrlComboBox_SetEditSel($hCombo, 0, -1)

	Sleep(500)

	; Limit text in edit box
	_GUICtrlComboBox_ReplaceEditSel($hCombo, "New Edit Text")

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
