Local $MyDocsFolder = "::{450D8FBA-AD25-11D0-98A8-0800361B1103}"

Local $var = FileSaveDialog( "����һ������.", $MyDocsFolder, "AU3�ű����ı� (*.txt;*.au3)", 2)
; ѡ�� 2 = ����ѡ��һ����Ч��·��/�ļ�,���߰���ȡ����ť,�Ի����ܹر�.

If @error Then
	MsgBox(4096,"","��ȡ������.")
Else
	MsgBox(4096,"","�㱣��Ϊ��:" & $var)
EndIf


; ����ɸѡѡ��
$var = FileSaveDialog( "����һ������.", $MyDocsFolder, "AU3�ű� (*.au3)|�ı��ļ� (*.ini;*.txt)", 2)
; ѡ�� 2 = ����ѡ��һ����Ч��·��/�ļ�,���߰���ȡ����ť,�Ի����ܹر�.

If @error Then
	MsgBox(4096,"","��ȡ������.")
Else
	MsgBox(4096,"","�㱣��Ϊ��:" & $var)
EndIf