;�޸ĵ�ǰĿ¼������ .au3 �ļ�������Ϊ ֻ��+ϵͳ
If Not FileSetAttrib("*.au3", "+RS") Then
    MsgBox(4096,"����", "������������.")
EndIf

;�޸� C:\ Ŀ¼������Ŀ¼�е����� .bmp �ļ�������Ϊ��д+�浵
If Not FileSetAttrib("C:\*.bmp", "-R+A", 1) Then
    MsgBox(4096,"����", "������������.")
EndIf