; ***************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����, ���û�����������
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

_ExcelSheetNameSet($oExcel, "Example") ;�������������

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - �򿪹�����������������ʶ����, ��ʾ������������, �ı������Ʋ���ʾ�µ�����
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

MsgBox(4096, "Sheet Name", "The Current Active Sheet Name Is:" & @CRLF & _ExcelSheetNameGet($oExcel))

_ExcelSheetNameSet($oExcel, "Example") ;�������������

MsgBox(4096, "Sheet Name", "Now The Current Active Sheet Name Is:" & @CRLF & _ExcelSheetNameGet($oExcel))

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
