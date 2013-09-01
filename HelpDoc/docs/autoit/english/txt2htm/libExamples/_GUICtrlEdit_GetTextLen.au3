#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $hEdit, $hGUI
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"
	Local $aPartRightSide[2] = [378, -1]

	; Create GUI
	$hGUI = GUICreate("Edit Get Text Len", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 1, 97, "shell32.dll")
	GUISetState()

	; Set Margins
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Set Text
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))

	; Get Text Len
	_GUICtrlStatusBar_SetText($hStatusBar, "Text Len: " & _GUICtrlEdit_GetTextLen($hEdit) & " chars")

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
