; ***************************************************************
; ʾ�� 1 - ��һ��������������������ʶ����, ��ѭ����д�����ݵ���Ԫ��.  ɾ��һ��, Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;����ֵ 1 �� 5 ��ֱд�뵥Ԫ��
Next

ToolTip("Deleting Rows Soon...")
Sleep(3500)

_ExcelRowDelete($oExcel, 1, 1) ;ɾ����һ�в��ҽ�ɾ��һ��

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - ��һ��������������������ʶ����, ��ѭ����д�����ݵ���Ԫ��.  ɾ��һЩ��, Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; ���¹�����, ��ʹ��ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;����ֵ 1 �� 5 ��ֱд�뵥Ԫ��
Next

ToolTip("Deleting Rows Soon...")
Sleep(3500)

_ExcelRowDelete($oExcel, 3, 2) ;�ӵ����п�ʼɾ��, ����ɾ������

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
