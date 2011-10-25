#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

Opt('MustDeclareVars ', 1)

$Debug_AVI = False ; ��鴫�ݸ�AVI����������, ����Ϊ�沢������һ�ؼ�����۲��乤��

Global $hAVI

_Example_Internal()
_Example_External()

Func _Example_Internal()
	Local $hGUI, $btn_start, $btn_stop

	; ��������
	$hGUI = GUICreate(" (Internal) AVI Play ", 300, 200)
	$hAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll ", 160, 10, 10)
	$btn_start = GUICtrlCreateButton(" start ", 50, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton(" stop ", 150, 150, 70, 22)
	GUISetState()

	; ѭ�����û��˳�
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; ���Ų��ֵ�AVIƬ��
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; ֹͣAVIƬ��
				_GUICtrlAVI_Stop($hAVI)
		EndSwitch
	WEnd

	; �ر�AVIƬ��
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
endfunc   ;==>_Example_Internal

Func _Example_External()
	Local $hGUI, $btn_start, $btn_stop

	; ��������
	$hGUI = GUICreate("(External) AVI Play", 300, 200)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & "\Shell32.dll", 160, 10, 10)
	$btn_start = GUICtrlCreateButton("start", 50, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton("stop", 150, 150, 70, 22)
	GUISetState()

	; ѭ�����û��˳�
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; ���Ų��ֵ�AVIƬ��
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; ֹͣAVIƬ��
				_GUICtrlAVI_Stop($hAVI)
		EndSwitch
	WEnd

	; �ر�AVIƬ��
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
endfunc   ;==>_Example_External

