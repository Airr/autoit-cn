#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; *****************************************************************************
; ʾ��1 - ��ȡAD����ȫ����ӡ���е��б�
; *****************************************************************************
Global $aPrintQueues = _AD_ListPrintQueues()
If @error > 0 Then
	msgbox(16, "Active Directory Functions", "Could not find any print queues!")
	Exit
Else
	_ArrayDisplay($aPrintQueues, "AD - All print queues")
EndIf

; *****************************************************************************
; ʾ��2 - ��ȡָ���ӳٷ�������ȫ����ӡ���е��б�
; *****************************************************************************
Global $sSpoolServer = StringSplit($aPrintQueues[1][1], ".")
$aPrintQueues = _AD_ListPrintQueues($sSpoolServer[1])
If @error > 0 Then
	msgbox(16, "Active Directory Functions", "Could not find any print queues for server'" & $sSpoolServer[1] & "'")
	Exit
Else
	_ArrayDisplay($aPrintQueues, "Active Directory Functions - All print queues for spool server'" & $sSpoolServer[1] & "'")
EndIf

; *****************************************************************************
; ʾ��3 - �о��׸���ӡ���е���������
; *****************************************************************************
Global $aPrinterDetails = _AD_GetObjectProperties($aPrintQueues[1][2])
_ArrayDisplay($aPrinterDetails, "Active Directory Functions - All properties for  print queue'" & $aPrintQueues[1][2] & "'")

; �ر�Active Directory����
_AD_Close()

