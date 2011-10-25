#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

Global $aDisabled[1]
; *****************************************************************************
; ʾ��1 - ��ʾ��ǰ�����õ��û����б�
; *****************************************************************************
$aDisabled = _AD_GetObjectsDisabled()
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "No disabled user accounts could be found")
Else
	_ArrayDisplay($aDisabled, "Active Directory Functions - Disabled User Accounts")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡ���õļ�������б�
; *****************************************************************************
$aDisabled = _AD_GetObjectsDisabled("computer")
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "No disabled computers could be found")
Else
	_ArrayDisplay($aDisabled, "Active Directory Functions - Disabled Computers")
EndIf

; �ر�Active Directory����
_AD_Close()

