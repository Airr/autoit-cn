#include <MSSQL.au3>
#include <Array.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example(); ʾ��

Func Example()
	; ����
	$TableName_1 = "TestTable1"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ���л�ȡ��������
	$getrecord = _MSSQL_ListAllColumns($sqlCon, $TableName_1)
	_ArrayDisplay($getrecord)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example

