
; ***************************************************************
; ʾ�� - �򿪹�����������������ʶ��. ����һ������, Ȼ����������
; *****************************************************************

#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

;��������
Local $aArray[5] = ["LocoDarwin", "Jon", "big_daddy", "DaleHolm", "GaryFrost"]

_ExcelWriteArray($oExcel, 1, 1, $aArray) ; ˮƽд������
_ExcelWriteArray($oExcel, 5, 1, $aArray, 1) ; �ӵ�5�п�ʼ��ֱд������

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

