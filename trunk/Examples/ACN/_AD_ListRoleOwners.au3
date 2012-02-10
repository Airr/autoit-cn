#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡȫ��FSMO���������ߵ�����
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡȫ��FSMO���������߼��������б�
Global $aFSMO[6][2] = [[""],["Domains PDC Emulator"],["Domains RID (Relative-Identifierer) master"],["Domains Infrastructure master"],["Forest-wide Schema master"],["Forest-wide Domain naming master"]]
Global $aTemp = _AD_ListRoleOwners()
Global $iCount
For $iCount = 1 To $aTemp[0]
	$aFSMO[$iCount][1] = $aTemp[$iCount]
Next
$aFSMO[0][0] = $aTemp[0]
_arraydisplay($aFSMO, "Active Directory Functions", -1, 0, "<")

; �ر�Active Directory����
_AD_Close()

