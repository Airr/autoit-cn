; *****************************************************************
; ʾ�� 1 ��һ���µĹ���������������ʶ��, Ȼ������һ����Χ�ڵ���������.
; *****************************************************************
#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;����һ���µĹ�������
Local $sRangeOrRowStart = 1, $iColStart = 1, $iRowEnd = 10, $iColEnd = 10
Local $fBold, $fItalic, $fUnderline, $i = 1

;ʹ��һ���򵥵�ѭ�������������䵥Ԫ��
For $i = 1 To 10
	For $j = 1 To 10
		_ExcelWriteCell($oExcel, Round(Random(1, 100), 0), $i, $j) ;���ļ�д�����������Ϣ
	Next
Next

MsgBox(0, "��ʾ", "ע����������,���潫����ʾ���п��ܵ���ϣ�" & @CRLF & "��[ȷ��]��ʼ")

$i = 1
_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, True, True)
ToolTip("����һ���µ���������: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, False)
ToolTip("����һ���µ���������: " & $i)

MsgBox(0, "�˳�", "��[ȷ��]�����ļ����˳�")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ;��������ʱĿ¼��,����ļ��Ѵ��ڽ�����ԭ�ļ�
_ExcelBookClose($oExcel)  ;�رչ�����.