;*******************************************************************************
;	http://dundats.mvps.org/AutoIt/udf_code.aspx?udf=access
;
;   �����б�
;         _accessAddRecord();�����е� MS Access ���ݿ��������¼�¼(���������ֶ�)
;         _accessClearTable();��� MS Access ���ݿ�ָ���ı������м�¼
;         _accessCompactDB();ѹ�� MS Access ���ݿ��ļ�(*. mdb)
;         _accessCountFields();���� MS Access ���ݿ���е��ֶ���
;         _accessCountRecords();���� MS Access ���ݿ���еļ�¼��
;         _accessCreateDB();����һ�� MS Access ���ݿ�(*. mdb)�ļ�
;         _accessCreateTable();�����е� MS Access ���ݿ��н�����
;         _accessDeleteRecord()�������ݿ��ַ������������������ַ���(����)����ɾ��
;         _accessDeleteTable();�� MS Access ���ݿ�(*. mdb)�ļ���ɾ����
;         _accessGetVal();�������ݿ�ĵ�һ����¼ָ���ַ������������������
;         _accessListFields();���� MS Access ���ݿ�����ָ���ı��е������ֶ�����
;         _accessListTables();���� MS Access ���ݿ������еı�����
;         _accessQueryLike();�������ݿ���ָ���ı��ڵ��ֶ�������ָ�����ַ���(����Ϊ�ռ�����ȫ���ַ���)
;         _accessQueryStr();�������ݿ��е�ָ���ַ������������������
;         _accessSaveXML();�� MS Access ���ݿ���ָ���ı�����ΪXML�ļ�
;         _accessTableCount();ͳ�� MS Access ���ݿ����ж��ٸ���
;         _accessUpdateRecord();���� MS Access ���ݿ��еı������±��е����ݼ�¼
;
;*******************************************************************************

#include-once
#include <AccessConstants.au3>

; ------------------------------------------------------------------------------
; To Do List:
;     _accessAppendField()
;     _accessDeleteMulti()
;     _accessNumSearch()
; ------------------------------------------------------------------------------

;===============================================================================
; ��������:   _accessAddRecord()
; ����:       �����е� MS Access ���ݿ������¼�¼(���������ֶ�)
; �﷨:       _accessAddRecord($adSource, $adTable)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $rData - �����ݱ���ӵ��ֶ�(������һ��������ܽ�������ӵ�����ֶΣ����ݱ���������Ӧ�Ĺ�����������)
;             $adCol - ����ֵ����0������$rData�������飬�������������(Ĭ��Ϊ��һ��)
; ����:
; ����ֵ:     �ɹ� - @Error = 0 ��¼�Ѿ���ӵ�����
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
; ����:       yes
;===============================================================================

Func _accessAddRecord($adSource, $adTable, $rData, $adCol = 0)
	If Not IsArray($rData) Then
		$rData = StringSplit($rData, '|')
	EndIf
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	If Not IsObj($oADO) Then Return SetError(2, 0, 0)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	With $oRec
		.Open("SELECT * FROM " & $adTable, $oADO, $adOpenStatic, $adLockOptimistic)
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
	$oADO.Close
EndFunc   ;==>_accessAddRecord

;===============================================================================
; ��������:   _accessClearTable()
; ����:       ��� MS Access ���ݿ�ָ���ı������м�¼
; �﷨:       _accessClearTable($adSource, $adTable)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
; ����:
; ����ֵ:     �ɹ� - @Error = 0
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:         ��ֻ�������¼���޷�ɾ�����޷����������
; �޸�:
;===============================================================================

Func _accessClearTable($adSource, $adTable)
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	If _accessCountRecords($adSource, $adTable) > 0 Then
		$oRec.CursorLocation = $adUseClient
		$oRec.Open("Delete * FROM " & $adTable, $oADO, $adOpenStatic, $adLockOptimistic)
	EndIf
	$oADO.Close
EndFunc   ;==>_accessClearTable

;===============================================================================
; ��������:   _accessCompactDB()
; ����:       ѹ�� MS Access ���ݿ��ļ�(*. mdb)
; �﷨:       _accessCompactDB($adSource)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
; ����:
; ����ֵ:     �ɹ� - @Error = 0
;             ʧ�� - @Error = 1
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; ����:
;===============================================================================

Func _accessCompactDB($adSource)
	If FileExists($adSource) Then
		Local $adDest = @TempDir & "\Temp.mdb"
		Local $obj = "JRO.JetEngine"
		If FileExists($adDest) Then FileDelete($adDest)
		If Not IsObj($obj) Then
			Local $oMDB = ObjCreate($obj)
		Else
			Local $oMDB = ObjGet($obj)
		EndIf
		If IsObj($oMDB) Then
			$oMDB.CompactDatabase("Provider = " & $adoProvider & "Data Source = " & $adSource, _
					"Provider = " & $adoProvider & "Data Source = " & $adDest)
			SetError(0)
		Else
			Return SetError(1)
		EndIf
		FileMove($adDest, $adSource, 1)
	EndIf
EndFunc   ;==>_accessCompactDB

;===============================================================================
; ��������:   _accessCountFields()
; ����:       ���� MS Access ���ݿ���е��ֶ���
; �﷨:       _accessCountFields($adSource, $adTable)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
; ����:
; ����ֵ:     �ɹ� - ���ر��ڵ��ֶ���
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:         �����÷���:
;             MsgBox(0,'�ֶ���', '������<' & _accessCountFields($adSource, $adTable) & '>���ֶ���')
; �޸�:
; ����:
;===============================================================================

Func _accessCountFields($adSource, $adTable)
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.open($adTable, $oADO, $adOpenStatic, $adLockOptimistic)
	Local $Fc = $oRec.fields.count
	$oRec.Close
	$oADO.Close
	Return $Fc
EndFunc   ;==>_accessCountFields

;===============================================================================
; ��������:   _accessCountRecords()
; ����:       ���� MS Access ���ݿ���еļ�¼��
; �﷨:       _accessCountRecords($adSource, $adTable)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
; ����:
; ����ֵ:     �ɹ� - ���ر��еļ�¼��
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:         �����÷���:
;             MsgBox(0,'��¼��', '������<' & _accessCountRecords($adSource, $adTable) & '>�����ݼ�¼')
; �޸�:
; ����:
;===============================================================================

Func _accessCountRecords($adSource, $adTable)
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.open("SELECT * FROM " & $adTable, $oADO, $adOpenStatic, $adLockOptimistic)
	If $oRec.recordcount <> 0 Then $oRec.MoveFirst
	Local $Rc = $oRec.recordcount
	$oRec.Close
	$oADO.Close
	Return $Rc
EndFunc   ;==>_accessCountRecords

;===============================================================================
; ��������:   _accessCreateDB ()
; ����:       ����һ�� MS Access ���ݿ�(*. mdb)�ļ�
; �﷨:       _accessCreateDB ($adSource)
; ����:       $adSource - ����MS Access���ݿ������·���Լ��������ݿ���ļ���
; ����:
; ����ֵ:     ��
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessCreateDB($adSource)
	If StringRight($adSource, 4) <> '.mdb' Then $adSource &= '.mdb'
	If FileExists($adSource) Then
		Local $Fe = MsgBox(262196, 'File Exists', 'The file ' & $adSource & ' already exists.' & @CRLF & '' & @CRLF & 'Do you want to replace the existing file?')
		If $Fe = 6 Then
			FileDelete($adSource)
		Else
			Return
		EndIf
	EndIf
	Local $dbObj = ObjCreate('ADOX.Catalog')
	If IsObj($dbObj) Then
		$dbObj.Create('Provider = ' & $adoProvider & 'Data Source = ' & $adSource)
	Else
		MsgBox(262160, 'Error', 'Unable to create the requested object')
	EndIf
EndFunc   ;==>_accessCreateDB

;===============================================================================
; ��������:   _accessCreateTable()
; ����:       �����е� MS Access ���ݿ��н�����
; �﷨:       _accessCreateTable($adSource, $adTable, $adCol)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $adCol - �ֶ����ͱ����÷ָ���'|'�ָ��ͷ���ƺ��ֶ�����
; ����:
; ����ֵ:     �ɹ� - @Error = 0
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        3 = ���Ѿ�����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:         �ֶ������ǲ����ִ�Сд.
;             ��������; TEXT(��ֵ1-255)=�ı�, MEMO=��ע, COUNTER=�Զ����, INTEGER=����,
;                       YESNO=��/��, DATETIME=����ʱ��, CURRENCY=���ң�OLEOBJECT=OLE ����
;             ��ͷ���Ʋ��ܰ����ո񣬵�������һ���ո���Ϊ�ָ��ֶ�����
;             Ҫ���õ��ı��ֶ���ʹ���ı�������ַ���(<��ֵ>) ���� <��ֵ> �����255��.
; �޸�:
; ����:       _accessCreateTable($adSource,$adTable,$aArray)
;===============================================================================

Func _accessCreateTable($adSource, $adTable, $adCol = '')
	Local $F_Out = ''
	If StringInStr(_accessListTables($adSource), $adTable & '|') Then Return SetError(3, 0, 0)
	If $adCol <> '' Then
		If Not IsArray($adCol) Then
			$adCol = StringSplit($adCol, '|')
		EndIf
		For $I = 1 To $adCol[0]
			If $I <> $adCol[0] Then $adCol[$I] = $adCol[$I] & ' ,'
			$F_Out &= $adCol[$I]
		Next
	EndIf
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	If $F_Out <> '' Then
		$oADO.Execute("CREATE TABLE " & $adTable & '(' & $F_Out & ')');;<<=== Create the table and the columns specified by $adCol
	Else
		$oADO.Execute("CREATE TABLE " & $adTable);;  <<==== No columns were specified so just create an empty table
	EndIf
	$oADO.Close
EndFunc   ;==>_accessCreateTable

;===============================================================================
; ��������:   _accessDeleteRecord()
; ����:       �������ݿ��ַ������������������ַ���(����)����ɾ��
; �﷨:       _adoDeleteRecord($adSource,$adTable, $adCol,$Find,[$adOcc])
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $adCol - �������ֶ���(����ʹ��������)
;             $Find - ���ҵ����ַ���
;             $adOcc - ������õ���ֵ = 1 ɾ����һ��ƥ��ļ�¼ (Ĭ��ֵ)
;                      ������õ���ֵ <> 1 ɾ������ƥ��ļ�¼
; ����:
; ����ֵ:     �ɹ� - @Error = 0
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:         Chr(28) ��һ�ֲ��ɼ��ַ������ڱ����ַ��������׳�ͻ���ַ�
; �޸�:
;===============================================================================

Func _accessDeleteRecord($adSource, $adTable, $adCol, $Find, $adOcc = 1)
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	Local $Search = $adCol & " = '" & $Find & Chr(39)
	With $oRec
		.CursorLocation = $adUseClient
		If $adOcc = 1 Then
			.Open("SELECT * FROM " & $adTable, $oADO, $adOpenStatic, $adLockOptimistic)
			.find($Search)
			.Delete()
			.close
		Else
			.Open("DELETE * FROM " & $adTable & " WHERE " & $adCol & " = '" & $Find & Chr(39), $oADO, $adOpenStatic, $adLockOptimistic)
		EndIf
	EndWith
	$oADO.Close
EndFunc   ;==>_accessDeleteRecord

;===============================================================================
; ��������:   _accessDeleteTable()
; ����:       �� MS Access ���ݿ�(*. mdb)�ļ���ɾ����
; �﷨:       _accessDeleteTable($adSource, $adTable)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
; ����:
; ����ֵ:     �ɹ� - @Error = 0
;             ʧ�� - ����@Error
;                       1 = �޷���������
;                       2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessDeleteTable($adSource, $adTable)
	Local $oADO = ObjCreate("ADODB.Connection")
	$oADO.Provider = $adoProvider
	$oADO.Open($adSource)
	$oADO.execute("DROP TABLE " & $adTable)
	$oADO.Close
EndFunc   ;==>_accessDeleteTable

;===============================================================================
; ��������:   _accessGetVal()
; ����:       ����ָ���ֶεĵ�һ��ֵ
; �﷨:       _accessGetVal($adSource,$adTable, $adCol)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $adCol - ����ֵ=0(��һ���ֶ�����)=1(�ڶ����ֶ�����)...
; ����:
; ����ֵ:     �ɹ� - ����ָ���ֶε�ֵ
;             ʧ�� - ����һ�����ַ���������@Error
;                                          1 = �޷���������
;                                          2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessGetVal($adSource, $adTable, $adCol)
	Local $Val
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset()
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.Open("SELECT * FROM " & $adTable, $oADO, $adOpenStatic, $adLockOptimistic)
	$Val = $oRec.Fields($adCol).Value
	$oRec.Close
	$oADO.Close
	Return $Val
EndFunc   ;==>_accessGetVal

;===============================================================================
; ��������:   _accessListFields()
; ����:       ���� MS Access ���ݿ�����ָ���ı��е������ֶ�����
; �﷨:       _accessListFields($adSource, $adTable)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
; ����:
; ����ֵ:     �ɹ� - ����һ�����ֶ�����"|"�ָ���ַ���
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessListFields($adSource, $adTable)
	Local $Rtn = ''
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	;With $oRec
	$oRec.Open($adTable, $oADO, $adOpenStatic, $adLockOptimistic)
	Local $Fc = $oRec.fields.count
	If $Fc > 0 Then
		For $I = 0 To $Fc - 1
			$Rtn &= $oRec.fields($I).name & '|'
		Next
	EndIf
	$oRec.Close
	;EndWith
	$oADO.Close
	If $Rtn Then
		Return StringTrimRight($Rtn, 1)
	EndIf
EndFunc   ;==>_accessListFields

;===============================================================================
; ��������:   _accessListTables()
; ����:       ���� MS Access ���ݿ������еı�����
; �﷨:       _accessListTables($adSource)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
; ����:
; ����ֵ:     �ɹ� - ����һ���ѱ�����"|"�ָ���ַ���
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        3 = û���ҵ�����(����һ�����ַ���)
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessListTables($adSource)
	Local $oList = ''
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = $oADO.OpenSchema($adSchemaTables)
	While Not $oRec.EOF
		If StringLen( $oRec("TABLE_TYPE" ).value) > 5 Then;; Skip the hidden internal tables
			$oRec.movenext
			ContinueLoop
		EndIf
		$oList = $oList & $oRec("TABLE_NAME" ).value & '|'
		$oRec.movenext
	WEnd
	If $oList <> '' Then
		$oADO.close
		Return '|' & StringTrimRight($oList, 1)
	Else
		SetError(3, 0, 0)
		$oADO.close
		Return $oList
	EndIf
EndFunc   ;==>_accessListTables

;===============================================================================
; ��������:   _accessQueryLike()
; ����:       �������ݿ���ָ���ı��ڵ��ֶ�������ָ�����ַ���
; �﷨:       _accessQueryLike($adSource, $adTable, $adCol, $Find, [$adFull])
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $adCol - �������ֶ���(����ʹ������)
;             $Find - �������ַ���(Ϊ�ռ�����ȫ����¼)
;             $adFull - ��� = 1 ʹ��Chr(28)��Ϊ�ָ���. (Ĭ��)
;                       ��� <> 1 ����һ������ָ���ֶε�ÿһ����¼������
; ����:       _accessCountFields()
; ����ֵ:     �ɹ� - ����һ���������������ļ�¼,ÿ���ֶ�����ֵ������,ÿ����¼����Ϣ��Chr(28)Ϊ�ָ��(�ָ��������$adFull��˵��)
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:         Chr(28) ��һ�ֲ��ɼ��ַ� ���ڱ����ַ��������׳�ͻ���ַ�
;                     ��Windows 2000�� "Like" ��ѯ��ʧ��
; �޸�:
;===============================================================================

Func _accessQueryLike($adSource, $adTable, $adCol, $Find, $adFull = 1)
	Local $I, $Rtn
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.Open("SELECT * FROM " & $adTable & " WHERE " & $adCol & " Like '%" & $Find & "%'", $oADO, $adOpenStatic, $adLockOptimistic)
	If $oRec.RecordCount < 1 Then
		Return SetError(1)
	Else
		SetError(0)
		$oRec.MoveFirst()
		;;MsgBox(0,'TEST', "Number of records: " & $oRec.RecordCount);;<<======  For testing only
		Do
			If $adFull = 1 Then
				For $I = 0 To _accessCountFields($adSource, $adTable) - 1
					;;MsgBox(0,'TEST 2 ', "Value of field " & $oRec.Fields($I).Name & ' is:' & @CRLF & @CRLF & $oRec.Fields($I).Value);;<<======  For testing only
					$Rtn = $Rtn & $oRec.Fields($I).Value & Chr(28);;<<====== Separate the fields with a non-printable character
				Next
			EndIf
			$Rtn = $Rtn & Chr(29);;<<====== Separate the records with a non-printable character
			$oRec.MoveNext()
		Until $oRec.EOF
		$oRec.Close
		$oADO.Close
		If $adFull = 1 Then Return StringSplit(StringTrimRight($Rtn, 2), Chr(29))
		Return StringSplit(StringTrimRight($Rtn, 1), Chr(29))
	EndIf
EndFunc   ;==>_accessQueryLike

;===============================================================================
; ��������:   _accessQueryStr()
; ����:       �������ݿ��е�ָ���ַ���,�������������
; �﷨:       _accessQueryStr($adSource,$adTable, $adCol,$Find)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $adCol - �������ֶ����� (����ʹ��ָ��)
;             $Find - �������ַ���
; ����:
; ����ֵ:     �ɹ� - ����ָ���ֶε�ֵ
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessQueryStr($adSource, $adTable, $adCol, $Find)
	$Find = Chr(34) & String($Find) & Chr(34)
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.Open("SELECT * FROM " & $adTable & " Where " & $adCol & " = " & $Find, $oADO, $adOpenStatic, $adLockOptimistic)
	If $oRec.RecordCount > 0 Then
		$oRec.MoveFirst()
		Return $oRec.Fields($adCol).Value
	EndIf
	Return ''
EndFunc   ;==>_accessQueryStr

;===============================================================================
; ��������:   _accessSaveXML()
; ����:       �� MS Access ���ݿ���ָ���ı�����ΪXML�ļ�
; �﷨:       _accessSaveXML($adSource, $adTable[,$oFile])
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $oFile - ·���Լ�xml�ļ��� (Ĭ����չ��.xml)
; ����:
; ����ֵ:     ��
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessSaveXML($adSource, $adTable, $oFile = '')
	If $oFile = '' Then $oFile = StringLeft($adSource, StringInStr($adSource, '\', 0, -1)) & $adTable & '.xml'
	If Not StringInStr($oFile, '\') Then $oFile = StringLeft($adSource, StringInStr($adSource, '\', 0, -1)) & $oFile
	If StringRight($oFile, 4) <> '.xml' Then $oFile &= '.xml'
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset()
	$oRec.Open("SELECT * FROM " & $adTable, $oADO, $adOpenStatic, $adLockOptimistic)
	$oRec.MoveFirst()
	$oRec.Save($oFile, $adPersistXML)
	$oRec.Close
	$oADO.Close
EndFunc   ;==>_accessSaveXML

;===============================================================================
; ��������:   _accessTableCount()
; ����:       ͳ���� MS Access ���ݿ����ж��ٸ���
; �﷨:       _accessTableCount($adSource)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
; ����:
; ����ֵ:     �ɹ� - ���ر������
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
; ����:       MsgBox(4096, '��', '�����ݿ�����<' & _accessTableCount($adSource) & '>����')
;===============================================================================

Func _accessTableCount($adSource)
	Local $T_Count = StringSplit(_accessListTables($adSource), '|')
	Return $T_Count[0]
EndFunc   ;==>_accessTableCount

;===============================================================================
; ��������:   _accessUpdateRecord()
; ����:       ����MS Access���ݿ��еı������±��е����ݼ�¼
; �﷨:       _accessUpdateRecord($adSource,$adTable,$adCol,$adQuery,$adcCol,$adData)
; ����:       $adSource - �����ݿ��ļ�������·���Լ����ݿ��ļ���
;             $adTable - �����ı�����
;             $adCol - �������ֶ���
;             $adQuery - �������ַ���
;             $adcCol - ���º��ֶ���
;             $adData - ���º��ַ������µ��ַ������ᴢ����$adcCol
; ����:
; ����ֵ:     �ɹ� - ���±�
;             ʧ�� - ����@Error
;                        1 = �޷���������
;                        2 = �޷�����recordset����
;                        3 = ����ʧ��,�޷��򿪼�¼
; ����:       George (GEOSoft) Gedye
; ���ػ�:     Kodin
; ע:
; �޸�:
;===============================================================================

Func _accessUpdateRecord($adSource, $adTable, $adCol, $adQuery, $adcCol, $adData)
	$adQuery = Chr(39) & $adQuery & Chr(39)
	Local $oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	Local $oRec = _dbOpenRecordset();ObjCreate("ADODB.Recordset")
	If IsObj($oRec) = 0 Then Return SetError(2)
	$oRec.CursorLocation = $adUseClient
	$oRec.Open("SELECT * FROM " & $adTable, $oADO, $adOpenStatic, $adLockOptimistic)
	If @error = 0 Then
		$oRec.Find($adCol & ' = ' & $adQuery)
		$oRec($adcCol) = $adData
		$oRec.Update
		$oRec.Close
	Else
		$oADO.Close
		Return SetError(3, 0, 0)
	EndIf
	$oADO.Close
EndFunc   ;==>_accessUpdateRecord

Func _dbOpenRecordset()
	Local $oRec = ObjCreate("ADODB.Recordset")
	Return $oRec
EndFunc   ;==>_dbOpenRecordset

;;  Private Functions

Func _dbOpen($adSource)
	Local $oADO = ObjCreate("ADODB.Connection")
	$oADO.Provider = $adoProvider
	$oADO.Open($adSource)
	Return $oADO
EndFunc   ;==>_dbOpen