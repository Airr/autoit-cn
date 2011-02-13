#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global Const $STM_SETIMAGE = 0x0172

Global $hIcon, $hOverlay, $hResult

; Create icon with overlay mask (48x48)
$hIcon = _WinAPI_ShellExtractIcon(@SystemDir & '\shell32.dll', 1, 48, 48)
If _WinAPI_GetVersion() >= '6.0' Then
	$hOverlay = _WinAPI_ShellExtractIcon(@SystemDir & '\imageres.dll', 154, 48, 48)
Else
	$hOverlay = _WinAPI_ShellExtractIcon(@SystemDir & '\shell32.dll', 29, 48, 48)
EndIf
$hResult = _WinAPI_AddIconOverlay($hIcon, $hOverlay)
_WinAPI_DestroyIcon($hIcon)
_WinAPI_DestroyIcon($hOverlay)

; Create GUI
GUICreate('MyGUI', 128, 128)
GUICtrlCreateIcon('', 0, 40, 40, 32, 32)
GUICtrlSendMsg(-1, $STM_SETIMAGE, 1, $hResult)
GUISetState()

Do
Until GUIGetMsg() = -3
