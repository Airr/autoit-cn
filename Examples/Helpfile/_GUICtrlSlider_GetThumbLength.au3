#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Get Thumb Length", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 25, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUISetState()

	; ��ȡ���鳤��
	MsgBox(4160, "Information", "Thumb Length: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; ���û��鳤��
	_GUICtrlSlider_SetThumbLength($hSlider, 10)

	; ��ȡ���鳤��
	MsgBox(4160, "Information", "Thumb Length: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
