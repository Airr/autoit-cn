FileMove("C:\foo.au3", "D:\mydir\bak.au3")

; �ڶ�������:
;   ʹ�ñ�־ '1'(����) �� '8' (�Զ�����Ŀ��Ŀ¼�ṹ)
;   ����ʱ�ļ������ƶ����е� txt �ļ��� txtfiles Ŀ¼,����Ԥ�ȼ��
;   Ŀ��Ŀ¼�ṹ�Ƿ����, ��������ھ��Զ�����.
FileMove(@TempDir & "\*.txt", @TempDir & "\TxtFiles\", 9)
