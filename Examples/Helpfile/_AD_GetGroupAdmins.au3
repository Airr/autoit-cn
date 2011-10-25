#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ��ǰ�û���Ϊ��Ա���׸���Ĺ���Ա�б�
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡ�û���Ϊ��Ա����������������(FQDN)
Global $aUser
$aUser = _AD_GetUserGroups(@UserName)
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "User'" & @UserName & "'has not been assigned to any group")
	Exit
Else
	_ArraySort($aUser, 0, 1)
EndIf

; ��鵱ǰ�û���Ϊ��Ա�������鲢��ʾ�׸����й���Ա����
Global $Found = False
Global $iCount, $aAdmins
For $iCount = 1 To $aUser[0]
	$aAdmins = _AD_GetGroupAdmins($aUser[1])
	If @error = 0 Then
		$Found = True
		ExitLoop
	EndIf
Next
If Not $Found Then
	msgbox(64, "Active Directory Functions", "No admins assigned to all groups the current user is a member of")
	Exit
Else
	_ArrayDisplay($aAdmins, "Active Directory Functions - Admins for group'" & $aUser[$iCount] & "'")
EndIf

; �ر�Active Directory����
_AD_Close()

