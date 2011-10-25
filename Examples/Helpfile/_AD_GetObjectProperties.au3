#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

Global $aProperties[1][2]

; *****************************************************************************
; ʾ��1 - ��ʾ��ǰ�û�������
; *****************************************************************************
$aProperties = _AD_GetObjectProperties(@UserName)
_ArrayDisplay($aProperties, "Active Directory Functions - Properties for user'" & @UserName & "'")

; *****************************************************************************
; ʾ��2 - ��ʾ��ǰ�����������
; *****************************************************************************
$aProperties = _AD_GetObjectProperties(@ComputerName & "$")
_ArrayDisplay($aProperties, "Active Directory Functions - Properties for computer'" & @ComputerName & "'")

; *****************************************************************************
; ʾ��3 - ��ȡ�û�����Ϊ���Ա�������Ƶ����鲢��ʾ�׸��������
; *****************************************************************************
Global $aUser
$aUser = _AD_GetUserGroups(@UserName)
If $aUser[0] = 0 Then
	msgbox(64, "Active Directory Functions - Example 3", "User'" & @UserName & "'is not a member of any group")
Else
	Global $sGroup = _AD_FQDNToSamAccountName($aUser[1])
	$aProperties = _AD_GetObjectProperties($sGroup)
	_ArrayDisplay($aProperties, "Active Directory Functions - Properties for group'" & $sGroup & "'")
EndIf

; *****************************************************************************
; ʾ��4 - ��ʾ�ӱ�ָ�ɸ�ʾ��3�����OU������
; *****************************************************************************
Global $sOU = StringTrimLeft($aUser[1], StringInStr($aUser[1], ","))
$aProperties = _AD_GetObjectProperties($sOU)
_ArrayDisplay($aProperties, "Active Directory Functions - Properties for OU'" & $sOU & "'")

; �ر�Active Directory����
_AD_Close()

