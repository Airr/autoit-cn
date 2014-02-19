#include <MsgBoxConstants.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hwnd, $hDC
	$hwnd = GUICreate("test")
	$hDC = _WinAPI_GetDC($hwnd)
	MsgBox($MB_SYSTEMMODAL, "Handle", "Display Device: " & $hDC)
	_WinAPI_ReleaseDC($hwnd, $hDC)
EndFunc   ;==>Example
