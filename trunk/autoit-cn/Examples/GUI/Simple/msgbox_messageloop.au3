; A simple custom messagebox that uses the MessageLoop mode

#include <GUIConstantsEx.au3>


_Main()

Func _Main()
	Local $YesID, $NoID, $ExitID, $msg

GUICreate("�Զ��� Msgbox", 210, 80)

$Label = GUICtrlCreateLabel("�뵥��һ����ť!", 10, 10)
$YesID  = GUICtrlCreateButton("��", 10, 50, 50, 20)
$NoID   = GUICtrlCreateButton("��", 80, 50, 50, 20)
$ExitID = GUICtrlCreateButton("�˳�", 150, 50, 50, 20)

	GUISetState()  ; display the GUI

	Do
		$msg = GUIGetMsg()

		Select
			Case $msg = $YesID
			MsgBox(0,"��������:", "��")
			Case $msg = $NoID
			MsgBox(0,"��������:", "��")
			Case $msg = $ExitID
			MsgBox(0,"��������:", "�˳�")
			Case $msg = $GUI_EVENT_CLOSE
			MsgBox(0,"��������:", "�ر�")
		EndSelect
	Until $msg = $GUI_EVENT_CLOSE Or $msg = $ExitID
EndFunc   ;==>_Main
