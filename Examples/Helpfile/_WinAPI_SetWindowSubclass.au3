#Include ' apiDebugger.au3 '
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $hForm, $hDll, $pDll

OnAutoItExitRegister('OnAutoItExit')

; ��������
$hForm = GUICreate('MyGUI')

; ע��Ҫ�������������ʹ�õ�DLL�ص�
$hDll = DllCallbackRegister('_SubclassProc ', 'lresult ', 'hwnd;uint;wparam;lparam;uint_ptr;dword_ptr')
$pDll = DllCallbackGetPtr($hDll)

; ��װ��������ص�
_WinAPI_SetWindowSubclass($hForm, $pDll, 1000, 0)
GUISetState()

Do
Until GUIGetMsg() = -3

Func _SubclassProc($hWnd, $iMsg, $wParam, $lParam, $ID, $pData)
	; ��WMDebug.au3�ж���
	_WM_Debug($hWnd, $iMsg, $wParam, $lParam)
	Return _WinAPI_DefSubclassProc($hWnd, $iMsg, $wParam, $lParam) endfunc ;==>_SubclassProc

;### Tidy Error -> func Not closed before "Func" statement.
;### Tidy Error -> "func" cannot be inside any IF/Do/While/For/Case/Func statement.
	Func OnAutoItExit()
		_WinAPI_RemoveWindowSubclass($hForm, $pDll, 1000)
		DllCallbackFree($hDll)
	endfunc   ;==>OnAutoItExit


;### Tidy Error -> func is never closed in your script.
