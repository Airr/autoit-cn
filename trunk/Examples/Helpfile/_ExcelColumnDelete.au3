
; ***************************************************************
; ��1 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ɾ��һ�к󱣴沢�ر��ļ�
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, 1, $i) ;ʹ��ֵ1��5ˮƽд�뵥Ԫ��
Next

ToolTip("Deleting Column Soon...")
Sleep(3500)

_ExcelColumnDelete($oExcel, 1, 1) ;ɾ����1����ɾ��һ��

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ;���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ�
_ExcelBookClose($oExcel) ; �ر��˳�


; ***************************************************************
; ��2 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ɾ�����к󱣴沢�ر��ļ�.
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, 1, $i) ;ʹ��ֵ1��5ˮƽд�뵥Ԫ��
Next

ToolTip("Deleting Columns Soon...")
Sleep(3500)

_ExcelColumnDelete($oExcel, 3, 2) ;����3��ʼɾ������

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

