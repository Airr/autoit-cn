#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 1
	��������:    _accessGetVal()
	����:        �����ݿ��ļ�������ָ���ı���ָ���ֶεĵ�һ��ֵ,�������������
	�﷨:        _accessGetVal($adSource,$adTable, $adCol)
	����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	$adCol - ����ֵ=0(������һ���ֶ�����)=1(�����ڶ����ֶ�����)...
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = 1

MsgBox(0, "�������", _accessGetVal($adSource, $adTable, $adCol))
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 2
	����:        �����ݿ��ļ�������ָ���ı���ָ���ֶεĵ�һ��ֵ,�������������
	�﷨:        SELECT * FROM ������
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = 1

$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")
$RS.ActiveConnection = $addfld
$RS.Open("SELECT * FROM " & $adTable)
MsgBox(0, "�������", $RS.Fields($adCol).value)
$RS.close
$addfld.Close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 3
	��������:    _accessGetVal()
	����:        �����ݿ��ļ�������ָ���ı���ָ���ֶεĵ�һ��ֵ,�������������
	�﷨:        _accessGetVal($adSource,$adTable, $adCol)
	����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	             $adTable - �����ı�����
	             $adCol - ����ֵ=0(������һ���ֶ�����)=1(�����ڶ����ֶ�����)...
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = 1

MsgBox(0, "�������", _accessGetVal($adSource, $adTable, $adCol))

Func _accessGetVal($adSource,$adTable, $adCol)
   Local $Val
   $oADO = 'ADODB.Connection'
   If IsObj($oADO) Then
      $oADO = ObjGet('',$oADO)
   Else
      $oADO = _dbOpen($adSource)
   EndIf
   If IsObj($oADO) = 0 Then Return SetError(1)
   $oRec = _dbOpenRecordset()
   If IsObj($oRec) = 0 Then Return SetError(2)
   $oRec.Open ("SELECT * FROM " & $adTable, $oADO, 3, 3)
   $Val = $oRec.Fields($adCol).Value
   $oRec.Close
   $oADO.Close()
   Return $Val
EndFunc

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
