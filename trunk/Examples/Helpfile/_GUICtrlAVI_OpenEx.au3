#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

Opt('MustDeclareVars ', 1)

$Debug_AVI = False ; ��鴫�ݸ�AVI����������, ����Ϊ�沢������һ�ؼ�����۲��乤��

Global $hAVI

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" (External) AVI OpenEx ", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState()

	; ����ʾ��AutoItӰƬ
	_GUICtrlAVI_OpenEx($hAVI, @SystemDir & " \Shell32.dll ", 150)

	; ����ʾ��AutoItӰƬ
	_GUICtrlAVI_Play($hAVI)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �ر�AVIƬ��
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
endfunc   ;==>_Main

