
#include  <SQLite.au3>
#include  <SQLite.dll.au3>

Local $hQuery, $aRow, $sMsg
_SQLite_Startup()
_SQLite_Open() ; ��:�ڴ�:���ݿ�
_SQLite_Exec(-1, "CREATE table aTest (a,b,c);") ; ������
_SQLite_Exec(-1, "INSERT INTO aTest(a,b,c) VALUES ('c','2','World');") ; ��������
_SQLite_Exec(-1, "INSERT INTO aTest(a,b,c) VALUES ('b','3','');") ; ��������
_SQLite_Exec(-1, "INSERT INTO aTest(a,b,c) VALUES ('a','1','Hello');") ; ��������
_SQlite_Query(-1, "SELECT c FROM aTest ORDER BY a;", $hQuery) ; ��ѯ
While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
	$sMsg &= $aRow[0]
WEnd
_SQLite_Exec(-1, "DROP table aTest;") ; �Ƴ���
msgbox(0, "SQLite" & _SQLite_LibVersion(), "Get Data using a Query :" & $sMsg)
_SQLite_Close()
_SQLite_Shutdown()

;~ ���:
;~
;~ Hello World

