; *****************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����, ʹ�ù���������ֵ�ƶ���Ӧ�Ĺ�����
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�
_ExcelSheetMove($oExcel, 2) ;�ƶ��ڶ�����������λ (����/��������)
MsgBox(4096, "Exiting", "Notice How Sheet2 is in the 1st Position" & @CRLF & @CRLF & "Now Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; *****************************************************************
; ʾ�� 2 - �򿪹�����������������ʶ����, ���ݱ�ʾ���������Ƶ��ַ����ƶ���Ӧ�Ĺ�����
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�
_ExcelSheetMove($oExcel, "Sheet2") ;�ƶ��ڶ�����������λ (�ַ���/��������)
MsgBox(4096, "Exiting", "Notice How Sheet2 is in the 1st Position" & @CRLF & @CRLF & "Now Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 3 - �򿪹�����������������ʶ����, ʹ�ù���������ֵ�ƶ���Ӧ�Ĺ�����
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�
;���һЩ������, ����������
Local $sSheetName4 = "Sheet4"
Local $sSheetName5 = "Sheet5"
_ExcelSheetAddNew($oExcel, $sSheetName4) ;�����һ��������
_ExcelSheetMove($oExcel, $sSheetName4, 4, False) ;�ƶ� $sSheetName4 �����ĵ�λ�� (false ʹ�ð�����������Թ�����֮��)

_ExcelSheetAddNew($oExcel, $sSheetName5) ;�����һ��������
_ExcelSheetMove($oExcel, $sSheetName5, 5, False) ;�ƶ� $sSheetName5 �������λ�� (false ʹ�ð�����������Թ�����֮��)

MsgBox(4096, "Show", "Take note of the order of the Worksheets" & @CRLF & @CRLF & "Press OK to Continue")

_ExcelSheetMove($oExcel, $sSheetName5, "Sheet3", True) ;�ƶ����������������Ϊ 'Sheet3' �Ĺ�����֮��
MsgBox(4096, "Exiting", "'" & $sSheetName5 & "'" & " when the $fBefore paramter is True (Relative to 'Sheet3')" & @CRLF & @CRLF & "Press OK to Continue")
_ExcelSheetMove($oExcel, $sSheetName5, "Sheet3", False) ;�ƶ����������������Ϊ 'Sheet3' �Ĺ�����֮��
MsgBox(4096, "Exiting", "'" & $sSheetName5 & "'" & " when the $fBefore paramter is False (Relative to 'Sheet3')" & @CRLF & @CRLF & "Now Press OK to Save File and Exit")

_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
