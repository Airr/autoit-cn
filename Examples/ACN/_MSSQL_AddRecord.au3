#include <MSSQL.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example_1(); ʾ�� 1 �����ݿ���в���һ����ֵ

Example_2(); ʾ�� 1 �����ݿ���в���һ����ֵ

Func Example_1()
	; ����
	$TableName_1 = "TestTable1"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ��д�����,Ĭ���Զ����� ID ��
	_MSSQL_CreateTable($sqlCon, $TableName_1)
	
	; ����һ�������µ���
	_MSSQL_CreateColumn($sqlCon, $TableName_1, "TestColumn VARCHAR(150)")
	
	; �����ݿ���в���һ����ֵ,ʹ��������ʽ,��������ظ�����
	_MSSQL_AddRecord($sqlCon, $TableName_1, "'Value9'", True, "WHERE TestColumn = 'Value9'")
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_1

Func Example_2()
	Dim $TestArray1[10]
	$TestArray1[1] = "VALUE1"
	$TestArray1[2] = "Value2"
	$TestArray1[3] = "Value3"
	$TestArray1[4] = "Value4"
	$TestArray1[5] = "Value5"
	$TestArray1[6] = "Value6"
	$TestArray1[7] = "Value7"
	$TestArray1[8] = "Value8"
	$TestArray1[9] = "123456789"
	
	; ����
	$TableName_2 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ��д�����,Ĭ���Զ����� ID ��
	_MSSQL_CreateTable($sqlCon, $TableName_2)
	
	; ����һ�������µ���
	_MSSQL_CreateColumn($sqlCon, $TableName_2, "TestColumn VARCHAR(150)")
	
	; �����ݿ���в���һ����ֵ,����û��ʹ��������ʽ,������ظ�����
	For $i = 1 To UBound($TestArray1) - 1
		_MSSQL_AddRecord($sqlCon, $TableName_2, "'" & $TestArray1[$i] & "'")
	Next
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_2
