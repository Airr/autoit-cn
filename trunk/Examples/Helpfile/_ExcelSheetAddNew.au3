; ***************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����, ���һ���µĹ�����
; *****************************************************************
#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

_ExcelSheetAddNew($oExcel, "New Sheet Example")

MsgBox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�