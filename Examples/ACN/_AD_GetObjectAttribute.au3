#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; *****************************************************************************
; ʾ��1 - ���Զ�ֵ����
; *****************************************************************************
Global $aResult = _AD_GetObjectAttribute(@UserName, "proxyAddresses")
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "Attribute 'proxyAddresses' for user'" & @UserName & "'could not be found")
Else
	_ArrayDisplay($aResult, "Active Directory Functions - User'" & @UserName & "', Attribute 'proxyAddresses'")
EndIf

; *****************************************************************************
; ʾ��2 - ���Ե�ֵ����
; *****************************************************************************
$aResult = _AD_GetObjectAttribute(@UserName, "mail")
msgbox(64, "Active Directory Functions", _
		"String returned for User'" & @UserName & "', Attribute 'mail':" & $aResult)

; �ر�Active Directory����
_AD_Close()

