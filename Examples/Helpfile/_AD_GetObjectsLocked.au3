#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

Global $aLocked[1][2]
; *****************************************************************************
; ʾ��1 - ��ȡ�����˻����б�
; *****************************************************************************
$aLocked = _AD_GetObjectsLocked()
If @error > 0 Then
	msgbox(64, "Active Directory Functions - Example 1", "No locked user accounts have been found")
Else
	_ArrayDisplay($aLocked, "Active Directory Functions - Locked User Accounts")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡ������������б�
; *****************************************************************************
$aLocked = _AD_GetObjectsLocked("computer")
If @error > 0 Then
	msgbox(64, "Active Directory Functions - Example 2", "No locked computers have been found")
Else
	_ArrayDisplay($aLocked, "Active Directory Functions - Locked Computers")
EndIf

; �ر�Active Directory����
_AD_Close()

