#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hSlider

	; ���� GUI
	GUICreate("Slider Set Unicode Format", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; ��ȡ Unicode ��ʽ
	MsgBox(4160, "��Ϣ", "Unicode Format: " & _GUICtrlSlider_GetUnicodeFormat($hSlider))

	; ���� Unicode ��ʽ
	MsgBox(4160, "��Ϣ", "Previous Unicode Format: " & _GUICtrlSlider_SetUnicodeFormat($hSlider, False))

	; ��ȡ Unicode ��ʽ
	MsgBox(4160, "��Ϣ", "Unicode Format: " & _GUICtrlSlider_GetUnicodeFormat($hSlider))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
