
; ***************************************************************
; ��1 - �򿪲����ع����������ʶ��, ���ػ������
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

msgbox(0, "Sheet Name", "The Current Active Sheet Name Is:" & @CRLF & _ExcelSheetNameGet($oExcel))

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

; ***************************************************************
; ��2 - �򿪲����ع����������ʶ��, ����±����ػ������
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

msgbox(0, "Sheet Name", "The Current Active Sheet Name Is:" & @CRLF & _ExcelSheetNameGet($oExcel))

_ExcelSheetAddNew($oExcel, "New Sheet ʾ��") ;Add a New Sheet

msgbox(0, "Sheet Name", "Now The Current Active Sheet Name Is:" & @CRLF & _ExcelSheetNameGet($oExcel))

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

