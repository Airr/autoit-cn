ʾ��
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Local $hCombo

	; ��������
	GUICreate(" ComboBox Select String ", 400, 296)
	$hCombo = GUICtrlCreateCombo(\ * .exe " )
	; ����ַ���
	_GUICtrlComboBox_AddString($hCombo, "This string has been added ")
	; ����ļ�
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($hCombo)

	; select string
	_GUICtrlComboBox_SelectString($hCombo, "This")

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main
