; ***************************************************************
; ʾ�� 1 - �򿪹�����������������ʶ����, ��������ʾ���й����������й��������Ƶ�����
; *****************************************************************

#include <Excel.au3>
#include <Array.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

Local $aArray = _ExcelSheetList($oExcel)
_ArrayDisplay($aArray, "All The WorkSheets In this WorkBook")

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - �򿪹�����������������ʶ����, �������й����������й��������Ƶ�����
;				�������ַ�������ÿ��������
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ;����ѭ��
	_ExcelSheetActivate($oExcel, $aArray[$i]) ;ʹ������Ԫ�ط��ص��ַ���
	MsgBox(4096, "ActiveSheet", "The Active Sheet should be:" & @CRLF & $aArray[$i])
Next

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 3 - �򿪹�����������������ʶ����, �������й����������й�������������
;				����������ֵ����ÿ��������
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ;����ѭ��
	_ExcelSheetActivate($oExcel, $i) ;ʹ����������
	MsgBox(4096, "ActiveSheet", "The Active Sheet should be:" & @CRLF & $aArray[$i])
Next

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 4 - �򿪹�����������������ʶ����, �������й����������й��������Ƶ�����
;				����������ֵ����ÿ��������.  д���������ݵ�ÿ���������в��Ž�һЩ�������
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ;����ѭ��
	_ExcelSheetActivate($oExcel, $i) ;ʹ����������
	_ExcelWriteArray($oExcel, 1, 1, $aArray, 1) ;д���������ݵ���Ĺ�����
	; �����ڵ���ѭ����ʹ����������һЩ��Ԫ��
	For $y = 2 To 10
		For $x = 2 To 10
			_ExcelWriteCell($oExcel, Round(Random(1000, 10000), 0), $x, $y) ;д�뵽�ļ���һЩ�����
		Next
	Next
	MsgBox(4096, "ActiveSheet", "The Active Sheet should be:" & @CRLF & $aArray[$i])
Next

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
