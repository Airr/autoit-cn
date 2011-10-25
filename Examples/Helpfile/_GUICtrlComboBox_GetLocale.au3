#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include  <GUIComboBox.au3>
#include  <GuiConstantsEx.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Local $hCombo

	; ��������
	GUICreate(" ComboBox Get Locale ", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & " \*.exe ")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; ��ʾ����, ���Ҵ���, ���Ա�ʶ, �����Ա��, �����Ա��
	MsgBox(4160, "Information ", _
			" Locale .................:" & _GUICtrlComboBox_GetLocale($hCombo) & @LF & _
			" Country code ........:" & _GUICtrlComboBox_GetLocaleCountry($hCombo) & @LF & _
			" Language identifier..:" & _GUICtrlComboBox_GetLocaleLang($hCombo) & @LF & _
			" Primary Language id :" & _GUICtrlComboBox_GetLocalePrimLang($hCombo) & @LF & _
			" Sub-Language id ....:" & _GUICtrlComboBox_GetLocaleSubLang($hCombo))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

