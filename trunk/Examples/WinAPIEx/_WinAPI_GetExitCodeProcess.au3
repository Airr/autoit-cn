#Include <APIConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global $PID, $hProcess

; _WinAPI_CreateProcess() ������õĽ����ʽ
$PID = Run('cmd.exe /k')
If Not $PID Then
	Exit
EndIf

; ע��, ���ϴ򿪽���
If _WinAPI_GetVersion() >= 6.0 Then
	$hProcess = _WinAPI_OpenProcess($PROCESS_QUERY_LIMITED_INFORMATION, 0, $PID)
Else
	$hProcess = _WinAPI_OpenProcess($PROCESS_QUERY_INFORMATION, 0, $PID)
EndIf
If Not $hProcess Then
	Exit
EndIf

; �ȴ�ֱ�������˳�, �������� "exit 6"
While ProcessExists($PID)
	Sleep(100)
WEnd

ConsoleWrite('Exit code: ' & _WinAPI_GetExitCodeProcess($hProcess) & @CR)

_WinAPI_CloseHandle($hProcess)
