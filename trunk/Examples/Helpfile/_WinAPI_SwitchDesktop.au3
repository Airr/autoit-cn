#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $hDesktop, $hPrev, $tDesktop, $tProcess, $tStartup

; ��ȡ��ǰ����ľ�����½���Ϊ"MyDesktop"������
$hPrev = _WinAPI_GetThreadDesktop( _WinAPI_GetCurrentThreadID())
$hDesktop = _WinAPI_CreateDesktop('MyDesktop ', BitOR($DESKTOP_CREATEWINDOW, $DESKTOP_SWITCHDESKTOP))
If Not $hDesktop Then
	msgbox(16, 'Error ', 'Unable to create desktop.')
	Exit
EndIf

;�л����½�������
_WinAPI_SwitchDesktop($hDesktop)

; ��"MyDesktop"������"calc.exe"ֱ���û��رս���
$tProcess = DllStructCreate($tagPROCESS_INFORMATION)
$tStartup = DllStructCreate($tagSTARTUPINFO)
DllStructSetData($tStartup, 'Size ', DllStructGetSize($tStartup))
DllStructSetData($tStartup, 'Desktop ', _WinAPI_CreateString('MyDesktop ', $tDesktop))
If _WinAPI_CreateProcess('', @SystemDir & ' \calc.exe ', 0, 0, 0, $CREATE_NEW_PROCESS_GROUP, 0, 0, DllStructGetPtr($tStartup), DllStructGetPtr($tProcess)) Then
	ProcessWaitClose( DllStructGetData($tProcess, 'ProcessID'))
EndIf
;�л���ԭ���沢�ر�"MyDesktop"
_WinAPI_SwitchDesktop($hPrev)
_WinAPI_CloseDesktop($hDesktop)

