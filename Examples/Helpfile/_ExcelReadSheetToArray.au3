
; ******************************************************************************************
; �� - �򿪲����ع����������ʶ��, ���һЩ��Ԫ��ʹ�ò�ͬ������ֵ��������.
; ******************************************************************************************

#include  <Excel.au3>
#include  <Array.au3>

Local $oExcel = _ExcelBookNew() ;����һ���µĹ�������

; ����ʹ��һ����ѭ�������������䵥Ԫ��
For $y = 1 To 10 ;����1��ʼ
	For $x = 1 To 15
		_ExcelWriteCell($oExcel, Round( Random(1000, 10000), 0), $x, $y) ;����һЩ�������
	Next
Next

$aArray = _ExcelReadSheetToArray($oExcel) ;ʹ��Ĭ�ϲ���
_ArrayDisplay($aArray, "Array using Default param")

$aArray = _ExcelReadSheetToArray($oExcel, 2) ;�ӵ�2�п�ʼ
_ArrayDisplay($aArray, "Starting on the 2nd Row")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 2) ;�ӵ�2�п�ʼ
_ArrayDisplay($aArray, "Starting on the 2nd Column")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 5) ;��ȡ5��
_ArrayDisplay($aArray, "Read 5 Rows")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 0, 2) ;��ȡ2��
_ArrayDisplay($aArray, "Read 2 Columns")

$aArray = _ExcelReadSheetToArray($oExcel, 2, 3, 4, 5) ;�ӵ�2�е�3�п�ʼ, ��ȡ4��5��
_ArrayDisplay($aArray, "Starting on the 2nd Row, 3rd Column, Read 4 Rows and 5 Columns")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 0, 0, True) ;ʹ��Ĭ�ϲ���, ���ǿ���Ϊ��
_ArrayDisplay($aArray, "Array with Column shifting")

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

