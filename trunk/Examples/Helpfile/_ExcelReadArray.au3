
; ***************************************************************
; ʾ�� - �򿪲����ع����������ʶ��, ����Ԫ���������, ��ʾ����, �����ر��ļ�.
; *****************************************************************

#include  <Excel.au3>
#include  <Array.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;��ֵ1��5��ֱд�뵥Ԫ��
Next

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, Asc($i), 1, $i + 2) ;ˮƽд�뵥Ԫ��, ���ڶ�ȡĿ����ʹ�ò�ֵͬʱ��ʹ��ASCII
Next

$aArray1 = _ExcelReadArray($oExcel, 1, 1, 5, 1) ;��ֱ����
$aArray2 = _ExcelReadArray($oExcel, 1, 3, 5) ;ˮƽ����
_ArrayDisplay($aArray2, "Horizontal")
_ArrayDisplay($aArray1, "Vertical")

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���ڽ��䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

