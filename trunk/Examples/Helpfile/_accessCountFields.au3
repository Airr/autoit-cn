#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
	��������:    _accessCountFields()
	����:        ��ȡ���ݿ��ļ��У�ָ�����е��ֶ���
	�﷨:        _accessCountFields($adSource, $adTable)
	����:        $adSource  �����ݿ��ļ�������·���Լ����ݿ��ļ���
	             $adTable   �����ı�����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$yo = _accessCountFields($adSource, $adTable)
MsgBox(0, "��ʾ", $adTable & "�����С�" & $yo & "�����ֶ�.")
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
	����:        ��ȡ���ݿ��ļ��У�ָ�����е��ֶ���
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")
$RS.open($adTable, $addfld, 3, 3)
MsgBox(0, "��ʾ", $adTable & "�����С�" & $RS.Fields.count & "�����ֶ�.")
$RS.close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	��������:    _accessCountFields()
	����:        ��ȡ���ݿ��ļ��У�ָ�����е��ֶ���
	�﷨:        _accessCountFields($adSource, $adTable)
	����:        $adSource  �����ݿ��ļ�������·���Լ����ݿ��ļ���
	             $adTable   �����ı�����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$yo = _accessCountFields($adSource, $adTable)
MsgBox(0, "��ʾ", $adTable & "�����С�" & $yo & "�����ֶ�.")

Func _accessCountFields($adSource,$adTable)
   $oADO = 'ADODB.Connection'
   If IsObj($oADO) Then
      $oADO = ObjGet('',$oADO)
   Else
      $oADO = _dbOpen($adSource)
   EndIf
   If IsObj($oADO) = 0 Then Return SetError(1)
   $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
   If IsObj($oRec) = 0 Then Return SetError(2)
   $oRec.open ($adTable , $oADO, 3, 3)
   $Fc = $oRec.fields.count
   $oRec.Close
   $oADO.Close
   Return $Fc
EndFunc    ;<===> _accessCountFields()

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
