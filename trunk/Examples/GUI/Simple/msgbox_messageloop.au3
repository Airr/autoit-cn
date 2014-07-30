; A simple custom messagebox that uses the MessageLoop mode

#include <Constants.au3>
#include <GUIConstantsEx.au3>

_Main()

Func _Main()
	Local $idYes, $idNo, $idExit, $iMsg

	GUICreate("�Զ��� MsgBox", 210, 80)

	GUICtrlCreateLabel("�뵥��һ����ť!", 10, 10)
	$idYes = GUICtrlCreateButton("��", 10, 50, 50, 20)
	$idNo = GUICtrlCreateButton("��", 80, 50, 50, 20)
	$idExit = GUICtrlCreateButton("�˳�", 150, 50, 50, 20)

	GUISetState() ; display the GUI

	Do
		$iMsg = GUIGetMsg()

		Select
			Case $iMsg = $idYes
			MsgBox($MB_SYSTEMMODAL,"��������:", "��")
			Case $iMsg = $idNo
			MsgBox($MB_SYSTEMMODAL,"��������:", "��")
			Case $iMsg = $idExit
			MsgBox($MB_SYSTEMMODAL,"��������:", "�˳�")
			Case $iMsg = $GUI_EVENT_CLOSE
			MsgBox($MB_SYSTEMMODAL,"��������:", "�ر�")
		EndSelect
	Until $iMsg = $GUI_EVENT_CLOSE Or $iMsg = $idExit
EndFunc   ;==>_Main
