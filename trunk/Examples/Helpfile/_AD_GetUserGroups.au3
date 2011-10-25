#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ�û�����Ϊ���Ա������(FQDN)����������
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡ�û�����Ϊ���Ա������(FQDN)����������
Global $aUser = _AD_GetUserGroups(@UserName)
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "User'" & @UserName & "'has not been assigned to any group")
Else
	_ArraySort($aUser, 0, 1)
	_ArrayDisplay($aUser, "Active Directory Functions - Group names user'" & @UserName & "'is immediately a member of")
EndIf

; �ر�Active Directory����
_AD_Close()

