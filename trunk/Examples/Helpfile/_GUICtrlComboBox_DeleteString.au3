
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Local $hCombo

	; ��������
	GUICreate(" ComboBox Delete String ", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; ���������
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)

	; ɾ���ַ���
	MsgBox(4160, "Information ", "Deleting string at index 1 ")
	_GUICtrlComboBox_DeleteString($hCombo, 1)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

