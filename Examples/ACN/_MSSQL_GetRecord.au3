#include <MSSQL.au3>
#include <Array.au3>

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

	; �����ݿ���л�ȡһ������ֵ
	$getrecord = _MSSQL_GetRecord($sqlCon, $TableName_1)
	_ArrayDisplay($getrecord)

	; �����ݿ���л�ȡ�����У�����ָ���Ľ����������������
	$getrecord = _MSSQL_GetRecord($sqlCon, $TableName_1, "*", "", "TestColumn")
	_ArrayDisplay($getrecord)
	
	; �����ݿ���л�ȡָ�����У�����ָ���Ľ����������������
	$getrecord = _MSSQL_GetRecord($sqlCon, $TableName_1, "ID,TestColumn", "", "ID")
	_ArrayDisplay($getrecord)

	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example
