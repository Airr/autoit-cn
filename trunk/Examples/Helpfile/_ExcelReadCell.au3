; ***************************************************************
; ʾ�� 1 - ��һ��������������������ʶ����, д�����ݵ���Ԫ��.  ��ȡ��Ԫ������, Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

_ExcelWriteCell($oExcel, "I Wrote to This Cell", 1, 1) ;д�����ݵ���Ԫ��
Local $sCellValue = _ExcelReadCell($oExcel, 1, 1)
MsgBox(4096, "", "The Cell Value is: " & @CRLF & $sCellValue, 2)

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - ��һ��������������������ʶ����, ��ѭ����д�����ݵ���Ԫ��.  ��ȡ��Ԫ������, Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;д�����ݵ���Ԫ��
Next

For $i = 1 To 5 ;ѭ��
	$sCellValue = _ExcelReadCell($oExcel, $i, 1)
	MsgBox(4096, "", "The Cell Value is: " & @CRLF & $sCellValue, 2)
Next

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
