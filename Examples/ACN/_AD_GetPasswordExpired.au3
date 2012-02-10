#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡʹ�ù���������û��˻����б�
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡʹ�ù���������û��˻����б�
Global $aExpired[1]
$aExpired = _AD_GetPasswordExpired()
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "No users with expired passwords could be found")
Else
	_ArrayDisplay($aExpired, "Active Directory Functions - User accounts with expired password")
EndIf

; �ر�Active Directory����
_AD_Close()

