﻿#AutoIt3Wrapper_Au3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Main()

Func Main()
	Local $hGui, $hRichEdit, $iMsg
	$hGui = GUICreate("Example (" & StringTrimRight(@ScriptName,4) &")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState()

	_GuiCtrlRichEdit_AppendText($hRichEdit, "Para with default border settings")
	MsgBox(4096, "", "The default paragraph border settings are " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	_GuiCtrlRichEdit_AppendText($hRichEdit, @CR & "Second paragraph")
	_GUICtrlRichEdit_SetParaBorder($hRichEdit, "o", 3, "mag", 0.25)
	MsgBox(4096, "", "Border settings of second paragraph are " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	_GuiCtrlRichEdit_SetSel($hRichEdit, 10, -1)
	Sleep(1000)
	MsgBox(4096, "", "Border settings of first paragraph in the selection are " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	; Change from outside border to left border
	_GUICtrlRichEdit_SetParaBorder($hRichEdit, "l")

	; Stream all text to the Desktop so you can look at border settings in Word
	_GUICtrlRichEdit_Deselect($hRichEdit)
	_GuiCtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				GUIDelete()
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Main
