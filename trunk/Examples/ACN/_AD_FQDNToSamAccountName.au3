#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ********************************************************************************
; ʾ�� 1 - ������ǰ�û�. ��SamAccountname��ȡFQDN. Ȼ���FQDN��ȡ��ʾ����.
; ********************************************************************************
; ��ȡ��ǰ�û���ȫ�Ϸ�������(FQDN)
Global $sFQDN = _AD_SamAccountNameToFQDN()

; �ӵ�ǰ�û�����ȫ�Ϸ�������ȡSAMAccountName
Global $sSamAccountName = _AD_FQDNToSamAccountName($sFQDN)

msgbox(64, "Active Directory Functions", "The Fully Qualified Domain Name (FQDN) for the currently logged on user is:" & @CRLF & $sFQDN & @CRLF & @CRLF & _
		"The Security Accounts Manager (SAM) Account Name (SamAccountName) for the current logged on user is:" & @CRLF & $sSamAccountName)

; ********************************************************************************
