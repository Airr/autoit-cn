#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Set Range Min", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Get Range Min
	MsgBox(4160, "��Ϣ", "Range Min: " & _GUICtrlSlider_GetRangeMin($hSlider))

	; Set Range Min
	_GUICtrlSlider_SetRangeMin($hSlider, 20)

	; Get Range Min
	MsgBox(4160, "��Ϣ", "Range Min: " & _GUICtrlSlider_GetRangeMin($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
