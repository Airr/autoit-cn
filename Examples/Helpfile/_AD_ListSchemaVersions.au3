
#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ʾ�� 1: ����AD�ܹ��汾����Ϣ
; *****************************************************************************
#include  <AD.au3>

; ����AD
_AD_Open()

; ��ȡ�ܹ�����չ�汾�б�
Global $aSchemaVersion[5][2] = [[""],["Active Directory Schema version"],["Exchange Schema version"],["Exchange 2000 Active Directory Connector version"],["Office Communications Server Schema version"]]
Global $aTemp = _AD_ListSchemaVersions()
Global $iCount
For $iCount = 1 To $aTemp[0]
	$aSchemaVersion[$iCount][1] = $aTemp[$iCount]
Next
$aSchemaVersion[0][0] = $aTemp[0]
_arraydisplay($aSchemaVersion, "Active Directory Functions - Example 1", -1, 0, "<")

; �ر�AD����
_AD_Close()

