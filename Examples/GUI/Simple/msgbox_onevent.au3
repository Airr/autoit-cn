; A simple custom messagebox that uses the OnEvent mode

#include <GUIConstantsEx.au3>

Opt("GUIOnEventMode", 1)

Global $ExitID

_Main()

Func _Main()
	Local $YesID, $NoID

GUICreate("�Զ��� Msgbox", 210, 80)

	GUICtrlCreateLabel("�뵥��һ����ť!", 10, 10)
$YesID  = GUICtrlCreateButton("��", 10, 50, 50, 20)
	GUICtrlSetOnEvent($YesID, "OnYes")
$NoID   = GUICtrlCreateButton("��", 80, 50, 50, 20)
	GUICtrlSetOnEvent($NoID, "OnNo")
$ExitID = GUICtrlCreateButton("�˳�", 150, 50, 50, 20)
	GUICtrlSetOnEvent($ExitID, "OnExit")

	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit")

	GUISetState() ; display the GUI

	While 1
		Sleep(1000)
	WEnd
EndFunc   ;==>_Main

;--------------- Functions ---------------
Func OnYes()
	MsgBox(0,"��������:", "��")
EndFunc   ;==>OnYes

Func OnNo()
	MsgBox(0,"��������:", "��")
EndFunc   ;==>OnNo

Func OnExit()
	If @GUI_CtrlId = $ExitID Then
		MsgBox(0,"��������:", "�˳�")
	Else
		MsgBox(0,"��������:", "�ر�")
	EndIf

	Exit
EndFunc   ;==>OnExit
