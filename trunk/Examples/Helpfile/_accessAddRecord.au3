#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
	��������:   _accessAddRecord()
	����:       �����е����ݿ���ļ�������¼�¼�����������ֶΣ�
	�﷨:       _accessAddRecord($adSource, $adTable, $rData,$adCol = 0)
	����:       $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	$rData - �����ݱ���ӵ��ֶΣ�������һ��������ܽ�������ӵ�����ֶΣ����ݱ���������Ӧ�Ĺ�����������)
	$adCol - ����ֵ����0������$rData�������飬���������������Ĭ��Ϊ��һ��
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#Include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$rData = "1 | ABC | DEF"
$adCol = 0

_accessAddRecord($adSource, $adTable, $rData, $adCol)
MsgBox(64, "��ʾ", "����¼�¼�ɹ�", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
	����:       �����е����ݿ���ļ�������¼�¼�����������ֶΣ�
	�﷨:       INSERT INTO ������ VALUES (ֵ1,ֵ2,....')
	            INSERT INTO ������ (��1,��2,....') VALUES (ֵ1,ֵ2,....')
    ˵��:      	������ʹ�õ�����ָ���в������ݡ�������һ��Ҫ��ֵ��Ӧ����Ҫע
	            ��ĳЩ���͵�ֵ��д���ʱ���ܴ��С� ' or  " ��,�����ڲ�������
				��ʱ��Ҫע��('" & $rData1 & "','" & $rData2 & "')")����Ҫ��
				�µ�ֵ�Ƿ����ˡ� ' or "  ���š� 
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table2"
$rData1 = "ABC"
$rData2 = "DEF"

$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$addfld.Execute("insert into " & $adTable & " (name,pass) values('" & $rData1 & "','" & $rData2 & "')")
$addfld.close
MsgBox(64, "��ʾ", "����¼�¼�ɹ�", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	��������:   _accessAddRecord()
	����:       �����е����ݿ���ļ�������¼�¼�����������ֶΣ�
	�﷨:       _accessAddRecord($adSource, $adTable, $rData,$adCol = 0)
	����:       $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	$rData - �����ݱ���ӵ��ֶΣ�������һ��������ܽ�������ӵ�����ֶΣ����ݱ���������Ӧ�Ĺ�����������)
	$adCol - ����ֵ����0������$rData�������飬���������������Ĭ��Ϊ��һ��
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table3"
$rData = "1 | ABC | DEF"

_accessAddRecord($adSource, $adTable, $rData)
MsgBox(64, "��ʾ", "����¼�¼�ɹ�", 5)

Func _accessAddRecord($adSource, $adTable, $rData, $adCol = 0)
	If Not IsArray($rData) Then
		$rData = StringSplit($rData, '|')
	EndIf
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	If Not IsObj($oADO) Then Return SetError(2, 0, 0)
	$oRec = _dbOpenRecordset()
	If IsObj($oRec) = 0 Then Return SetError(2)
	With $oRec
		.Open("SELECT * FROM " & $adTable, $oADO, 3, 3)
		.AddNew
		If IsArray($rData) Then
			For $I = 1 To UBound($rData) - 1;$rData[0]
				$rData[$I] = StringStripWS($rData[$I], 1)
				.Fields.Item($I - 1) = $rData[$I]
			Next
		Else
			.Fields.Item($adCol) = $rData
		EndIf
		.Update
		.Close
	EndWith
	$oADO.Close()
EndFunc   ;==>_accessAddRecord

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
