
#AutoIt3Wrapper_Au3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include  <GuiRichEdit.au3>
#include  <GUIConstantsEx.au3>
#include  <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Example (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Next", 270, 310, 40, 30)
	GUISetState()

	For $i = 1 To 5
		_GUICtrlRichEdit_AppendText($hRichEdit, "Line" & $i & @CR)
	Next
	_GUICtrlRichEdit_AppendText($hRichEdit, "Line 6")
	Report("Initial state")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				GUIDelete()
				Exit
			Case $iMsg = $btnNext
				$iStep += 1
				Switch $iStep
					Case 1
						_GuiCtrlRichEdit_SetReadOnly($hRichEdit)
						Report("Set to read-only")
					Case 2
						_GuiCtrlRichEdit_SetReadOnly($hRichEdit, False)
						Report("Now read-write")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
endfunc   ;==>Main

Func Report($sMsg)
	GUICtrlSetData($lblMsg, $sMsg & @CR & "Try typing some text")
	ControlFocus($hRichEdit, "", "")
endfunc   ;==>Report

