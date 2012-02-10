
#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ����AD
_AD_Open()

; *****************************************************************************
; ʾ�� 1 - ִ��Windowsģʽ.
; ��������Ƿ�ΪWindowsģʽ��һ����, ��Ϊÿ���û�����.
; *****************************************************************************
Global $sProperty = "displayname"
If _AD_ObjectExistsInSchema($sProperty) Then
	msgbox(64, "Active Directory Functions", "Property'" & $sProperty & "'does exist in the Windows AD Schema")
Else
	msgbox(64, "Active Directory Functions", "Property'" & $sProperty & "'does not exist in the Windows AD Schema")
EndIf

; *****************************************************************************
; ʾ�� 2 - ִ��Exchangeģʽ.
; ��������Ƿ�ΪExchangeģʽ��һ����, ��Ϊÿ���û�����.
; *****************************************************************************
$sProperty = "mailNickname"
If _AD_ObjectExistsInSchema($sProperty) Then
	msgbox(64, "Active Directory Functions", "Property'" & $sProperty & "'does exist in the Exchange AD Schema")
Else
	msgbox(64, "Active Directory Functions", "Property'" & $sProperty & "'does not exist in the Exchange AD Schema")
EndIf

; *****************************************************************************
; ʾ�� 3 - ��ѯ�����ڵ�����
; *****************************************************************************
$sProperty = "non-existing-property"
If _AD_ObjectExistsInSchema($sProperty) Then
	msgbox(64, "Active Directory Functions", "Property'" & $sProperty & "'does exist in the AD Schema")
Else
	msgbox(64, "Active Directory Functions", "Property'" & $sProperty & "'does not exist in the AD Schema")
EndIf

; �ر�AD����
_AD_Close()

