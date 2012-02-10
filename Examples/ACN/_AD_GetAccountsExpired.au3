#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

Global $aDisabled[1]
; *****************************************************************************
; ʾ��1 - ��ȡ�����û��˻����б�
; *****************************************************************************
$aDisabled = _AD_GetAccountsExpired()
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "No expired user accounts could be found")
Else
	_ArrayDisplay($aDisabled, "Active Directory Functions - Expired User Accounts")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡ����׹����û��˻����б�
; *****************************************************************************
$aDisabled = _AD_GetAccountsExpired("user", @YEAR & "/12/31")
If @error = 0 Then
	_ArrayDisplay($aDisabled, "Active Directory Functions - Expired User Accounts")
ElseIf @error = 1 Then
	msgbox(64, "Active Directory Functions", "No expired user accounts could be found")
Else
	msgbox(64, "Active Directory Functions", "Invalid parameters provided")
EndIf

; *****************************************************************************
; ʾ��3 - ��ȡ����1�µ�10�¹����û��˻����б�
; *****************************************************************************
$aDisabled = _AD_GetAccountsExpired("user", @YEAR & "/10/31", @YEAR & "/01/01")
If @error = 0 Then
	_ArrayDisplay($aDisabled, "Active Directory Functions - Expired User Accounts")
ElseIf @error = 1 Then
	msgbox(64, "Active Directory Functions", "No expired user accounts could be found")
Else
	msgbox(64, "Active Directory Functions", "Invalid parameters provided")
EndIf

; *****************************************************************************
; ʾ��4 - ��ȡ���ڼ�����ʻ����б�
; *****************************************************************************
$aDisabled = _AD_GetAccountsExpired("computer")
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "No expired computer accounts could be found")
Else
	_ArrayDisplay($aDisabled, "Active Directory Functions - Expired computer Accounts")
EndIf

; �ر�Active Directory����
_AD_Close()

