#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Set Tic Freq", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; ��ȡ�̶���
	MsgBox(4160, "��Ϣ", "Num Tics: " & _GUICtrlSlider_GetNumTics($hSlider))

	; ���ÿ̶�Ƶ��
	_GUICtrlSlider_SetTicFreq($hSlider, 1)

	; ��ȡ�̶���
	MsgBox(4160, "��Ϣ", "Num Tics: " & _GUICtrlSlider_GetNumTics($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
