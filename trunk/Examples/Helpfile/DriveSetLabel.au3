;�õ���ǰ���
Local $var=DriveGetLabel("c:\")
;���þ��
DriveSetLabel("C:\", "�¾��")
MsgBox(32,"","���������")
DriveSetLabel("C:\", $var)
