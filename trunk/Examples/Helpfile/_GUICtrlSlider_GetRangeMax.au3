#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Get Range Max", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; ��ȡ��Χ�����λ��
	MsgBox(4160, "Information", "Range Max: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; ���÷�Χ�����λ��
	_GUICtrlSlider_SetRangeMax($hSlider, 50)

	; ��ȡ��Χ�����λ��
	MsgBox(4160, "Information", "Range Max: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
