#include <MSSQL.au3>
#include <Array.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example_1(); ʾ��

Example_2(); ʾ��

Func Example_1()
	; ����
	$TableName_1 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ����ɾ������(ɾ����������)
	_MSSQL_DeleteRecord($sqlCon, $TableName_1)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_1

Func Example_2()
	; ����
	$TableName_1 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ����ɾ������(������ɾ��ָ������)
	_MSSQL_DeleteRecord($sqlCon, $TableName_1, "WHere TestColumn = '123456789'")
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_2
