
; ***************************************************************
; ʾ�� - ���¹����������ض����ʶ. ����ʾ����±����ļ�
; *****************************************************************

#include  <Excel.au3>

$oExcel = _ExcelBookNew()

_ExcelBookSave($oExcel) ;Save File With No Alerts
If Not @error Then msgbox(0, "Success", "File was Saved!", 3)

