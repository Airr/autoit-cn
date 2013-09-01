#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aSel, $hSlider

	; Create GUI
	GUICreate("Slider Get Sel", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Set Sel
	_GUICtrlSlider_SetSel($hSlider, 10, 50)

	; Get Sel
	$aSel = _GUICtrlSlider_GetSel($hSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Sel: %d - %d", $aSel[0], $aSel[1]))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
