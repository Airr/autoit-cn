; ***************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����, ʹ�ñ�ʾ���������Ƶ��ַ���ֵ������Ӧ�Ĺ�����
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

_ExcelSheetActivate($oExcel, "Sheet2")

MsgBox(4096, "Exiting", "Notice How Sheet2 is Active and not Sheet1" & @CRLF & @CRLF & "Now Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - �򿪹�����������������ʶ����, ʹ�ù���������ֵ������Ӧ�Ĺ�����
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

_ExcelSheetActivate($oExcel, 2)

MsgBox(4096, "Exiting", "Notice How Sheet2 is Active and not Sheet1" & @CRLF & @CRLF & "Now Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - �򿪹�����������������ʶ����, ʹ�ù���������ֵ������Ӧ�Ĺ�����
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

Local $iNumberOfWorksheets = $oExcel.Worksheets.Count

MsgBox(4096, "", $oExcel.Worksheets.Count)
_ExcelSheetActivate($oExcel, 2)

MsgBox(4096, "Exiting", "Notice How Sheet2 is Active and not Sheet1" & @CRLF & @CRLF & "Now Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
