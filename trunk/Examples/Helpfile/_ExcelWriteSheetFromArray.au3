; ***************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����.  ����һ����ά����, Ȼ��������������뵽������
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

;��������
Local $aArray[5][2] = [["LocoDarwin", 1],["Jon", 2],["big_daddy", 3],["DaleHolm", 4],["GaryFrost", 5]] ;���� 0 ��ʼ������
_ExcelWriteSheetFromArray($oExcel, $aArray, 1, 1, 0, 0) ;���� 0 ��ʼ���������

MsgBox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�