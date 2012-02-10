#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡ��ǰ��¼�û���FQDN
Global $sFQDN = _AD_SamAccountNameToFQDN()

; ���CN
Global $iPos = StringInStr($sFQDN, ",")
Global $sOU = StringMid($sFQDN, $iPos + 1)

Global $aObjects[1][1]

; *****************************************************************************
; ʾ��1 - ��ȡ��ǰ��ָ�ɸ��û���OU. Ȼ���ȡ��OU��δ�����˵����ж�����б�
; *****************************************************************************
$aObjects = _AD_GetObjectsInOU($sOU, "(name=*)", 2, "sAMAccountName,distinguishedName,displayname")
If @error > 0 Then
	MsgBox(64, "Active Directory Functions - Example 1", "No OUs could be found")
Else
	_ArrayDisplay($aObjects, "Active Directory Functions - Objects in OU'" & $sOU & "'")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡ��ǰ��ָ�ɸ��û���OU. ��ȡ��OU�е������û��ľ������˺��Ե�ǰ�û�������ĸ��ʼ���б�. ����ʾ��������.
; *****************************************************************************
Global $sUser = StringLeft(@UserName, 1)
$aObjects = _AD_GetObjectsInOU($sOU, "(&(objectcategory=person)(objectclass=user)(cn=" & $sUser & "*))", 2, "sAMAccountName,distinguishedName,displayname", "displayname")
If @error > 0 Then
	MsgBox(64, "Active Directory Functions - Example 2", "No OUs could be found")
Else
	_ArrayDisplay($aObjects, "Active Directory Functions - Objects in OU'" & $sOU & "'")
EndIf

; *****************************************************************************
; ʾ��3 - ʹ��ANR(Ambigous���ƽ���)�����������ȡ��ͬ�������Ƶ����ж�����Ϊ��ǰ�û���ANR֧�ֵ������ֶ�
; *****************************************************************************
Global $sGivenName = _AD_GetObjectAttribute(@UserName, "GivenName")
$aObjects = _AD_GetObjectsInOU("", "(ANR=" & $sGivenName & ")", 2, "sAMAccountName,distinguishedName,displayname", "displayname")
If @error > 0 Then
	MsgBox(64, "Active Directory Functions", "No objects found")
Else
	_ArrayDisplay($aObjects, "Active Directory Functions - Ambigous Name Resolution. Search for'" & $sGivenName & "'")
EndIf

If MsgBox(36, "Active Directory Functions", "Would you like to see further examples using extended LDAP queries?") <> 7 Then
	$sOU = ""
	; ********************************
	; δ�����û��ʻ�
	; ********************************
	_Examples("(&(objectCategory=person)(objectClass=user)(|(accountExpires=9223372036854775807)(accountExpires=0)))", "sAMAccountName,distinguishedName,displayname", "User accounts that do not expire")
	; *************************************
	; �û���������
	; *************************************
	_Examples("(&(objectCategory=person)(objectClass=user)(userAccountControl:1.2.840.113556.1.4.803:=32))", "sAMAccountName,distinguishedName,displayname", "Users not required to have a password")
	; **********************************************************************************
	; �������û����˱�ָ��Ϊ"����"���"���û�"
	; **********************************************************************************
	_Examples("(&(objectCategory=person)(objectClass=user)(!primaryGroupID=513))", "sAMAccountName,distinguishedName,displayname", "Users with any group other than 'Domain Users' designated as their 'primary group'")
	; **************************************************************
	; �´ε�¼ʱ�����޸�������û�
	; **************************************************************
	_Examples("(&(objectCategory=person)(objectClass=user)(pwdLastSet=0))", "sAMAccountName,distinguishedName,displayname", "Users that must change their password the next time they logon")
	; *********************************
	; ��ǰ��δ��¼���û�
	; *********************************
	_Examples("(&(&(objectCategory=person)(objectClass=user))(|(lastLogon=0)(!(lastLogon=*))))", "sAMAccountName,distinguishedName,displayname", "Users that never logged on before")
	; **************************
	; ����������б�
	; **************************
	_Examples("(objectClass=groupPolicyContainer)", "displayName,gPCFileSysPath", "List of Group Policies")
EndIf

; �ر�Active Directory����
_AD_Close()

; **********************************************************
; ִ��LDAP��ѯ����������ʾ���
; **********************************************************
Func _Examples($query, $fields, $description)

	Local $aObjects[1][1]
	$aObjects = _AD_GetObjectsInOU($sOU, $query, 2, $fields)
	If @error <> 0 Then
		MsgBox(64, "Active Directory Functions - Extended Example", "No entries found for LDAP query" & @CRLF & $query & @CRLF & $description & @CRLF & "Error:" & @error)
	Else
		_ArrayDisplay($aObjects, "LDAP query -" & $description & " -" & $query)
	EndIf

endfunc   ;==>_Examples

