#include <MSSQL.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example_1(); ʾ�� 1

Example_2(); ʾ�� 2

Func Example_1()
	; ����
	$TableName_1 = "TestTable1"
	
	; �������ݿ�.
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ��д�����,Ĭ���Զ����� ID ��
	_MSSQL_CreateTable($sqlCon, $TableName_1)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_1

Func Example_2()
	; ����
	$TableName_2 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ��д������ͬʱ������Ӧ����
	_MSSQL_CreateTable($sqlCon, $TableName_2, True, "ID INT,Name varchar(255),Pass varchar(255)")
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_2
