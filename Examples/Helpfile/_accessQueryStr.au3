#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
    ��������:    _accessQueryStr()
    ����:        �������ݿ��е�ָ���ַ������������������
    �﷨:        _accessQueryStr($adSource,$adTable, $adCol,$Find)
    ����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
                 $adTable - �����ı�����
                 $adCol - �������ֶ����� (����ʹ��ָ��)
                 $Find - �������ַ���
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$Find = "A"

MsgBox(0, 0, _accessQueryStr($adSource, $adTable, $adCol, $Find));�ɹ��򷵻��ֶε�ֵ��ʧ���򷵻ؿ��ַ���
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
    ����:        �������ݿ��е�ָ���ַ������������������
    �﷨:        SELECT * FROM " ���� Where �ֶ��� = '�ַ���'
    ����:        $RS.Fields($adCol).Value = �����������
                 Bof �� Eof �ֱ�ָʾָ��ָ��ͷ��ǰ��β�Ժ󡣽��ΪTrue��False.
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$Find = "A"

$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")
$RS.ActiveConnection = $addfld
$RS.Open("SELECT * FROM " & $adTable & " Where " & $adCol & " = " & "'" & $Find & "'")
If Not $RS.eof And Not $RS.bof Then
	MsgBox(0, "�������", $RS.Fields($adCol).Value)
Else
	MsgBox(0, "�������", "ʧ��")
EndIf
$RS.close
$addfld.Close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
    ��������:    _accessQueryStr()
    ����:        �������ݿ��е�ָ���ַ������������������
    �﷨:        _accessQueryStr($adSource,$adTable, $adCol,$Find)
    ����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
                 $adTable - �����ı�����
                 $adCol - �������ֶ����� (����ʹ��ָ��)
                 $Find - �������ַ���
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$Find = "A"

MsgBox(0, 0, _accessQueryStr($adSource, $adTable, $adCol, $Find));�ɹ��򷵻��ֶε�ֵ��ʧ���򷵻ؿ��ַ���

Func _accessQueryStr($adSource,$adTable, $adCol,$Find)
   $Find = Chr(34) & String($Find) & Chr(34)
   $oADO = 'ADODB.Connection'
   If IsObj($oADO) Then
      $oADO = ObjGet('',$oADO)
   Else
      $oADO = _dbOpen($adSource)
   EndIf
   If IsObj($oADO) = 0 Then Return SetError(1)
   $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
   If IsObj($oRec) = 0 Then Return SetError(2)
   $oRec.Open ("SELECT * FROM " & $adTable & " Where " & $adCol & " = " & $Find , $oADO, 3, 3)
   If $oRec.RecordCount > 0 Then
      $oRec.MoveFirst()
      Return $oRec.Fields($adCol).Value
   EndIf
   Return ''
EndFunc   ;<==> _accessQueryStr($adSource,$adTable, $adCol,$Find)

Func _dbOpen($adSource)
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
