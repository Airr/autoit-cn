#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Set Page Size", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Get Page Size
	MsgBox(4160, "��Ϣ", "Page Size: " & _GUICtrlSlider_GetPageSize($hSlider))

	; Set Page Size
	_GUICtrlSlider_SetPageSize($hSlider, 4)

	; Get Page Size
	MsgBox(4160, "��Ϣ", "Page Size: " & _GUICtrlSlider_GetPageSize($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
