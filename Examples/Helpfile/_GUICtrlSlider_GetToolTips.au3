#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hWndTT, $hSlider

	; ���� GUI
	GUICreate("Slider Get Tool Tips", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Get Tool Tips
	$hWndTT = _GUICtrlSlider_GetToolTips($hSlider)
	MsgBox(4160, "��Ϣ", "Tool Tip Handle: " & $hWndTT)

	; Set Tool Tips
	_GUICtrlSlider_SetToolTips($hSlider, $hWndTT)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
