#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 1
	��������:  _accessDeleteRecord()
	����:      �������ݿ��ַ������������������ַ���(����)����ɾ��
	�﷨:      _adoDeleteRecord($adSource,$adTable, $adCol,$Find,[$adOcc])
	����:      $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	           $adTable - �����ı�����
	           $adCol - �������ֶ���������ʹ��ָ����
	           $Find - ���ҵ����ַ���
	           $adOcc - ������õ���ֵ = 1 ɾ����һ��ƥ��ļ�¼ (Default)
	           ������õ���ֵ <> 1 ɾ������ƥ��ļ�¼
	           ����ֵ:    �ɹ�: �ӱ���ɾ����¼��������0
						ʧ��: ����@Error
	                              1 = �޷���������
	                              2 = �޷�����recordset����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$Find = "A"
$adOcc = "1"

_accessDeleteRecord($adSource, $adTable, $adCol, $Find, $adOcc)
MsgBox(64, "��ʾ", "����ɾ���ɹ�.", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
	����:       �������ݿ��ַ������������������ַ���(����)����ɾ��
	�﷨:   	DELETE FROM ���� WHERE ������ = ֵ(ɾ������ƥ��ļ�¼)
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$Find = "A"

$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$sQuery = "DELETE FROM " & $adTable & " WHERE " & $adCol & " = " & " '" & $Find & "'"
$addfld.execute($sQuery)
$addfld.close
MsgBox(64, "��ʾ", "����ɾ���ɹ�.", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 3
	��������:  _accessDeleteRecord()
	����:      �������ݿ��ַ������������������ַ���(����)����ɾ��
	�﷨:      _adoDeleteRecord($adSource,$adTable, $adCol,$Find,[$adOcc])
	����:      $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	           $adTable - �����ı�����
	           $adCol - �������ֶ���������ʹ��ָ����
	           $Find - ���ҵ����ַ���
	           $adOcc - ������õ���ֵ = 1 ɾ����һ��ƥ��ļ�¼ (Default)
	           ������õ���ֵ <> 1 ɾ������ƥ��ļ�¼
	           ����ֵ:    �ɹ�: �ӱ���ɾ����¼��������0
						ʧ��: ����@Error
	                              1 = �޷���������
	                              2 = �޷�����recordset����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "name"
$Find = "A"

_accessDeleteRecord($adSource, $adTable, $adCol, $Find)
MsgBox(0, "��ʾ", "����ɾ���ɹ�.")

Func _accessDeleteRecord($adSource,$adTable, $adCol,$Find,$adOcc = 1)
   $oADO = 'ADODB.Connection'
   If IsObj($oADO) Then
      $oADO = ObjGet('',$oADO)
   Else
      $oADO = _dbOpen($adSource)
   EndIf
   If IsObj($oADO) = 0 Then Return SetError(1)
   $oRec = _dbOpenRecordset()
   If IsObj($oRec) = 0 Then Return SetError(2)
   $Search = $adCol & " = '" & $Find & Chr(39)
   With $oRec
      .CursorLocation = 3
      If $adOcc = 1 Then
         .Open ("SELECT * FROM " & $adTable , $oADO, 3, 3)
         .find($Search)
         .Delete()
         .close
      Else
         .Open("DELETE * FROM " & $adTable & " WHERE " & $adCol & " = '" & $Find & Chr(39), $oADO, 3, 3)
      EndIf
   EndWith
   $oADO.Close()
EndFunc    ;<===> _accessDeleteRecord()

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
