#include <GUIConstantsEx.au3>
#include <Constants.au3>

GUICreate("һ���򵥵������Ĳ˵�!",300,200)

Local $trackmenu = GUICtrlCreateContextMenu()
Local $aboutitem = GUICtrlCreateMenuItem("����", $trackmenu)
; next one creates a menu separator (line)
GUICtrlCreateMenuItem("", $trackmenu)
Local $exititem = GUICtrlCreateMenuItem("�˳�", $trackmenu)

GUISetState()

While 1
	Local $msg = GUIGetMsg()
	If $msg = $exititem Or $msg = $GUI_EVENT_CLOSE Or $msg = -1 Then ExitLoop
	If $msg = $aboutitem Then MsgBox($MB_SYSTEMMODAL,"����","һ���򵥵������Ĳ˵�!")
WEnd
