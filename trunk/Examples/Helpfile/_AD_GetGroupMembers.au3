#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ��ǰ�û�Ϊ���Ա����������б�. Ȼ���ȡ�������׸�����������Ա�������б�.
; *****************************************************************************
#include  <AD.au3>

Global $aGroups[1], $aMembers[1]

; ��Active Directory����
_AD_Open()

; ��ȡ�û�����Ϊ���Ա���������(FQDN)����, Ԫ��0Ϊ������.
$aGroups = _AD_GetUserGroups()
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "The current user is not a member of any group")
Else
	; ��ȡ��ǰ��¼���û���Ϊ���Ա���׸���������ĳ�Ա�б�
	$aMembers = _AD_GetGroupMembers($aGroups[1])
	If @error > 0 Then
		msgbox(64, "Active Directory Functions", "The group'" & $aGroups[1] & "'has no members")
	Else
		_ArraySort($aMembers, 0, 1)
		_ArrayDisplay($aMembers, "Active Directory Functions - List of members for group'" & $aGroups[1] & "'")
	EndIf
EndIf

; �ر�Active Directory����
_AD_Close()

