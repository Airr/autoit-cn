
; �����ص�����
$handle = DLLCallbackRegister ("_EnumWindowsProc", "int", "hwnd;lparam")     

; ���� EnumWindows
DllCall("user32.dll", "int", "EnumWindows", "ptr", DllCallbackGetPtr($handle), "lparam", 10)

; ɾ���ص�����
DllCallbackFree($handle)

; �ص�����
Func _EnumWindowsProc($hWnd, $lParam)
	If WinGetTitle($hWnd) <> "" And BitAnd(WinGetState($hWnd), 2) Then
		$res = MsgBox(1, WinGetTitle($hWnd), "$hWnd=" & $hWnd & @CRLF & "lParam=" & $lParam & @CRLF & "$hWnd(type)=" & VarGetType($hWnd))
		If $res = 2 Then Return 0	; "ȡ��"�����, ���� 0 ��ֹͣö��
	EndIf
	Return 1	; ���� 1 ����ö��
EndFunc
