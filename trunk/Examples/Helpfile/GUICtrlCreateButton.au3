#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $Button_1, $Button_2, $msg
	GUICreate("My GUI Button") ; ����һ���Ի��򣬲�������ʾ

	Opt("GUICoordMode", 2)
	$Button_1 = GUICtrlCreateButton("�򿪼��±�", 10, 30, 100)
	$Button_2 = GUICtrlCreateButton("���԰�ť", 0, -1)

	GUISetState()      ; ��ʾ��������ť�ĶԻ���

	; ���н��棬ֱ�����ڱ��ر�
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $msg = $Button_1
				Run('Notepad.exe')    ; �����ť 1 �򿪼��±�
			Case $msg = $Button_2
				MsgBox(0, '����', '�����˲��԰�ť')    ; �����ť 2 ��ʾһ���򵥵ĶԻ���
		EndSelect
	WEnd
EndFunc   ;==>Example