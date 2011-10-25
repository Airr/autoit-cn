#Include <GUIConstantsEx.au3>
#Include <WindowsConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $hForm, $Button, $hRgn

Dim $aPoint[10][2] = [[0, 100],[190, 180],[250, 0],[308, 180],[500, 180],[344, 294],[404, 475],[250, 362],[94, 475],[154, 294]]
$hForm = GUICreate('MyGUI ', 500, 475, -1, -1, $WS_POPUP, $WS_EX_TOPMOST)
$Button = GUICreateButton('MyGUI ', 500, 475, -1, -1, $WS_POPUP, $WS_EX_TOPMOST)
GUIRegisterMsg($WM_NCHITTEST, 'WM_NCHITTEST')
GUISetBkColor(0xAA0000)

$hRgn = _WinAPI_CreatePolygonRgn($aPoint)
_WinAPI_SetWindowRgn($hForm, $hRgn)

GUISetState()

Do
Until GUIGetMsg() = $Button

Func WM_NCHITTEST($hWnd, $Msg, $wParam, $lParam)
	If _WinAPI_DefWindowProc($hWnd, $Msg, $wParam, $lParam) = $HTCLIENT Then
		Return $HTCAPTION
	EndIf
	Return $GUI_RUNDEFMSG
endfunc   ;==>WM_NCHITTEST

