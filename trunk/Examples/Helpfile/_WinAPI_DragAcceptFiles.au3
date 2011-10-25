#Include <GUIConstantsEx.au3>
#Include <Constants.au3>
#Include <Array.au3>
#Include <WinAPIEx.au3>
#Include <WindowsConstants.au3>

Global Const $WM_DROPFILES = 0x0233

Global $hForm, $Msg, $Check, $Label, $Edit, $hLabel, $hDll, $pDll, $hProc

; ��������
$hForm = GUICreate('MyGUI ', 720, 400)
$Check = GUICtrlCreateCheckbox('Enable Drag && Drop ', 10, 270, 120, 19)
$Edit = GUICtrlCreateEdit('', 380, 100, 200, 200)
$Label = GUICtrlCreateLabel('', 100, 100, 200, 200)
$hLabel = GUICtrlGetHandle($Label)
GUICtrlSetBkColor(-1, 0xD3D8EF)
GUICtrlCreateLabel('Drop here ', 175, 193, 50, 14)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

; ע���ǩ���ڽ���
$hDll = DllCallbackRegister('_WinProc ', 'ptr ', 'hwnd;uint;wparam;lparam')
$pDll = DllCallbackGetPtr($hDll)
$hProc = _WinAPI_SetWindowLong($hLabel, $GWL_WNDPROC, $pDll)

GUISetState()

While 1
	$Msg = GUIGetMsg()
	Switch $Msg
		Case $GUI_EVENT_CLOSE
			ExitLoop
		Case $Check
			_WinAPI_DragAcceptFiles($hLabel, GUICtrlRead($Check) = $GUI_CHECKED)
	EndSwitch
WEnd

Func _WinProc($hWnd, $iMsg, $wParam, $lParam)
	Switch $iMsg
		Case $WM_DROPFILES

			Local $FileList = _WinAPI_DragQueryFileEx($wParam)

			If IsArray($FileList) Then
				GUICtrlSetData($Edit, _ArrayToString($FileList, @CRLF, 1, $FileList[0]))
			EndIf
			_WinAPI_DragFinish($wParam)
			Return 0
	EndSwitch
	Return _WinAPI_CallWindowProc($hProc, $hWnd, $iMsg, $wParam, $lParam)
endfunc   ;==>_WinProc

Func OnAutoItExit()
	_WinAPI_SetWindowLong($hLabel, $GWL_WNDPROC, $hProc)
	DllCallbackFree($hDll)
endfunc   ;==>OnAutoItExit

