; ***************************************************************
; ʾ�� 1 - ��һ��������������������ʶ����, ʹ��ѭ��д�����ݵ���Ԫ��.  Ȼ�����빫ʽ.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

For $i = 0 To 20 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;д�����ݵ���Ԫ��
Next

_ExcelWriteFormula($oExcel, "=Average(R1C1:R20C1)", 1, 2) ;ʹ�� R1C1 ������ʽ

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
