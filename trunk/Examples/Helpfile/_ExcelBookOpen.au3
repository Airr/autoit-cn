; ***************************************************************
; ʾ�� 1 ��һ�����еĹ���������������ʶ��
; *****************************************************************

#include <Excel.au3>

$sFilePath1 = @ScriptDir & "\Test1.xls" ;����ļ�Ӧ���Ѿ�����
$oExcel = _ExcelBookOpen($sFilePath1)

If @error = 1 Then
	MsgBox(0, "����!", "�޷���������!")
	Exit
ElseIf @error = 2 Then
	MsgBox(0, "����!", "�ļ�������!")
	Exit
EndIf