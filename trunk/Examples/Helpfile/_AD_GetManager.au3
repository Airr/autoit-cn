#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

Global $aManager[1][2]
Global $bNotFound = False
; *****************************************************************************
; ʾ��1 - ��ȡ����"manager"�������õ��û��б�
; *****************************************************************************
$aManager = _AD_GetManager()
If @error > 0 Then
	msgbox(64, "Active Directory Functions", "No managed users could be found")
	$bNotFound = True
Else
	_ArrayDisplay($aManager, "Active Directory Functions - managed users")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡ����ʾ��1���ҵ������׸������߹�����û��б�
; *****************************************************************************
If $bNotFound Then
	msgbox(64, "Active Directory Functions", "Can't run example 2 because example 1 returned no data")
	Exit
EndIf
Global $Result = _AD_GetObjectAttribute( _AD_FQDNToSamAccountName($aManager[1][1]), "directReports")
_ArrayDisplay($Result, "Active Directory Functions - users managed by'" & $aManager[1][1] & "'")

; �ر�Active Directory����
_AD_Close()

