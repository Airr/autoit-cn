#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ��ǰ�û��Ļ�����
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

msgbox(64, "Active Directory Functions", "Primary group for user'" & @UserName & "'is'" & _AD_GetUserPrimaryGroup() & "'")

; �ر�Active Directory����
_AD_Close()

