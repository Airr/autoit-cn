#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

Opt('MustDeclareVars ', 1)

$Debug_AVI = False ; ��鴫�ݸ�AVI���������� , ����Ϊ�沢������һ�ؼ�����۲��乤��

Global $hAVI

_Example_Internal()
_Example_External()

Func _Example_Internal()
	Local $hGUI, $btn_start, $btn_stop, $btn_show

	; ��������
	$hGUI = GUICreate(" (Internal) AVI Play ", 350, 200)
	$hAVI = GUICtrlCreateAvi(@SystemDir & " \shell32.dll ", 160, 10, 10)
	$btn_start = GUICtrlCreateButton(" start ", 25, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton(" stop ", 125, 150, 70, 22)
	$btn_show = GUICtrlCreateButton(" hide ", 225, 150, 70, 22)
	GUISetState()

	; ѭ�����û��˳�
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; ���Ų��ּ���
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; ֹͣӰƬ
				_GUICtrlAVI_Stop($hAVI)
			Case $btn_show
				If GUICtrlRead($btn_show) = " hide " Then
					_GUICtrlAVI_Show($hAVI, @SW_HIDE)
					GUICtrlSetData($btn_show, "show ")
				Else
					_GUICtrlAVI_Show($hAVI, @SW_SHOW)
					GUICtrlSetData($btn_show, "hide ")
				EndIf
		EndSwitch
	WEnd

	; �ر�ӰƬ����
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
endfunc   ;==>_Example_Internal

Func _Example_External()
	Local $hGUI, $btn_start, $btn_stop, $btn_show

	; ��������
	$hGUI = GUICreate(" (External) AVI Play ", 350, 200)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & " \Shell32.dll ", 160, 10, 10)
	$btn_start = GUICtrlCreateButton(" start ", 25, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton(" stop ", 125, 150, 70, 22)
	$btn_show = GUICtrlCreateButton(" hide ", 225, 150, 70, 22)
	GUISetState()

	; ѭ�����û��˳�
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; ���Ų��ּ���
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; ֹͣӰƬ
				_GUICtrlAVI_Stop($hAVI)
			Case $btn_show
				If GUICtrlRead($btn_show) = " hide " Then
					_GUICtrlAVI_Show($hAVI, @SW_HIDE)
					GUICtrlSetData($btn_show, "show ")
				Else
					_GUICtrlAVI_Show($hAVI, @SW_SHOW)
					GUICtrlSetData($btn_show, "hide ",)
				EndIf
		EndSwitch
	WEnd

	; �ر�ӰƬ����
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
endfunc   ;==>_Example_External

