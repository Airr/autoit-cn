
; ***************************************************************
; ��1 - �򿪲����ع����������ʶ��д�뵥Ԫ��, ��ȡ��Ԫ��, �����ر��ļ�.
; *****************************************************************

#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

_ExcelWriteCell($oExcel, "I Wrote to This Cell", 1, 1) ;д�뵥Ԫ��
$sCellValue = _ExcelReadCell($oExcel, 1, 1)
msgbox(0, "", "The Cell Value is:" & @CRLF & $sCellValue, 2)

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���ڽ��䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

; ***************************************************************
; ��2 - �򿪲����ع����������ʶ��ʹ��ѭ��д�뵥Ԫ��, ��ȡ��Ԫ��, �����ر��ļ�.
; *****************************************************************

#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

For $i = 1 To 5 ;ѭ��
	_ExcelWriteCell($oExcel, $i, $i, 1) ;д�뵥Ԫ��
Next

For $i = 1 To 5 ;ѭ��
	$sCellValue = _ExcelReadCell($oExcel, $i, 1)
	msgbox(0, "", "The Cell Value is:" & @CRLF & $sCellValue, 2)
Next

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

