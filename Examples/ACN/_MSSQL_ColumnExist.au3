#include <MSSQL.au3>

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
	
	; �����ݿ��м����Ƿ����
	$ColumnExist = _MSSQL_ColumnExist($sqlCon, $TableName_1, "ID")
	If $ColumnExist = 1 Then
		MsgBox(4096, "�д���", "����ֵ= " & $ColumnExist)
	Else
		MsgBox(4096, "�в�����", "����ֵ= " & $ColumnExist)
	EndIf
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example

