#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

GUICreate("һ���򵥵������Ĳ˵�!",300,200)

Local $idTrackMenu = GUICtrlCreateContextMenu()
Local $idAboutItem = GUICtrlCreateMenuItem("����", $idTrackMenu)
; next one creates a menu separator (line)
GUICtrlCreateMenuItem("", $idTrackMenu)
Local $idExitItem = GUICtrlCreateMenuItem("�˳�", $idTrackMenu)

GUISetState()

While 1
	Local $iMsg = GUIGetMsg()
	If $iMsg = $idExitItem Or $iMsg = $GUI_EVENT_CLOSE Or $iMsg = -1 Then ExitLoop
	If $iMsg = $idAboutItem Then MsgBox($MB_SYSTEMMODAL, "����", "һ���򵥵������Ĳ˵�!")
WEnd
