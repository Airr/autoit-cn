; A simple custom messagebox that uses the OnEvent mode

#include <Constants.au3>
#include <GUIConstantsEx.au3>

Opt("GUIOnEventMode", 1)

Global $g_idExit

_Main()

Func _Main()
	Local $idYes, $idNo

	GUICreate("�Զ��� MsgBox", 210, 80)

	GUICtrlCreateLabel("�뵥��һ����ť!", 10, 10)
	$idYes  = GUICtrlCreateButton("��", 10, 50, 50, 20)
	GUICtrlSetOnEvent($idYes, "OnYes")
	$idNo   = GUICtrlCreateButton("��", 80, 50, 50, 20)
	GUICtrlSetOnEvent($idNo, "OnNo")
	$g_idExit = GUICtrlCreateButton("�˳�", 150, 50, 50, 20)
	GUICtrlSetOnEvent($g_idExit, "OnExit")

	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")

	GUISetState() ; display the GUI

	While 1
		Sleep(1000)
	WEnd
EndFunc   ;==>_Main

; --------------- Functions ---------------
Func OnYes()
	MsgBox($MB_SYSTEMMODAL,"��������:", "��")
EndFunc   ;==>OnYes

Func OnNo()
	MsgBox($MB_SYSTEMMODAL,"��������:", "��")
EndFunc   ;==>OnNo

Func OnExit()
	If @GUI_CtrlId = $g_idExit Then
		MsgBox($MB_SYSTEMMODAL,"��������:", "�˳�")
	Else
		MsgBox($MB_SYSTEMMODAL,"��������:", "�ر�")
	EndIf

	Exit
EndFunc   ;==>OnExit
