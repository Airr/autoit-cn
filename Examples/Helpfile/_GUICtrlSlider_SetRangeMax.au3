#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Set Range Max", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Get Range Max
	MsgBox(4160, "��Ϣ", "Range Max: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; Set Range Max
	_GUICtrlSlider_SetRangeMax($hSlider, 50)

	; Get Range Max
	MsgBox(4160, "��Ϣ", "Range Max: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
