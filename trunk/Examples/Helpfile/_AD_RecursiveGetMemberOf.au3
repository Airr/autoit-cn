#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ���ص�ǰ��¼�û�Ϊ���Ա����ĵݹ������б�.
; ���ڱ��̳е���, ��������û���FQDN���̳����FQDN, ��'|'�ָ�
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ���ص�ǰ��¼�û�Ϊ���Ա����ĵݹ������б�
Global $aUser = _AD_RecursiveGetMemberOf(@UserName, 10, 1)
If @error > 0 Then
	msgbox(64, "Active Directory Functions - Example 1", "User'" & @UserName & "'has not been assigned to any group")
Else
	; ���ڱ��̳е���, ��������û���FQDN���̳����FQDN, ��'|'�ָ�
	_ArrayDisplay($aUser, "Active Directory Functions - Example 1 - Group names user'" & @UserName & "'is a member of")
EndIf

; �ر�Active Directory����
_AD_Close()

