
; ***************************************************************************
; ��1 - ���ӵ��׸����ڵ�ʹ����ѡ��ģʽ�������ַ�����ƥ���Microsoft Excelʵ��
; ***************************************************************************
#include  <Excel.au3>
#include  <File.au3>

$sFilePath = @TempDir & "\Temp.xls"
If Not _FileCreate($sFilePath) Then ;����Ҫ���ӵ�.XLS�ļ�
	msgbox(4096, "Error", "Error Creating File -" & @error)
EndIf

_ExcelBookOpen($sFilePath)
$oExcel = _ExcelBookAttach($sFilePath) ;Ĭ������ ($s_mode = "FilePath" ==> �򿪵Ĺ�����������·��)
_ExcelWriteCell($oExcel, "If you can read this, then Success!", 1, 1) ;д�뵥Ԫ��
msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookClose($oExcel, 1, 0) ;�÷���������Ȼ�����Ƿ�ı�����ʾ�ر��ļ�

; ****************************************************************************
; ��2 - ���ӵ��׸����ڵ�ʹ����ѡ��ģʽ�������ַ�����ƥ���Microsoft Excelʵ��
; ****************************************************************************
#include  <Excel.au3>
#include  <File.au3>

$sFilePath = @TempDir & "\Temp.xls"
If Not _FileCreate($sFilePath) Then ;����Ҫ���ӵ�.XLS�ļ�
	msgbox(4096, "Error", "Error Creating File -" & @error)
EndIf

_ExcelBookOpen($sFilePath)
$oExcel = _ExcelBookAttach("Temp.xls", "FileName") ;ʹ��$s_mode = "FileName" ==> �򿪵Ĺ���������
_ExcelWriteCell($oExcel, "If you can read this, then Success!", 1, 1) ;д�뵥Ԫ��
msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookClose($oExcel, 1, 0) ;�÷���������Ȼ�����Ƿ�ı�����ʾ�ر��ļ�

; ***************************************************************************
; ��3 - ���ӵ��׸����ڵ�ʹ����ѡ��ģʽ�������ַ�����ƥ���Microsoft Excelʵ��
; ***************************************************************************
#include  <Excel.au3>
#include  <File.au3>

$sFilePath = @TempDir & "\Temp.xls"
If Not _FileCreate($sFilePath) Then ;����Ҫ���ӵ�.XLS�ļ�
	msgbox(4096, "Error", "Error Creating File -" & @error)
EndIf

_ExcelBookOpen($sFilePath)
$oExcel = _ExcelBookAttach("Microsoft Excel - Temp.xls", "Title") ;ʹ��$s_mode="Title" ==> ���ڱ���
_ExcelWriteCell($oExcel, "If you can read this, then Success!", 1, 1) ;д�뵥Ԫ��
msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookClose($oExcel, 1, 0) ;�÷���������Ȼ�����Ƿ�ı�����ʾ�ر��ļ�

