#include <MSSQL.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example(); ʾ��

Func Example()
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example
