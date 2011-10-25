#Include <GuiConstantsEx.au3>
#Include <WinAPIEx.au3>
#Include <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

Global Const $Flags = BitOR($BIF_RETURNONLYFSDIRS, $BIF_EDITBOX, $BIF_VALIDATE)
Global Const $InitDir = @ProgramFilesDir

Global $hBrowseProc = DllCallbackRegister('_BrowseProc ', 'int ', 'hwnd;uint;long;ptr')
Global $tData = DllStructCreate('wchar[' & ( StringLen($InitDir) + 1) & ' ]')
Global $Path, $iMemo

_Main()

Func _Main()
	GUICreate(" selected item ", 360, 360, 200, 200)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 356, 356)
	GUISetState()

	DllStructSetData($tData, 1, $InitDir)
	$Path = _WinAPI_BrowseForFolderDlg( StringLeft($InitDir, 3), 'Select a folder from the list below. ', $Flags, DllCallbackGetPtr($hBrowseProc), DllStructGetPtr($tData))

	If $Path Then
		memowrite('--------------------------------------------------' & @CR)
		memowrite($Path & @CR)
	EndIf

	DllCallbackFree($hBrowseProc)
endfunc   ;==>_Main

Func _BrowseProc($hWnd, $iMsg, $wParam, $lParam)

	Local $tData

	Switch $iMsg
		Case $BFFM_INITIALIZED
			_WinAPI_SetWindowText($hWnd, 'Select Folder')
			_SendMessage($hWnd, $BFFM_SETSELECTION, 1, $lParam)
		Case $BFFM_SELCHANGED
			memowrite( _WinAPI_ShellGetPathFromIDList($wParam) & @CR)
		Case $BFFM_VALIDATEFAILED
			$tData = DllStructCreate( _WinAPI_StrLen($wParam), $wParam)
			MsgBox(16, 'Error ', DllStructGetData($tData, 1) & ' is invalid. ', 0, $hWnd)
			Return 1
	EndSwitch
	Return 0
endfunc   ;==>_BrowseProc

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

