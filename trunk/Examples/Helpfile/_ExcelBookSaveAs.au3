; ***************************************************************
; ʾ�� 1 - ��һ���µĹ���������������ʶ��, Ȼ����û���κ���ʾ������±�����ļ�.
; *****************************************************************

#include <Excel.au3>

Local $sFilePath1 = @ScriptDir & "\Test.xls" ;����ļ�Ӧ���Ѿ�����
Local $oExcel = _ExcelBookOpen($sFilePath1)

If @error = 1 Then
	MsgBox(4096, "����!", "�޷���������!")
	Exit
ElseIf @error = 2 Then
	MsgBox(4096, "����!", "�ļ�������!")
	Exit
EndIf

_ExcelBookSaveAs($oExcel, @TempDir & "\SaveAsExample", "xls");û���κ���ʾ������±���
If Not @error Then MsgBox(4096, "�ɹ�!", "�ļ��ѱ���!", 3)
_ExcelBookClose($oExcel, 1, 0) ;��û���κ���ʾ������±�����ļ���Ȼ��ر�.


; ***************************************************************
; ʾ�� 2 - ��һ���µĹ���������������ʶ��, Ȼ����û���κ���ʾ������±�����ļ�.
;				����ļ������򸲸���, ��ʹ������ѡ����ļ�. Ȼ�������������ļ�������ʾ���뱣��.
; *****************************************************************

#include <Excel.au3>

$sFilePath1 = @ScriptDir & "\Test.xls" ;����ļ�Ӧ���Ѿ�����
$oExcel = _ExcelBookOpen($sFilePath1)

;��ʾ���ļ�ʱ���ܷ����Ĵ�����ʾ
If @error = 1 Then
	MsgBox(4096, "����!", "�޷���������!")
	Exit
ElseIf @error = 2 Then
	MsgBox(4096, "����!", "�ļ�������!")
	Exit
EndIf

_ExcelBookSaveAs($oExcel, @TempDir & "\SaveAsExample2", "xls", 0, 1, "ReadOnly") ;����Ϊ"SaveAsExample2.xls"�ļ�
If Not @error Then MsgBox(4096, "�ɹ�!", "File was Saved!", 3)
_ExcelBookClose($oExcel, 1, 0) ;��û���κ���ʾ������±�����ļ���Ȼ��ر�.

$oExcel = _ExcelBookOpen(@TempDir & "\SaveAsExample2.xls", 1, False) ;������������ļ�������ʾ���뱣��