#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include <StructureConstants.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>

Opt('MustDeclareVars', 1)

Global $iMemo

_Example_Defaults()
_Example_ExplorerStyle()
_Example_OldStyle()
_Example_ExplorerStyle_NoPlaceBar()

Func _Example_Defaults()
	Local $hGui, $btn_dialog, $aFile, $sError

	; 创建界面
	$hGui = GUICreate("GetSaveFileName use defaults", 400, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("Save Dialog", 155, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetSaveFileName() ; use defaults
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "):" & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
endfunc   ;==>_Example_Defaults

Func _Example_ExplorerStyle()
	Local $hGui, $btn_dialog, $aFile, $sError

	; 创建界面
	$hGui = GUICreate("GetSaveFileName use Explorer Style", 400, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("Save Dialog", 155, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetSaveFileName("My Save File Dialog", _
						"Text File (*.txt)|AutoIt File (*.au3)", ".", _
						"", "au3", 2, 0, 0, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "):" & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
endfunc   ;==>_Example_ExplorerStyle

Func _Example_OldStyle()
	Local $hGui, $btn_dialog, $aFile, $sError

	; 创建界面
	$hGui = GUICreate("GetSaveFileName use Old Style", 400, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("Save Dialog", 155, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetSaveFileName("My Save File Dialog", _
						"Text File (*.txt)|AutoIt File (*.au3)", ".", "", _
						"", 2, $OFN_ALLOWMULTISELECT, 0, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "):" & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
endfunc   ;==>_Example_OldStyle

Func _Example_ExplorerStyle_NoPlaceBar()
	Local $hGui, $btn_dialog, $aFile, $sError

	; 创建界面
	$hGui = GUICreate("GetSaveFileName use Explorer Style No Place Bar", 400, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 226, $WS_HSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_dialog = GUICtrlCreateButton("Save Dialog", 155, 270, 90, 20)
	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $btn_dialog
				$aFile = _WinAPI_GetSaveFileName("My Save File Dialog", _
						"Text File (*.txt)|AutoIt File (*.au3)", ".", "", _
						"", 2, 0, $OFN_EX_NOPLACESBAR, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "):" & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
endfunc   ;==>_Example_ExplorerStyle_NoPlaceBar

; 向memo控件写入一行
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

