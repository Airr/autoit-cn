
; �����ؽк���
$handle = DLLCallbackRegister ("_EnumWindowsProc", "int", "hwnd;lparam")     

; ���� EnumWindows
DllCall("user32.dll", "int", "EnumWindows", "ptr", DllCallbackGetPtr($handle), "lparam", 10)

; ɾ���ؽк���
DllCallbackFree($handle)

; �ؽй���
Func _EnumWindowsProc($hWnd, $lParam)
	If WinGetTitle($hWnd) <> "" And BitAnd(WinGetState($hWnd), 2) Then
		$res = MsgBox(1, WinGetTitle($hWnd), "���=" & $hWnd & @CRLF & "����=" & $lParam & @CRLF & "���(����)=" & VarGetType($hWnd))
		If $res = 2 Then Return 0	; ����"ȡ��", ���� 0 ֹͣö��
	EndIf
	Return 1	; ���� 1 ����ö��
EndFunc
