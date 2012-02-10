#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ����������Ա�б�(FQDN)
; *****************************************************************************
#include  <AD.au3>

Global $aGroups, $aMemberOf[1]

; ��Active Directory����
_AD_Open()

; ��ȡ�û�����Ϊ���Ա���������(FQDN)����, Ԫ��0Ϊ������.
$aGroups = _AD_GetUserGroups()

; ��ȡ��ǰ��¼�û�Ϊ���Ա���׸���������ĳ�Ա�б�
$aMemberOf = _AD_GetGroupMemberOf($aGroups[1])
_ArraySort($aMemberOf, 0, 1)
_arraydisplay($aMemberOf, "Active Directory Functions - Membership for group'" & $aGroups[1] & "'")

; �ر�Active Directory����
_AD_Close()

