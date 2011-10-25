
#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; �򿪵�Active Directory������; Ϊ��ǰ�û���ȡ�Ϸ�����(FQDN); �ر�����.
; *****************************************************************************
#include  <AD.au3>

; ����Active Directory������
_AD_Open()

; Ϊ��ǰ�û���ȡ�Ϸ�����(FQDN)
Global $sFQDN = _AD_SAMAccountNameToFQDN()
msgbox(64, "Active Directory Functions", "The Fully Qualified Domain Name (FQDN) for the currently logged on user is:" & @CRLF & $sFQDN)

; �ر���Active Directory������
_AD_Close()

