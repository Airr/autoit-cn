; ***************************************************************
; ʾ�� 1 ��һ�����еĹ���������������ʶ��
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