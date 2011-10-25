#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hGUI, $tInfo, $hCombo

	; ��������
	$hGUI = GUICreate(" ComboBoxEx Get ComboBox Info ", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState()

	; ����ļ�
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, @WindowsDir & " \*.exe ")
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	If _GUICtrlComboBoxEx_GetComboBoxInfo($hCombo, $tInfo) Then _
			MsgBox(4160, "Information , StringFormat ( " Edit Rect[%d][%d][%d][%d] ", _
			DllStructGetData($tInfo, "EditLeft "), DllStructGetData($tInfo, "EditTop "), _
			DllStructGetData($tInfo, "EditRight "), DllStructGetData($tInfo, "EditBottom ")))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

