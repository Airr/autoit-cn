$MyDocsFolder = "::{450D8FBA-AD25-11D0-98A8-0800361B1103}"

$var = FileSaveDialog( "ѡ���ļ�.", $MyDocsFolder, "�ű� (*.aut;*.au3)", 2)
; ѡ�� 2 = ������ ·��/�ļ�ѡ�� �ĶԻ���

If @error Then
	MsgBox(4096,"","û��ѡ��.")
Else
	MsgBox(4096,"","��ѡ���ˣ�" & $var)
EndIf


; ��ѡ����
$var = FileSaveDialog( "ѡ���ļ�.", $MyDocsFolder, "�ű� (*.aut;*.au3)|�ı��ļ� (*.ini;*.txt)", 2)
; ѡ�� 2 = ���� ·��/�ļ�ѡ�� �ĶԻ���

If @error Then
	MsgBox(4096,"","û��ѡ��.")
Else
	MsgBox(4096,"","��ѡ���ˣ�" & $var)
EndIf