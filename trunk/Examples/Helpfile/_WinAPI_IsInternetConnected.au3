#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

If _WinAPI_GetVersion() Then
	msgbox(16, 'Error ', 'Require Windows Vista or later.')
	Exit
EndIf

If _WinAPI_IsInternetConnected() Then
	msgbox(0, 'info ', 'Internet is already connected.')
	Exit
EndIf

; ͨ�����û�ȡ������������������
_WinAPI_GetConnectedDlg(1, 1 + 4)

