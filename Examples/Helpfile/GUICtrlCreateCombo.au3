#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg
	GUICreate("My GUI combo")  ; ����һ���Ի���,��������ʾ

	GUICtrlCreateCombo("item1", 10, 10) ; ����һ������б��(ComboBox)�ؼ�
	GUICtrlSetData(-1, "item2|item3", "item3") ; ���б��������µ���Ŀ��������һ���µ�Ĭ��ֵ

	GUISetState()

	; ���н���,ֱ�����ڱ��ر�
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example