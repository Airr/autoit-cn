#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
	��������:    _accessUpdateRecord()
	����:        �������ݿ��ļ��еı������±��е����ݼ�¼
	�﷨:        _accessUpdateRecord($adSource,$adTable,$adCol,$adQuery,$adcCol,$adData)
	����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	$adCol - �������ֶ���
	$adQuery - �������ַ���
	$adcCol - ��Ҫ���µ��ֶ���
	$adData - ���º��ַ������µ��ַ������ᴢ����$adcCol
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$adQuery = "A"
$adcCol = "pass"
$adData = "A01"

_accessUpdateRecord($adSource, $adTable, $adCol, $adQuery, $adcCol, $adData)
MsgBox(0, "��ʾ", "�������ݳɹ���")
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:       ʾ�� 2
	����:       �������ݿ��ļ��еı������±��е����ݼ�¼
	�﷨:       Update ���� set ���� = ��ֵ where ���� = ĳֵ
				Update ���� set ���� = ��ֵ,���� = ��ֵ... where ���� = ĳֵ
	����:       $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
				$adTable - �����ı�����
	            $adCol - �������ֶ���
	            $adQuery - �������ַ���
				$adcCol - ��Ҫ���µ��ֶ���
				$adData - ���º��ַ������µ��ַ������ᴢ����$adcCol
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$adQuery = "A"
$adcCol = "pass"
$adData = "A02"

$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$addfld.execute("update " & $adTable & " set " & $adcCol & " = '" & $adData & "' where " & $adCol & " = '" & $adQuery & "'" )
$addfld.close
MsgBox(0, "��ʾ", "�������ݳɹ���")
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	��������:    _accessUpdateRecord()
	����:        �������ݿ��ļ��еı������±��е����ݼ�¼
	�﷨:        _accessUpdateRecord($adSource,$adTable,$adCol,$adQuery,$adcCol,$adData)
	����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	$adCol - �������ֶ���
	$adQuery - �������ַ���
	$adcCol - ��Ҫ���µ��ֶ���
	$adData - ���º��ַ������µ��ַ������ᴢ����$adcCol
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$adQuery = "A"
$adcCol = "pass"
$adData = "A03"

_accessUpdateRecord($adSource, $adTable, $adCol, $adQuery, $adcCol, $adData)
MsgBox(0, "��ʾ", "�������ݳɹ���")

Func _accessUpdateRecord($adSource, $adTable, $adCol, $adQuery, $adcCol, $adData)
	$adQuery = Chr(39) & $adQuery & Chr(39)
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	$oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.CursorLocation = 3
	$oRec.Open("SELECT * FROM " & $adTable, $oADO, 3, 3)
	If @error = 0 Then
		$strSearch = $adCol & ' = ' & $adQuery
		$oRec.Find($strSearch)
		$oRec($adcCol) = $adData
		$oRec.Update
		$oRec.Close()
	Else
		$oADO.Close()
		Return SetError(3, 0, 0)
	EndIf
	$oADO.Close()
EndFunc   ;==>_accessUpdateRecord

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
