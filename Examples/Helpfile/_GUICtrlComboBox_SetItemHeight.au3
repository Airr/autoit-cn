#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

$Debug_CB = False ;��鴫�ݸ� ComboBox/ComboBoxEx ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo

_Main()

Func _Main()
	Local $hCombo

	; ���� GUI
	GUICreate("ComboBox Set Item Height", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Get Item Height (selection field)
	MemoWrite("Item Height (selection field): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Get Item Height (list items)
	MemoWrite("Item Height (list items): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; ������Ŀ�߶� (selection field)
	_GUICtrlComboBox_SetItemHeight($hCombo, 18)

	; ������Ŀ�߶� (selection field)
	_GUICtrlComboBox_SetItemHeight($hCombo, 20, 0)

	; Get Item Height (selection field)
	MemoWrite("Item Height (selection field): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Get Item Height (list items)
	MemoWrite("Item Height (list items): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
