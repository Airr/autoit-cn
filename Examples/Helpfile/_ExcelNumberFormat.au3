
; ***************************************************************
; ��1 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ��ʽ�����ֺ󱣴沢�ر��ļ�.
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

; ����ʹ��һ����ѭ�������������䵥Ԫ��
For $y = 1 To 10
	For $x = 1 To 10
		_ExcelWriteCell($oExcel, Random(1000, 10000), $x, $y) ;����һЩ�������
	Next
Next

$sFormat = "$#,##0.00" ;_ExcelNumberFormat��ʽ���ַ�����Ԫ��ʹ�����$�ֽ����
_ExcelNumberFormat($oExcel, $sFormat, 1, 1, 5, 5) ;����1, ��1��ʼ, ����5, ��5����

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

; ***************************************************************
; ��2 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ��ʽ�����ֺ󱣴沢�ر��ļ�.
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�
Local $aFormatExamples[5] = ["Format Examples", "General", "hh:mm:ss", "$#,##0.00", "[Red]($#,##0.00)"] ;���ڴ�����ͷ������

For $i = 0 To UBound($aFormatʾ��s) - 1 ;���ڴ�����ͷ������
	_ExcelWriteCell($oExcel, $aFormatExamples[$i], 1, $i + 1) ; +1��$i�Ա�0����������ƥ��
Next

; ����ʹ��һ����ѭ�������������䵥Ԫ��
For $y = 2 To 5 ;����2����ʼ
	For $x = 2 To 10
		_ExcelWriteCell($oExcel, Random(1000, 10000), $x, $y) ; ����һЩ�������
	Next
Next

ToolTip("Formatting Column(s) Soon...")
Sleep(3500) ;��ͣʹ�û��۲����

; ����ʹ��һ����ѭ����ʽ��
; ÿ�н����в�ͬ���͵ĸ�ʽ
For $i = 1 To UBound($aFormatʾ��s) - 1
	_ExcelNumberFormat($oExcel, $aFormatExamples[$i], 2, $i, 11, $i)
Next

$oExcel . Columns . AutoFit ;�Զ�ƥ�����Ա���ù۲�
$oExcel . Rows . AutoFit ;�Զ�ƥ�����Ա���ù۲�

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

