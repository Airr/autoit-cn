; ***************************************************************
; ʾ�� 1 - ��һ��������������������ʶ����, ��ѭ����д�����ݵ���Ԫ��.  �����ֽ��и�ʽ������, Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�

; �����ڵ���ѭ����ʹ����������һЩ��Ԫ��
For $y = 1 To 10
	For $x = 1 To 10
		_ExcelWriteCell($oExcel, Random(1000, 10000), $x, $y) ;д�뵽�ļ���һЩ�����
	Next
Next

Local $sFormat = "$#,##0.00" ;��ʽ�ַ�����֪ _ExcelNumberFormat ������ʽ������Ԫ ($) ����
_ExcelNumberFormat($oExcel, $sFormat, 1, 1, 5, 5) ;�ӵ� 1 ��, ��һ�п�ʼ���� 5 �е� 5 �н���

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�

; ***************************************************************
; ʾ�� 2 - ��һ��������������������ʶ����, ��ѭ����д�����ݵ���Ԫ��.  �����ֽ��и�ʽ������, Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ;�����¹�����, ��ʹ��ɼ�
Local $aFormatExamples[5] = ["Format Examples", "General", "hh:mm:ss", "$#,##0.00", "[Red]($#,##0.00)"] ;�����ɱ�����ɵ�����

For $i = 0 To UBound($aFormatExamples) - 1 ;��ѭ����д�����
	_ExcelWriteCell($oExcel, $aFormatExamples[$i], 1, $i + 1) ; �� $i �� 1 �������� 0 ��������������ƥ��
Next

; �����ڵ���ѭ����ʹ����������һЩ��Ԫ��
For $y = 2 To 5 ;�ӵ� 2 �п�ʼ
	For $x = 2 To 10
		_ExcelWriteCell($oExcel, Random(1000, 10000), $x, $y) ;д�뵽�ļ���һЩ�����
	Next
Next

ToolTip("Formatting Column(s) Soon...")
Sleep(3500) ;��ͣ�Ա��û��鿴����

; ���ǿ�����һ���򵥵�ѭ���н��и�ʽ��
; ÿ�н�ʹ�ò�ͬ�ĸ�ʽ����
For $i = 1 To UBound($aFormatExamples) - 1
	_ExcelNumberFormat($oExcel, $aFormatExamples[$i], 2, $i, 11, $i)
Next

$oExcel.Columns.AutoFit ;�Զ��������Ի�ø�����ͼ
$oExcel.Rows.AutoFit ;�Զ��������Ի�ø�����ͼ

MsgBox(4096, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; �������ǰ������浽��ʱĿ¼; ��Ҫʱ�����ļ�
_ExcelBookClose($oExcel) ; ������ǹرղ��˳�
