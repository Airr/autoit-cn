#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg
	GUICreate("My GUI Checkbox")  ; ����һ���Ի��򣬲�������ʾ

	GUICtrlCreateCheckbox("CHECKBOX 1", 10, 10, 120, 20)

	GUISetState()       ; ��ʾ�и�ѡ��(Checkbox)�ؼ��ĶԻ���

	; ���н���,ֱ�����ڱ��ر�
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example