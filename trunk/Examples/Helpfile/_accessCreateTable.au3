#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 ����:      ʾ�� 1
 ��������:   _accessCreateTable()
 ����:      �����е����ݿ��ļ��н�����
 �﷨:       _accessCreateTable($adSource, $adTable, $adCol)
 ����:      $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
            $adTable - �����ı�����
            $adCol - �ֶ����ͱ����÷ָ���'|'�ָ��ͷ���ƺ��ֶ�����
 ����:      1��TEXT(��ֵ1-255)=�ı���char(n)  n��ʾ�ı���С
            2��MEMO=��ע
            3��COUNTER=�Զ����
            4��INTEGER=����
            5��YESNO=��/�� (bit)
            6��DATETIME=ʱ������
            7��CURRENCY=����
            8��OLEOBJECT=OLE ����
            9��BYTE=�ֽ���
            10��LONG=������
            11��SHORT=����
            12��SONGLE=������
            13��DOUBLE=˫����
            14��BINARY=������
			15��primary key=��������Ϊ����(���ظ�)
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "id COUNTER primary key | name text(255) | pass text(255)"

_accessCreateTable($adSource, $adTable, $adCol);��DB1.mdb���ݿ��д�����
MsgBox(64, "��ʾ", "������ɹ�", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 ����:      ʾ�� 2
 ����:      �����е����ݿ��ļ��н�����
 ˵��:      ��ADODB�����Ӵ�(Connection)�������ӵ�ָ�������ݿⲢ�򿪣�
			 ִ��CREATE TABLE (�����±�)������Ϊ���������е����ơ�
            ��ADODB�����ݿ⣬ִ��ALTERTABLE(�޸����ݿ��)��
			 ��ADDididentity(1,1)primarykey,namechar(255),passchar(255)����ʾ���ID��name��pass�����С�
			 ��identity(1,1)primarykey����ָ��������Ϊ��������char(255)������������
			 ������ʹ��text ��ʾ�ı����ͣ�ʹ��char���������û�а�װAccess�Ŀͻ����϶����������ʡ�Ժţ�
			 ��Ϊָ����255�ֽڻ�ȫ������ʾ�������رձ������ӡ�
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table2"

If FileExists($adSource) Then
	$addtbl = ObjCreate("ADODB.Connection")
	$addtbl.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
	$addtbl.Execute("CREATE TABLE " & $adTable)
	$addtbl.Execute("ALTER TABLE " & $adTable & " ADD id identity(1, 1) primary key,name text(255) ,pass text(255)")
	$addtbl.Close
	MsgBox(64, "��ʾ", "������ɹ�", 5)
Else
	MsgBox(64, "����", "���ݿ��ļ�������", 5)
EndIf
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 ����:      ʾ�� 3
 ��������:   _accessCreateTable()
 ����:      �����е����ݿ��ļ��н�����
 �﷨:       _accessCreateTable($adSource, $adTable, $adCol)
 ����:      $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
            $adTable - �����ı�����
            $adCol - �ֶ����ͱ����÷ָ���'|'�ָ��ͷ���ƺ��ֶ�����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table3"
$adCol = "id COUNTER primary key | name text(255) | pass text(255)"

_accessCreateTable($adSource, $adTable, $adCol)

Func _accessCreateTable($adSource, $adTable, $adCol = '');�����ݿ��д�����
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
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	If $F_Out <> '' Then
		$oADO.Execute("CREATE TABLE " & $adTable & '(' & $F_Out & ')');;<<=== ����$adCol���󣬴�����
		MsgBox(64, "��ʾ", "������ɹ�", 5)
	Else
		$oADO.Execute("CREATE TABLE " & $adTable);;  <<==== $adColû��������ݣ����ᴴ��һ���յı�
	EndIf
	$oADO.Close()
EndFunc   ;==>_accessCreateTable

Func _accessListTables($adSource);�������ݿ������еı�����
	Local $oList = ''
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	$oRec = $oADO.OpenSchema(20)
	While Not $oRec.EOF
		If StringLen( $oRec("TABLE_TYPE" ).value) > 5 Then;; �����������Եı�
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
