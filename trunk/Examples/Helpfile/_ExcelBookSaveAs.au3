
; ***************************************************************
; ��1 - �򿪴��ڵĹ�����������������ʶ. Ȼ�����޾��������ʹ������������ļ�.
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

_ExcelBookSaveAs($oExcel, @ScriptDir & "\SaveAsʾ��", "xls")
If Not @error Then msgbox(0, "Success", "File was Saved!", 3)
_ExcelBookClose($oExcel, 1, 0) ;�˷������ڹر�ǰ�����ļ�, �������ļ��Ƿ����ı䶼��������ͨ����


; ***************************************************************
; ��2 - �򿪴��ڵĹ�����������������ʶ. ?Ȼ�����޾��������ʹ������������ļ�.
;       ���ļ�����ʱ����, ��ʹ�����뱣��. Ȼ����ļ���ʾ���뱣��
; *****************************************************************
#include  <Excel.au3>

$sFilePath1 = @ScriptDir & "\Test1.xls" ;���ļ�Ӧ���Ѵ���
$oExcel = _ExcelBookOpen($sFilePath1)

;��ʾ���ļ�ʱ���ܷ������κδ���
If @error = 1 Then
	msgbox(0, "Error!", "Unable to Create the Excel Object")
	Exit
ElseIf @error = 2 Then
	msgbox(0, "Error!", "File does not exist - Shame on you!")
	Exit
EndIf

_ExcelBookSaveAs($oExcel, @ScriptDir & "\SaveAsExample2", "xls", 0, 1, "ReadOnly") ;�����ļ�Ϊ'SaveAsExample2.xls"
If Not @error Then msgbox(0, "Success", "File was Saved!", 3)
_ExcelBookClose($oExcel, 1, 0) ;�˷������ڹر�ǰ�����ļ�, �������ļ��Ƿ����ı䶼��������ͨ����

$oExcel = _ExcelBookOpen(@ScriptDir & "\SaveAsExample2.xls", 1, False) ;����ǰ���ļ�����ʾ���뱣��

