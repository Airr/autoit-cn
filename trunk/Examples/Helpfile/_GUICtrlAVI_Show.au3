#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>

$Debug_AVI = False ; ��鴫�ݸ� AVI ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

Global $hAVI

_Example_Internal()
_Example_External()

Func _Example_Internal()
	Local $btn_start, $btn_stop, $btn_show

	; ���� GUI
	GUICreate("(Internal) AVI Play", 350, 200)
	$hAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	$btn_start = GUICtrlCreateButton("start", 25, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton("stop", 125, 150, 70, 22)
	$btn_show = GUICtrlCreateButton("hide", 225, 150, 70, 22)
	GUISetState()

	; ѭ��ֱ���û��˳�
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; ���� AVI ������һ����
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; ֹͣ AVI ����
				_GUICtrlAVI_Stop($hAVI)
			Case $btn_show
				If GUICtrlRead($btn_show) = "hide" Then
					_GUICtrlAVI_Show($hAVI, @SW_HIDE)
					GUICtrlSetData($btn_show, "show")
				Else
					_GUICtrlAVI_Show($hAVI, @SW_SHOW)
					GUICtrlSetData($btn_show, "hide")
				EndIf
		EndSwitch
	WEnd

	; �ر� AVI ����
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Example_Internal

Func _Example_External()
	Local $hGUI, $btn_start, $btn_stop, $btn_show

	; ���� GUI
	$hGUI = GUICreate("(External) AVI Play", 350, 200)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & "\Shell32.dll", 160, 10, 10)
	$btn_start = GUICtrlCreateButton("start", 25, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton("stop", 125, 150, 70, 22)
	$btn_show = GUICtrlCreateButton("hide", 225, 150, 70, 22)
	GUISetState()

	; ѭ��ֱ���û��˳�
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; ���� AVI ������һ����
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; ֹͣ AVI ����
				_GUICtrlAVI_Stop($hAVI)
			Case $btn_show
				If GUICtrlRead($btn_show) = "hide" Then
					_GUICtrlAVI_Show($hAVI, @SW_HIDE)
					GUICtrlSetData($btn_show, "show")
				Else
					_GUICtrlAVI_Show($hAVI, @SW_SHOW)
					GUICtrlSetData($btn_show, "hide")
				EndIf
		EndSwitch
	WEnd

	; �ر� AVI ����
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Example_External
