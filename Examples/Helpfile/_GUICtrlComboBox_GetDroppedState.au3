#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $iMemo

_Main()

Func()
	Local $hCombo

	; ��������
	GUICreate(" ComboBox  Get Dropped Stated ", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & " \*.exe ")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; ��ȡ�����б�״̬
	MemoWrite(" Dropped Down State......:" & _GUICtrlComboBox_GetDroppedState($hCombo))

	Sleep(500)

	; ��ʾ�����б�
	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; ��ȡ�����б�״̬
	MemoWrite(" Dropped Down State......:" & _GUICtrlComboBox_GetDroppedState($hCombo))

	Sleep(500)

	; ���������б�
	_GUICtrlComboBox_ShowDropDown($hCombo)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>

; д��memo�ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

