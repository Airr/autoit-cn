
; ***************************************************************
; ʾ�� - �򿪴��ڵĹ�����������������ʶ
; *****************************************************************

#include  <Excel.au3>

$sFilePath1 = @ScriptDir & "\Test1.xls" ;���ļ�Ӧ���Ѵ���
$oExcel = _ExcelBookOpen($sFilePath1)

If @error = 1 Then
	msgbox(0, "Error!", "Unable to Create the Excel Object")
	Exit
ElseIf @error = 2 Then
	msgbox(0, "Error!", "File does not exist - Shame on you!")
	Exit
EndIf

