#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ��ǰ�û�������¼����. ������YYYYMMDDHHMMSS
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡ��ǰ�û�������¼����
Global $iLLDate = _AD_GetLastLoginDate()
msgbox(64, "Active Directory Functions", "Last Login Date for User'" & @UserName & "'" & @CRLF & $iLLDate)

; �ر�Active Directory����
_AD_Close()

