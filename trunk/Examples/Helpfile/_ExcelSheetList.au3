
; ***************************************************************
; ��1 - �򿪲����ع����������ʶ��, ��������ʾ�����������б���������
; *****************************************************************
#include  <Excel.au3>
#include  <Array.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

$aArray = _ExcelSheetList($oExcel)
_ArrayDisplay($aArray, "All The WorkSheets In this WorkBook")

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

; ***************************************************************
; ��2 - �򿪲����ع����������ʶ��, ���������������б��������鲢�������������
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ;�ݼ�ѭ������
	_ExcelSheetActivate($oExcel, $aArray[$i]) ;ʹ������Ԫ���з��ص��ַ�������
	msgbox(0, "ActiveSheet", "The Active Sheet should be:" & @CRLF & $aArray[$i])
Next

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

; ***************************************************************
; ��3 - �򿪲����ع����������ʶ��, ���������������б��������鲢�������������
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ;�ݼ�ѭ������
	_ExcelSheetActivate($oExcel, $i) ;ʹ����������
	msgbox(0, "ActiveSheet", "The Active Sheet should be:" & @CRLF & $aArray[$i])
Next

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

; ***************************************************************
; ��4 - �򿪲����ع����������ʶ��, ���������������б��������鲢�������������.
;               �ڹ�����ÿ��д������ı��Ϸ���һЩ�������
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½���������ʹ֮�ɼ�

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ;�ݼ�ѭ������
	_ExcelSheetActivate($oExcel, $i) ;ʹ����������
	_ExcelWriteArray($oExcel, 1, 1, $aArray, 1) ;������д��������
	; ʹ�ü�ѭ�������������䵥Ԫ��
	For $y = 2 To 10
		For $x = 2 To 10
			_ExcelWriteCell($oExcel, Round( Random(1000, 10000), 0), $x, $y) ;һЩ�������
		Next
	Next
	msgbox(0, "ActiveSheet", "The Active Sheet should be:" & @CRLF & $aArray[$i])
Next

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; �ر��˳�

