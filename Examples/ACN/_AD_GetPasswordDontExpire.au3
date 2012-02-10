#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; �������벻����ڵ��û��ʻ�����
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; �������벻����ڵ��û��ʻ�����
Global $aNotExpire[1]
$aNotExpire = _AD_GetPasswordDontExpire()
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "No user accounts for which the password will not expire could be found")
Else
	_ArrayDisplay($aNotExpire, "Active Directory Functions - User accounts for which the password will not expire")
EndIf

; �ر�Active Directory����
_AD_Close()

