; ��һ������:
FileWrite("c:\test.txt","���Բ���")
FileMove("c:\test.txt", @DesktopDir & "\AU3_����.au3")

; �ڶ�������:
;   ʹ�ñ�־ '1'(����) �� '8' (�Զ�����Ŀ��Ŀ¼�ṹ)
;   ����ʱ�ļ������ƶ����е� txt �ļ��� txtfiles Ŀ¼,����Ԥ�ȼ��
;   Ŀ��Ŀ¼�ṹ�Ƿ����, ��������ھ��Զ�����.
FileMove(@TempDir & "\*.txt", @TempDir & "\TxtFiles\", 9)
MsgBox(32,"","������ʱ�ļ����µ��ı��ļ��Ѿ��ƶ�������ʱĿ¼�����TxtFiles�ļ�������")
DirRemove(@TempDir & "\TxtFiles\",1)