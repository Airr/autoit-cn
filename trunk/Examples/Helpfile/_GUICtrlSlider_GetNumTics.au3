#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Get Num Tics", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Get Num Tics
	MsgBox(4160, "Information", "Num Tics: " & _GUICtrlSlider_GetNumTics($hSlider))

	; Set Tic Freq
	_GUICtrlSlider_SetTicFreq($hSlider, 1)

	; Get Num Tics
	MsgBox(4160, "Information", "Num Tics: " & _GUICtrlSlider_GetNumTics($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
