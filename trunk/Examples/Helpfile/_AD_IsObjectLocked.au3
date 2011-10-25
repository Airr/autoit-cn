#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; *****************************************************************************
; ʾ��1 - ��鵱ǰ�û����˻��Ƿ�����
; *****************************************************************************
If _AD_IsObjectLocked() Then
	msgbox(64, "Active Directory Functions", "User account'" & @UserName & "'is locked")
Else
	msgbox(64, "Active Directory Functions", "User account'" & @UserName & "'is not locked")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡ�����˻����б�����׸�ֵ
; *****************************************************************************
Global $aLocked = _AD_GetObjectsLocked()

If $aLocked[0] > 0 Then
	Global $sUser = _AD_FQDNToSamAccountName($aLocked[1])
	If _AD_IsObjectLocked($sUser) Then
		msgbox(64, "Active Directory Functions", "User account'" & $sUser & "'is locked")
	Else
		msgbox(64, "Active Directory Functions", "User account'" & $sUser & "'is not locked")
	EndIf
Else
	msgbox(64, "Active Directory Functions", "No locked users accounts found")
EndIf
; �ر�Active Directory����
_AD_Close()

