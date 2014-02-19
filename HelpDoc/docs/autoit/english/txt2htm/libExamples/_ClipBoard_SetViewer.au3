#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <SendMessage.au3>
#include <WindowsConstants.au3>

Global $iMemo, $hNext = 0

Example()

Func Example()
	Local $hGUI

	; Create GUI
	$hGUI = GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Initialize clipboard viewer
	$hNext = _ClipBoard_SetViewer($hGUI)

	GUIRegisterMsg($WM_CHANGECBCHAIN, "WM_CHANGECBCHAIN")
	GUIRegisterMsg($WM_DRAWCLIPBOARD, "WM_DRAWCLIPBOARD")

	MemoWrite("GUI handle ....: " & $hGUI)
	MemoWrite("Viewer handle .: " & _ClipBoard_GetViewer())

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Shut down clipboard viewer
	_ClipBoard_ChangeChain($hGUI, $hNext)
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Handle $WM_CHANGECBCHAIN messages
Func WM_CHANGECBCHAIN($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	; Show that message was received
	MemoWrite("***** $WM_CHANGECBCHAIN *****")

	; If the next window is closing, repair the chain
	If $iwParam = $hNext Then
		$hNext = $ilParam
		; Otherwise pass the message to the next viewer
	ElseIf $hNext <> 0 Then
		_SendMessage($hNext, $WM_CHANGECBCHAIN, $iwParam, $ilParam, 0, "hwnd", "hwnd")
	EndIf
EndFunc   ;==>WM_CHANGECBCHAIN

; Handle $WM_DRAWCLIPBOARD messages
Func WM_DRAWCLIPBOARD($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	; Display any text on clipboard
	MemoWrite(_ClipBoard_GetData())

	; Pass the message to the next viewer
	If $hNext <> 0 Then _SendMessage($hNext, $WM_DRAWCLIPBOARD, $iwParam, $ilParam)
EndFunc   ;==>WM_DRAWCLIPBOARD
