#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
	����:       ������ݿ��ļ�ָ��������м�¼
	�﷨:       _accessClearTable($adSource, $adTable)
	����:       $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	����ֵ:     0 = �ɹ���1 = �޷��������ӣ�2 = �޷�����recordset����
	ע:         ��ֻ�������¼���޷�ɾ�����޷����������
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

_accessClearTable($adSource, $adTable)
MsgBox(64, "��ʾ", "��� " & $adTable & " ���¼�ɹ�.", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
	����:       ������ݿ��ļ�ָ��������м�¼
	�﷨:   	DELETE * FROM ����(ɾ�����м�¼)
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$sQuery = "DELETE * FROM " & $adTable
$addfld.execute($sQuery)
$addfld.close
MsgBox(64, "��ʾ", "��� " & $adTable & " ���¼�ɹ�.", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	����:       ������ݿ��ļ�ָ��������м�¼
	�﷨:       _accessClearTable($adSource, $adTable)
	����:       $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	����ֵ:     0 = �ɹ���1 = �޷��������ӣ�2 = �޷�����recordset����
	ע:         ��ֻ�������¼���޷�ɾ�����޷����������
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

_accessClearTable($adSource, $adTable)
MsgBox(64, "��ʾ", "��� " & $adTable & " ���¼�ɹ�.", 5)

Func _accessClearTable($adSource, $adTable)
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	$oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	If _accessCountRecords($adSource, $adTable) > 0 Then
		$oRec.CursorLocation = 3
		$oRec.Open("Delete * FROM " & $adTable, $oADO, 3, 3)
	EndIf
	$oADO.Close()
EndFunc   ;==>_accessClearTable

Func _dbOpen($adSource);�����ݿ�
	$oProvider = "Microsoft.Jet.OLEDB.4.0; "
	$objCheck = ObjCreate("Access.application")
	If IsObj($objCheck) Then
		$oVersion = $objCheck.Version
		If StringLeft($oVersion, 2) == "12" Then $oProvider = "Microsoft.ACE.OLEDB.12.0; "
	EndIf
	$oADO = ObjCreate("ADODB.Connection")
	$oADO.Provider = $oProvider
	$oADO.Open($adSource)
	Return $oADO
EndFunc   ;==>_dbOpen

Func _dbOpenRecordset()
	$oRec = ObjCreate("ADODB.Recordset")
	Return $oRec
EndFunc   ;==>_dbOpenRecordset

Func _accessCountRecords($adSource, $adTable)
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	$oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.open("SELECT * FROM " & $adTable, $oADO, 3, 3)
	If $oRec.recordcount <> 0 Then $oRec.MoveFirst
	$Rc = $oRec.recordcount
	$oRec.Close
	$oADO.Close
	Return $Rc
EndFunc   ;==>_accessCountRecords

