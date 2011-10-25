#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�ComboBox/ComboBoxEx����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hGUI, $hCombo

	; ��������
	$hGUI = GUICreate(" ComboBoxEx Destroy ", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "This is a test|Line 2 ", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlComboBoxEx_AddString($hCombo, "Some More Text ")
	_GUICtrlComboBoxEx_InsertString($hCombo, "Inserted Text ", 1)

	; ���ٿؼ�
	MsgBox(266256, "Information ", "Destroy the control ")
	_GUICtrlComboBoxEx_Destroy($hCombo)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

