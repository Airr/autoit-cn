
#include  <SQLite.au3>
#include  <SQLite.dll.au3>

Local $hQuery, $aRow, $iSwitch
_SQLite_Startup()
_SQLite_Open()
_SQLite_Exec(-1, "CREATE table tblTest (a,b,c);")
_SQLite_Exec(-1, "INSERT INTO tblTest VALUES ('1','1','1');" & _  ; �� 1
		"INSERT INTO tblTest VALUES ('2','2','2');" & _  ; �� 2
		"INSERT INTO tblTest VALUES ('3','3','3');") ; �� 3
_SQLite_Query(-1, "SELECT RowID,* FROM tblTest;", $hQuery)
While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
	$iSwitch = msgbox(4 + 64, "sqlite" & _SQLite_LibVersion() & " - Row:" & $aRow[0], $aRow[1] & "," & $aRow[2] & "," & $aRow[3] & @LF & _
			"Continue Looping?")
	If $iSwitch = 6 Then ; ��
		If $aRow[0] = 3 Then _SQLite_QueryReset($hQuery)
	Else ; ��
		_SQLite_QueryFinalize($hQuery)
		ExitLoop
	EndIf
WEnd
_SQLite_Close()
_SQLite_Shutdown()

