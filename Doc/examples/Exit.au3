;ʾ�� 1
Exit

;ʾ�� 2 
; �����ű�����������û���Ա���
If $CmdLine[0] = 0 Then Exit(1)

;ʾ�� 3 
; �򿪵�һ���������Ա���ָ�����ļ�
$file = FileOpen($CmdLine[1], 0)

; ����ļ������Ƿ�Ϊ��
If $file = -1 Then Exit(2)

; ����ļ��ǿյ� , ��ô�˳� (�ű������ǳɹ���)
$line = FileReadLine($file)
If @error = -1 Then Exit

;��������봦���ļ�
FileClose($file)
Exit ;����ǽű�������У����ǿ�ѡ���
