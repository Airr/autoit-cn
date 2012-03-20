﻿#include <MSSQL.au3>

$IP = "192.168.1.100"; IP地址
$USER = "sa"; 连接帐号
$PASS = ""; 连接密码
$DATABASE = "TESTDATA"; 数据库名

Example(); 示例

Func Example()
	; 表名
	$TableName_1 = "TestTable2"
	
	; 连接数据库
	$sqlCon = _MSSQL_Con($IP, $USER, $PASS, $DATABASE)
	
	; 在数据库表中删除指定的列
	_MSSQL_DropColumn($sqlCon, $TableName_1, "TestColumn")
	
	; 关闭数据库连接
	_MSSQL_End($sqlCon)
EndFunc   ;==>Example
