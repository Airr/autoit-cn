#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Set Thumb Length", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 25, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUISetState()

	; Get Thumb Length
	MsgBox(4160, "Information", "Thumb Length: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; Set Thumb Length
	_GUICtrlSlider_SetThumbLength($hSlider, 10)

	; Get Thumb Length
	MsgBox(4160, "Information", "Thumb Length: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
