; ***************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����.  ��������, Ȼ��������������뵽������
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

;��������
Local $aArray[5] = ["LocoDarwin", "Jon", "big_daddy", "DaleHolm", "GaryFrost"]

_ExcelWriteArray($oExcel, 1, 1, $aArray) ; ������ˮƽд��
_ExcelWriteArray($oExcel, 5, 1, $aArray, 1) ; �����鴹ֱд��, �ӵ����п�ʼ

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�