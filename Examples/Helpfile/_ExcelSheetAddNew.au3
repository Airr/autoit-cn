
; ***************************************************************
; ʾ�� - �򿪲����ع����������ʶ��, ����±�
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

_ExcelSheetAddNew($oExcel, "New Sheet ʾ��")

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

