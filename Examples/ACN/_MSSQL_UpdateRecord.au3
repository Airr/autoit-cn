#include <MSSQL.au3>
#include <Array.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example_1(); ʾ�� 1

Example_2(); ʾ�� 2

Func Example_1()
	; ����
	$TableName_1 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �޸�ǰ
	$getrecord = _MSSQL_GetRecord($sqlCon, $TableName_1)
	_ArrayDisplay($getrecord)
	
	; �����ݿ�����޸�ָ���е�����(�����޸�)
	_MSSQL_UpdateRecord($sqlCon, $TableName_1, "TestColumn", "Value0")
	
	; �޸ĺ�
	$getrecord = _MSSQL_GetRecord($sqlCon, $TableName_1)
	_ArrayDisplay($getrecord)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_1

Func Example_2()
	; ����
	$TableName_1 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �޸�ǰ
	$getrecord = _MSSQL_GetRecord($sqlCon, $TableName_1)
	_ArrayDisplay($getrecord)
	
	; �����ݿ�����޸�ָ���е�����(����ѯ�����޸�ָ������)
	_MSSQL_UpdateRecord($sqlCon, $TableName_1, "TestColumn", "123456789", "WHere TestColumn = 'Value1'")
	
	; �޸ĺ�
	$getrecord = _MSSQL_GetRecord($sqlCon, $TableName_1)
	_ArrayDisplay($getrecord)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_2
