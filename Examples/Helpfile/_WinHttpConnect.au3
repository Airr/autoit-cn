#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()

; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, "www.pravda.ru")
If @error Then
	MsgBox(48, "Error", "Error getting connection handle." & @CRLF & "Error number is " & @error)
Else
	ConsoleWrite("+ Connection handle $hConnect = " & $hConnect & @CRLF)
	MsgBox(64, "Yes!", "Handle is get! $hConnect = " & $hConnect)
EndIf

; �رվ��
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)