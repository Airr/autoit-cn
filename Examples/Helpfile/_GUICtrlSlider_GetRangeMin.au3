#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Get Range Min", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; ��ȡ��Χ����Сλ��
	MsgBox(4160, "��Ϣ", "Range Min: " & _GUICtrlSlider_GetRangeMin($hSlider))

	; ���÷�Χ����Сλ��
	_GUICtrlSlider_SetRangeMin($hSlider, 20)

	; ��ȡ��Χ����Сλ��
	MsgBox(4160, "��Ϣ", "Range Min: " & _GUICtrlSlider_GetRangeMin($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
