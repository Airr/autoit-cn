ʾ��
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Local $hCombo

	; ��������
	GUICreate(" ComboBox Reset Content ", 400, 296)
	$hCombo = GUICtrlCreateCombo(Courier New " )
	GUISetState()

	; ���ñ༭����ѡ�е��ı�
	_GUICtrlComboBox_SetEditText($hCombo, "Edit Text ")

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & " \*.exe ")
	_GUICtrlComboBox_EndUpdate($hCombo)

	Sleep(500)

	; ������������(����б��)
	_GUICtrlComboBox_ResetContent($hCombo)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

