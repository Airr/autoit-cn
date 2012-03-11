#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ;��鴫�ݸ� ComboBox/ComboBoxEx ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo

_Main()

Func _Main()
	Local $hCombo

	; ���� GUI
	GUICreate("ComboBox Get Dropped Stated", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; get dropped state
	MemoWrite("Dropped Down State......: " & _GUICtrlComboBox_GetDroppedState($hCombo))

	Sleep(500)

	; ��ʾ������
	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; get dropped state
	MemoWrite("Dropped Down State......: " & _GUICtrlComboBox_GetDroppedState($hCombo))

	Sleep(500)

	; ����������
	_GUICtrlComboBox_ShowDropDown($hCombo)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
