#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>

Global $hAVI

Example()

Func Example()
	Local $hGUI

	; Create GUI
	$hGUI = GUICreate("(External) AVI OpenEx", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState()

	; Play the sample AutoIt AVI
	_GUICtrlAVI_OpenEx($hAVI, @SystemDir & "\Shell32.dll", 150)

	; Play the sample AutoIt AVI
	_GUICtrlAVI_Play($hAVI)

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Close AVI clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>Example
