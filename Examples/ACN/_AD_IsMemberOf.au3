#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ��ǰ�û�Ϊ���Ա���������б�. ��鵱ǰ�û����ڵ��׸�������Ա. �����Ƿ���1.
; *****************************************************************************
#include  <AD.au3>

Global $aUser, $sFQDN_Group, $sFQDN_User, $iResult

; ��Active Directory����
_AD_Open()

; ��ȡ��ǰ�û���FQDN
$sFQDN_User = _AD_SamAccountNameToFQDN()

; ��ȡ��ǰ�û�Ϊ���Ա������������(FQDN)
$aUser = _AD_GetUserGroups(@UserName)
$sFQDN_Group = $aUser[1]

; ���ָ���û����������ָ�����Ա
$iResult = _AD_IsMemberOf($sFQDN_Group, $sFQDN_User)
Select
	Case $iResult = 1
		msgbox(64, "Active Directory Functions", _
				"User:" & $sFQDN_User & @CRLF & _
				"Group:" & $sFQDN_Group & @CRLF & _
				"User is a member of the specified group!")
	Case($iResult = 0 And @error = 1)
		msgbox(64, "Active Directory Functions", _
				"User:" & $sFQDN_User & @CRLF & _
				"Group:" & $sFQDN_Group & @CRLF & _
				"Group does not exist!")
	Case($iResult = 0 And @error = 2)
		msgbox(64, "Active Directory Functions", _
				"User:" & $sFQDN_User & @CRLF & _
				"Group:" & $sFQDN_Group & @CRLF & _
				"User does not exist!")
	Case($iResult = 0)
		msgbox(64, "Active Directory Functions", _
				"User:" & $sFQDN_User & @CRLF & _
				"Group:" & $sFQDN_Group & @CRLF & _
				"User is a not member of the specified group!")
EndSelect

; �ر�Active Directory����
_AD_Close()

