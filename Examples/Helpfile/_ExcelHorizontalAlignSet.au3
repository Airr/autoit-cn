; *****************************************************************
; ʾ�� 1 ��һ���µĹ���������������ʶ��, Ȼ������һ����Χ��ÿ����Ԫ���ˮƽ���뷽ʽ
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;����һ���µĹ�������
Local $sRangeOrRowStart = 1, $iColStart = 1, $iRowEnd = 10, $iColEnd = 10, $sHorizAlign = "left"

;ʹ��һ���򵥵�ѭ�������������䵥Ԫ��
For $i = 1 To 10
	For $j = 1 To 10
		_ExcelWriteCell($oExcel, Round(Random(1, 100), 0), $i, $j) ;���ļ�д�����������Ϣ
	Next
Next

MsgBox(0, "��ʾ", "��һ����Χ������ÿ����Ԫ���ˮƽ���뷽ʽ" & @CRLF & "��[ȷ��]��ʼ")

_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
MsgBox(0, "��ʾ", "ˮƽ���뷽ʽ '�����'")

$sHorizAlign = "center"
_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
MsgBox(0, "��ʾ", "ˮƽ���뷽ʽ '����'")

$sHorizAlign = "right"
_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
MsgBox(0, "��ʾ", "ˮƽ���뷽ʽ '�Ҷ���'")

MsgBox(0, "�˳�", "��[ȷ��]�����ļ����˳�")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ;��������ʱĿ¼��,����ļ��Ѵ��ڽ�����ԭ�ļ�
_ExcelBookClose($oExcel)  ;�رչ�����.