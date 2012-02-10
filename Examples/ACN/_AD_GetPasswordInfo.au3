
ʾ��
#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ��������Լ���ǰ�û���������Ϣ
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡ������Ϣ
Global $aAD_PwdInfo[12][2] = [[11],["Maximum Password Age (days)"],["Minimum Password Age (days)"],["Enforce Password History (# of passwords remembered)"], _
		["Minimum Password Length"],["Account Lockout Duration (minutes)"],["Account Lockout Threshold (invalid logon attempts)"],["Reset account lockout counter after (minutes)"], _
		["Password last changed (YYYY/MM/DD HH:MM:SS local time)"],["Password expires (YYYY/MM/DD HH:MM:SS local time)"],["Password last changed (YYYY/MM/DD HH:MM:SS UTC)"],["Password expires (YYYY/MM/DD HH:MM:SS UTC)"]]

Global $aTemp = _AD_GetPasswordInfo()
For $iCount = 1 To $aTemp[0]
	$aAD_PwdInfo[$iCount][1] = $aTemp[$iCount]
Next
$aAD_PwdInfo[0][0] = $aTemp[0]

_arraydisplay($aAD_PwdInfo, "Active Directory Functions", -1, 0, "<")

; �ر�Active Directory����
_AD_Close()

