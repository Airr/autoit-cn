
#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��AD����
_AD_Open()

; *****************************************************************************
; ʾ�� 1: ��鵱ǰ�û��Ƿ����
; *****************************************************************************
If _AD_IsAccountExpired() Then
	msgbox(64, "Active Directory Functions", "User account'" & @UserName & "'has expired")
Else
	msgbox(64, "Active Directory Functions", "User account'" & @UserName & "'has not expired")
EndIf

; *****************************************************************************
; ʾ�� 2: ��鵱ǰ������û��Ƿ����
; *****************************************************************************
If _AD_IsAccountExpired(@ComputerName & "$") Then
	msgbox(64, "Active Directory Functions", "Computer account'" & @ComputerName & "$" & "'has expired")
Else
	msgbox(64, "Active Directory Functions", "Computer account'" & @ComputerName & "$" & "'has not expired")
EndIf

; �ر�AD����
_AD_Close()

