
; *****************************************************************
; ʾ�� - �򿪲����ع����������ʶ��, ����һ����Χ�ڸ��е�ˮƽ����.
; *****************************************************************

#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�
Local $sRangeOrRowStart = 1, $iColStart = 1, $iRowEnd = 10, $iColEnd = 10, $sHorizAlign = "left"

; ����ʹ�ü�ѭ�������������䵥Ԫ��
For $i = 1 To 10
	For $j = 1 To 10
		_ExcelWriteCell($oExcel, Round( Random(1, 100), 0), $i, $j) ; ���ļ����д������
	Next
Next

msgbox(0, "_ExcelHorizontalAlignSet", "Notice the Alignment" & @CRLF & "Press OK to Continue")

_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
msgbox(0, "_ExcelHorizontalAlignSet", "Alignment should be 'left'")

$sHorizAlign = "center"
_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
msgbox(0, "_ExcelHorizontalAlignSet", "Alignment should be 'center'")

$sHorizAlign = "right"
_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
msgbox(0, "_ExcelHorizontalAlignSet", "Alignment should be 'right'")

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���ڽ��䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ;

