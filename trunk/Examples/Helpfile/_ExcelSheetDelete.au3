
; ***************************************************************
; ��1 - �򿪲����ع����������ʶ��, ������ɾ��������
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

_ExcelSheetDelete($oExcel, "Sheet1") ;ͨ����������ַ���ɾ����

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

; ***************************************************************
; ��2 - �򿪲����ع����������ʶ��, ������ɾ��������
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

_ExcelSheetDelete($oExcel, 1) ;ͨ������������ɾ����

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

