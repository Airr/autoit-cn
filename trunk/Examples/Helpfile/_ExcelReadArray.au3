; ***************************************************************
; ʾ�� 1 - ��һ��������������������ʶ����, ��ѭ����д�����ݵ���Ԫ��.  ��ȡ��Ԫ�����ݵ�������, ��ʾ����,
;				Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>
#include <Array.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;����ֵ 1 �� 5 ��ֱд�뵥Ԫ��
Next

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, Asc($i), 1, $i + 2) ;ˮƽд�뵥Ԫ��, ʹ�� Asc �õ���ֵͬ���ڶ�ȡ
Next

Local $aArray1 = _ExcelReadArray($oExcel, 1, 1, 5, 1) ;������ˮƽ��
Local $aArray2 = _ExcelReadArray($oExcel, 1, 3, 5) ;�����Ǵ�ֱ��
_ArrayDisplay($aArray2, "Horizontal")
_ArrayDisplay($aArray1, "Vertical")

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
