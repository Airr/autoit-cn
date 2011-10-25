#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; *****************************************************************************
; ʾ�� 1 - ������ǰ�û�. ��SamAccountname��ȡFQDN. Ȼ���FQDN��ȡ��ʾ����.
; *****************************************************************************
; ��ȡ��ǰ�û���ȫ�Ϸ�������(FQDN)
Global $sFQDN = _AD_SamAccountNameToFQDN()

; ��ȡ��ǰ�û�����ʾ����
Global $sDisplayName = _AD_FQDNToDisplayname($sFQDN)
If Not @error Then
	msgbox(64, "Active Directory Functions", _
			"The Fully Qualified Domain Name (FQDN) for the currently logged on user is:" & @CRLF & $sFQDN & @CRLF & @CRLF & _
			"The Display Name for the currently logged on user is:" & @CRLF & $sDisplayName)
Else
	msgbox(48, "Active Directory Functions", _
			"The Fully Qualified Domain Name (FQDN) for the current user could not be found:" & @CRLF & $sFQDN & @CRLF & @CRLF & _
			"Error / Extended Error:" & @error & " /" & @extended)
EndIf

; *****************************************************************************
