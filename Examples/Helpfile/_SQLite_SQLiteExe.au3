#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <File.au3>

;�ļ���
Local $sTsvFile = FileGetShortName(_TempFile(@ScriptDir, "~", ".tsv"))
Local $sDbFile = FileGetShortName(_TempFile(@ScriptDir, "~", ".db"))

;���� Tsv �ļ�
FileWriteLine($sTsvFile, "a" & @TAB & "b" & @TAB & "c")
FileWriteLine($sTsvFile, "a1" & @TAB & "b1" & @TAB & "c1")
FileWriteLine($sTsvFile, "a2" & @TAB & "b2" & @TAB & "c2")

;����(ʹ�� SQLite3.exe)
Local $sIn, $sOut, $i, $sCreate = "CREATE TABLE TblImport (";
For $i = 1 To _StringCountOccurance(FileReadLine($sTsvFile, 1), @TAB) + 1
	$sCreate &= "Column_" & $i & ","
Next
$sCreate = StringTrimRight($sCreate, 1) & ");"
$sIn = $sCreate & @CRLF ; ������
$sIn &= ".separator \t" & @CRLF ; �� @TAB ��Ϊ�ָ���
$sIn &= ".import '" & $sTsvFile & "' TblImport" & @CRLF
_SQLite_SQLiteExe($sDbFile, $sIn, $sOut, -1, True)

If @error = 0 Then
	;��ʾ�� (ʹ�� SQLite3.dll)
	Local $iRows, $iColumns, $aRes
	_SQLite_Startup()
	ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
	_SQLite_Open($sDbFile)
	_SQLite_GetTable2d(-1, "SELECT ROWID,* FROM TblImport;", $aRes, $iRows, $iColumns)
	_SQLite_Display2DResult($aRes) ; ���������̨
	_SQLite_Close()
	_SQLite_Shutdown()
Else
	If @error = 2 Then
		ConsoleWrite("ERROR: Sqlite3.exe file not found" & @CRLF)
	Else
		ConsoleWrite("ERROR: @error=" & @error & " when calling _SQLite_SQLiteExe" & @CRLF)
	EndIf
EndIf

;�Ƴ���ʱ�ļ�
FileDelete($sTsvFile)
FileDelete($sDbFile)

;~ Output:
;~ 	rowid  Column_1  Column_2  Column_3
;~ 	1      a         b         c
;~ 	2      a1        b1        c1
;~ 	3      a2        b2        c2



Func _StringCountOccurance($sSearchString, $sSubString, $fCaseSense = 0) ; ������ $sSearchString �� $sSubString ����Ŀ
	Local $iOccCnt = 1
	Do
		If StringInStr($sSearchString, $sSubString, $fCaseSense, $iOccCnt) > 0 Then
			$iOccCnt += 1
		Else
			ExitLoop
		EndIf
	Until 0
	Return $iOccCnt - 1
EndFunc   ;==>_StringCountOccurance
