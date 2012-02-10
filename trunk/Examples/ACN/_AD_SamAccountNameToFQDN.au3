#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ���ӵ�Active Directory
_AD_Open()

; *****************************************************************************
; ʾ��1 - ��ȡ��ǰ�û�����ȫ�Ϸ�������(FQDN)
; *****************************************************************************
Global $sFQDN = _AD_SamAccountNameToFQDN()
msgbox(64, "Active Directory Functions", "The Fully Qualified Domain Name (FQDN) for the currently logged on user is:" & @CRLF & $sFQDN)

; *****************************************************************************
; ʾ��2 - ��ȡ���иýű��ļ��������ȫ�Ϸ�������(FQDN). $��Ǹ��ӵ���������Դ�����ȷ��SAMAccountName.
; *****************************************************************************
$sFQDN = _AD_SamAccountNameToFQDN(@ComputerName & "$")
msgbox(64, "Active Directory Functions", "The Fully Qualified Domain Name (FQDN) for this computer is:" & @CRLF & $sFQDN)

; �ر�Active Directory����
_AD_Close()

