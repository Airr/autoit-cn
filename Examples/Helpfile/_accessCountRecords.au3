#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
	��������:    _accessCountRecords()
	����:        �����ݿ��ļ�����ȡָ�����еļ�¼����
	�﷨:        _accessCountRecords($adSource, $adTable)
	����:        $adSource  �����ݿ��ļ�������·���Լ����ݿ��ļ���
	             $adTable   �����ı�����
	����ֵ:  	 �ɹ�: ���ر��еļ�¼�� 
                 ʧ��: ���س�����Ϣ
					   1 = �޷��������� 
                       2 = �޷�����recordset���� 
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <Access.au3>
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

MsgBox(0, '��ѯ��¼��', '���й��С�' & _accessCountRecords($adSource, $adTable) & '�������ݼ�¼.')
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
	����:        �����ݿ��ļ�����ȡָ�����еļ�¼����
	�﷨:        SELECT COUNT(*) FROM " & ������
	����:        $adSource  �����ݿ��ļ�������·���Լ����ݿ��ļ���
	             $adTable   �����ı�����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")

$RS.ActiveConnection = $addfld
$RS.Open("SELECT COUNT(*) FROM " & $adTable)
MsgBox(0, '��ѯ��¼��', '���й��С�' & $RS.Fields(0).value & '�������ݼ�¼.')
$RS.close
$addfld.Close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	����:        �����ݿ��ļ�����ȡָ������ָ���ֶ�(��)�ļ�¼����
	�﷨:        SELECT COUNT(id) FROM " & ������
	����:        $adSource  �����ݿ��ļ�������·���Լ����ݿ��ļ���
	             $adTable   �����ı�����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")

$RS.ActiveConnection = $addfld
$RS.Open("SELECT COUNT(id) FROM " & $adTable)
MsgBox(0, '��ѯ��¼��', '���� id �й��С�' & $RS.Fields(0).value & '�������ݼ�¼.')
$RS.close
$addfld.Close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 4
	��������:    _accessCountRecords()
	����:        �����ݿ��ļ�����ȡָ�����еļ�¼����
	�﷨:        _accessCountRecords($adSource, $adTable)
	����:        $adSource  �����ݿ��ļ�������·���Լ����ݿ��ļ���
	             $adTable   �����ı�����
	����ֵ:  	 �ɹ�: ���ر��еļ�¼�� 
                 ʧ��: ���س�����Ϣ
					   1 = �޷��������� 
                       2 = �޷�����recordset���� 
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

MsgBox(0, '��ѯ��¼��', '���й��С�' & _accessCountRecords($adSource, $adTable) & '�������ݼ�¼.')

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
