;�޸ĵ�ǰĿ¼��ȫ��.au 3�ļ�����Ϊֻ����ϵͳ�ļ�
If Not FileSetAttrib("*.au3", "+RS") Then
    MsgBox(4096,"����", "������������.")
EndIf

;�޸� C:\ Ŀ¼��ȫ��.bmp�ļ�����Ϊ��д��浵
If Not FileSetAttrib("C:\*.bmp", "-R+A", 1) Then
    MsgBox(4096,"����", "������������.")
EndIf