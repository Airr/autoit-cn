; ***************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����, �����ַ�����ɾ��һ��������
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

_ExcelSheetDelete($oExcel, "Sheet1") ;���ݱ�ʾ���������Ƶ��ַ���ɾ����Ӧ�Ĺ�����

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - �򿪹�����������������ʶ����, ��������ֵɾ����Ӧ�Ĺ�����
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

_ExcelSheetDelete($oExcel, 1) ;���ݹ��������Ƶ�����ֵɾ����Ӧ�Ĺ�����

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
