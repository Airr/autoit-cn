#include <MSSQL.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example(); ʾ��

Func Example()
	; ����
	$TableName_1 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ����ɾ��ָ������
	_MSSQL_DropColumn($sqlCon, $TableName_1, "TestColumn")
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example
