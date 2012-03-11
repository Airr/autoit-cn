#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ;��鴫�ݸ� ComboBox/ComboBoxEx ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo

_Main()

Func _Main()
	Local $tInfo, $hCombo

	; ���� GUI
	GUICreate("ComboBox Get ComboBox Info", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	If _GUICtrlComboBox_GetComboBoxInfo($hCombo, $tInfo) Then
		MemoWrite("Handle to the ComboBox .....: " & DllStructGetData($tInfo, "hCombo"))
		MemoWrite("Handle to the Edit Box .....: " & DllStructGetData($tInfo, "hEdit"))
		MemoWrite("Handle to the drop-down list: " & DllStructGetData($tInfo, "hList"))
	EndIf

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
