; A simple custom messagebox that uses the MessageLoop mode

#include <GUIConstantsEx.au3>
#include <Constants.au3>

_Main()

Func _Main()
	Local $YesID, $NoID, $ExitID, $msg

GUICreate("�Զ��� MsgBox", 210, 80)

	GUICtrlCreateLabel("�뵥��һ����ť!", 10, 10)
$YesID  = GUICtrlCreateButton("��", 10, 50, 50, 20)
$NoID   = GUICtrlCreateButton("��", 80, 50, 50, 20)
$ExitID = GUICtrlCreateButton("�˳�", 150, 50, 50, 20)

	GUISetState() ; display the GUI

	Do
		$msg = GUIGetMsg()

		Select
			Case $msg = $YesID
			MsgBox($MB_SYSTEMMODAL,"��������:", "��")
			Case $msg = $NoID
			MsgBox($MB_SYSTEMMODAL,"��������:", "��")
			Case $msg = $ExitID
			MsgBox($MB_SYSTEMMODAL,"��������:", "�˳�")
			Case $msg = $GUI_EVENT_CLOSE
			MsgBox($MB_SYSTEMMODAL,"��������:", "�ر�")
		EndSelect
	Until $msg = $GUI_EVENT_CLOSE Or $msg = $ExitID
EndFunc   ;==>_Main
