#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $iTic = Random(0, 100, 1), $hSlider

	; ���� GUI
	GUICreate("Slider Set Tic", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Set Tic
	_GUICtrlSlider_SetTic($hSlider, $iTic)

	; Get Tic
	MsgBox(4160, "Information", "Tic: " & _GUICtrlSlider_GetTic($hSlider, $iTic))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
