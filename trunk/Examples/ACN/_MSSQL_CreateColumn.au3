#include <MSSQL.au3>

$IP = "192.168.1.100"; IP��ַ
$USER = "sa"; �����ʺ�
$PASS = ""; ��������
$DATABASE = "TESTDATA"; ���ݿ���

Example_1(); ʾ�� 1

Example_2(); ʾ�� 2

Example_3(); ʾ�� 3

Func Example_1()
	; ����
	$TableName_1 = "TestTable1"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ��д�����,Ĭ���Զ����� ID ��
	_MSSQL_CreateTable($sqlCon, $TableName_1)
	
	;����һ�������µ���
	_MSSQL_CreateColumn($sqlCon, $TableName_1, "Name varchar(255),Pass varchar(255)")
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example1

Func Example_2()
	Dim $Testarray1D[10]
	$Testarray1D[1] = "Column1"
	$Testarray1D[2] = "Column2"
	$Testarray1D[3] = "Column3"
	$Testarray1D[4] = "Column4"
	$Testarray1D[5] = "Column5"
	$Testarray1D[6] = "Column6"
	$Testarray1D[7] = "Column7"
	$Testarray1D[8] = "Column8"
	$Testarray1D[9] = "Column9"
	
	; ����
	$TableName_2 = "TestTable2"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ��д�����,Ĭ���Զ����� ID ��
	_MSSQL_CreateTable($sqlCon, $TableName_2)
	
	; ����һ�������µ���
	_MSSQL_CreateColumn($sqlCon, $TableName_2, $Testarray1D)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example2

Func Example_3()
	Dim $Testarray2D[10][2]
	$Testarray2D[1][0] = "Column1"
	$Testarray2D[2][0] = "Column2"
	$Testarray2D[3][0] = "Column3"
	$Testarray2D[4][0] = "Column4"
	$Testarray2D[5][0] = "Column5"
	$Testarray2D[6][0] = "Column6"
	$Testarray2D[7][0] = "Column7"
	$Testarray2D[8][0] = "Column8"
	$Testarray2D[9][0] = "INT_Column"
	$Testarray2D[1][1] = "VARCHAR(45)"
	$Testarray2D[2][1] = "VARCHAR(60)"
	$Testarray2D[3][1] = "VARCHAR(75)"
	$Testarray2D[4][1] = "VARCHAR(40)"
	$Testarray2D[5][1] = "VARCHAR(20)"
	$Testarray2D[6][1] = "VARCHAR(17)"
	$Testarray2D[7][1] = "VARCHAR(52)"
	$Testarray2D[8][1] = "VARCHAR(100)"
	$Testarray2D[9][1] = "INT"
	
	; ����
	$TableName_3 = "TestTable3"
	
	; �������ݿ�
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; �����ݿ��д�����,Ĭ���Զ����� ID ��
	_MSSQL_CreateTable($sqlCon, $TableName_3)
	
	; ����һ�������µ���
	_MSSQL_CreateColumn($sqlCon, $TableName_3, $Testarray2D)
	
	; �ر����ݿ�����
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example3
