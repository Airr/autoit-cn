; ******************************************************************************************
; ʾ�� 1 ��һ���µĹ���������������ʶ��, ���һЩ��Ԫ��ʹ�ò�ͬ������ֵ��������, Ȼ�󱣴沢�ر��ļ�.
;
; ******************************************************************************************

#include <Excel.au3>
#include <Array.au3>

Local $oExcel = _ExcelBookNew() ;����һ���µĹ�������

;ʹ��һ���򵥵�ѭ�������������䵥Ԫ��
For $y = 1 To 10 ;�ӵ�һ�п�ʼ
	For $x = 1 To 15
		_ExcelWriteCell($oExcel, Round(Random(1000, 10000), 0), $x, $y) ;���ļ�д�����������Ϣ
	Next
Next

Local $aArray = _ExcelReadSheetToArray($oExcel) ;ʹ��Ĭ�ϲ���
_ArrayDisplay($aArray, "ʹ��Ĭ�ϲ���")

$aArray = _ExcelReadSheetToArray($oExcel, 2) ;�ӵ�2�п�ʼ
_ArrayDisplay($aArray, "�ӵ�2�п�ʼ")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 2) ;�ӵ�2�п�ʼ
_ArrayDisplay($aArray, "�ӵ�2�п�ʼ")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 5) ;��ȡ5��
_ArrayDisplay($aArray, "��ȡ5��")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 0, 2) ;��ȡ2��
_ArrayDisplay($aArray, "��ȡ2��")

$aArray = _ExcelReadSheetToArray($oExcel, 2, 3, 4, 5) ;�ӵ�2�е�3�п�ʼ, ��ȡ4��5��
_ArrayDisplay($aArray, "�ӵ�2�е�3�п�ʼ, ��ȡ4��5��")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 0, 0, True);ʹ��Ĭ�ϲ���, ���ǿ���(��)
_ArrayDisplay($aArray, "ʹ��Ĭ�ϲ���, ���ǿ���(��)")

MsgBox(0, "�˳�", "��[ȷ��]�����ļ����˳�")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ����ʱĿ¼�����ļ�, ����ļ��Ѵ����򸲸�ԭ�ļ�
_ExcelBookClose($oExcel) ; �رչ�����, �˳�