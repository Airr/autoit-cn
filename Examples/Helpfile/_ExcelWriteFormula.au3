
; ***************************************************************
; ʾ�� - �򿪲����ع����������ʶ��ʹ��ѭ��д��һ����Ԫ��, Ȼ������һ����ʽ.
; *****************************************************************

#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

For $i = 0 To 20 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;д�뵥Ԫ��
Next

_ExcelWriteFormula($oExcel, "=Average(R1C1:R20C1)", 1, 2) ;ʹ��R1C1��ʽ

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

