#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $date, $del, $msg

	GUICreate("�ҵ�GUI-ɾ���ؼ�", 200, 200, 800, 200)
	$date = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)
	$del = GUICtrlCreateButton("ɾ���ؼ�", 50, 50, 70, 20)
	GUISetState()

	; ���� GUI �ȴ��Ի���ر�
	Do
		$msg = GUIGetMsg()
		If $msg = $del Then
			GUICtrlDelete($date)
			GUICtrlDelete($del)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example