#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Example (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Next", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	Report("Initial state after creation")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; needed unless script crashes
				; GUIDelete() 	; is OK too
				Exit
			Case $iMsg = $btnNext
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_AppendText($hRichEdit, @CRLF & "A paragraph")
						Report("Added some text")
					Case 2
						_GUICtrlRichEdit_SetModified($hRichEdit, False)
						Report("After clearing the modification flag")
					Case 3
						GUICtrlSetData($lblMsg, "Type some text. Then click on Next")
					Case 4
						Report("After typing")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CRLF & @CRLF & "State is " & _GUICtrlRichEdit_IsModified($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report
