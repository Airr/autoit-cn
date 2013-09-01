#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Create GUI
	GUICreate("Slider Get Line Size", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Get Line Size
	MsgBox($MB_SYSTEMMODAL, "Information", "Line Size: " & _GUICtrlSlider_GetLineSize($hSlider))

	; Set Line Size
	_GUICtrlSlider_SetLineSize($hSlider, 4)

	; Get Line Size
	MsgBox($MB_SYSTEMMODAL, "Information", "Line Size: " & _GUICtrlSlider_GetLineSize($hSlider))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
