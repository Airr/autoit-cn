#include <MSSQL.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example_1(); ʾ��

Func Example_1()
	; ����
	$TableName_1 = "TestTable1"
	
	; �������ݿ�.
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ���ɾ��һ����
	_MSSQL_DropTable($sqlCon, $TableName_1)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example_1


