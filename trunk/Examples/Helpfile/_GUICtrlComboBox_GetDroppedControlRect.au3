#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $iMemo

_Main()

Func _Main()
	Local $aRect, $hCombo

	; ��������
	GUICreate(" ComboBox Get Dropped Control Rect ", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & " \*.exe ")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; ��ȡ�����ؼ�����
	$aRect = _GUICtrlComboBox_GetDroppedControlRect($hCombo)

	MemoWrite(" X coordinate of the upper left corner ......:" & $aRect[0])
	MemoWrite(" Y coordinate of the upper left corner ......:" & $aRect[1])
	MemoWrite(" X coordinate of the lower right corner .....:" & $aRect[2])
	MemoWrite(" Y coordinate of the lower right corner .....:" & $aRect[3])

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

; д��memo�ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

