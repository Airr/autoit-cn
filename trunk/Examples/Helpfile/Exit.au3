;ʾ�� 1
Exit

;ʾ�� 2 
; �����ű�: û�������в���
If $CmdLine[0] = 0 Then Exit(1)

;ʾ�� 3 
; �򿪵�һ�����в�����ָ�����ļ�
$file = FileOpen($CmdLine[1], 0)

; ����ļ��Ƿ�ɶ�
If $file = -1 Then Exit(2)

; ����ļ�Ϊ�յ�,�ű��˳�.(�ű������ǳɹ���)
$line = FileReadLine($file)
If @error = -1 Then Exit

;����������ļ��������
FileClose($file)
Exit ;����ǽű������һ��,���Ϳ��п���.
