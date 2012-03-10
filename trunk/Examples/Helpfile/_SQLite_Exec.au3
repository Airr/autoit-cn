#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $hQuery, $aRow
_SQLite_Startup()
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open()
; û�� $sCallback ����û��������
_SQLite_Exec(-1, "Create table tblTest (a,b int,c single not null);" & _
		"Insert into tblTest values ('1',2,3);" & _
		"Insert into tblTest values (Null,5,6);")

Local $d = _SQLite_Exec(-1, "Select rowid,* From tblTest", "_cb") ; ����ÿ�е��� _cb

Func _cb($aRow)
	For $s In $aRow
		ConsoleWrite($s & @TAB)
	Next
	ConsoleWrite(@CRLF)
	; ���� $SQLITE_ABORT ; ���жϽ��̲��� _SQLite_Exec() �д��� @error
EndFunc   ;==>_cb
_SQLite_Close()
_SQLite_Shutdown()

; ���
;~ 	1		1	2	3
;~ 	2			5	6
