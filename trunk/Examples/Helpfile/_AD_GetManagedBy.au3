#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

Global $aManagedBy[1][2]
Global $bNotFound = False
; *****************************************************************************
; ʾ��1 - ��ȡ����"managedBy"�������õ����б�
; *****************************************************************************
$aManagedBy = _AD_GetManagedBy()
If @error > 0 Or $aManagedBy[0][0] = 0 Then
	msgbox(64, "Active Directory Functions - Example 1", "No managed groups could be found")
	$bNotFound = True
Else
	_ArrayDisplay($aManagedBy, "Active Directory Functions - groups managed by")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡ����ʾ��1���ҵ������׸������߹�������б�
; *****************************************************************************
If $bNotFound Then
	msgbox(64, "Active Directory Functions - Example 2", "Can't run example 2 because example 1 returned no data")
	Exit
EndIf
Global $Result = _AD_GetObjectAttribute( _AD_FQDNToSamAccountName($aManagedBy[1][1]), "managedObjects")
_ArrayDisplay($Result, "Active Directory Functions - groups managed by'" & $aManagedBy[1][1] & "'")

; �ر�Active Directory����
_AD_Close()

