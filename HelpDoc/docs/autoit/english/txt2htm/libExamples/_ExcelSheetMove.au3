;  After opening a workbook and returning its object identifier, Move a Sheet by using the Index Value the Sheet

#include <Excel.au3>
#include <MsgBoxConstants.au3>

Local $oExcel = _ExcelBookNew() ;Create new book, make it visible
_ExcelSheetMove($oExcel, 2) ;Move the 2nd sheet to the first position (integer/index based)
MsgBox($MB_SYSTEMMODAL, "Exiting", "Notice How Sheet2 is in the 1st Position" & @CRLF & @CRLF & "Now Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Now we save it into the temp directory; overwrite existing file if necessary
_ExcelBookClose($oExcel) ; And finally we close out
