FileCopy("C:\*.au3", "D:\mydir\*.*")

; ����һ���ļ��м�������
DirCreate("C:\new")
FileCopy("C:\old\*.*", "C:\new\")

FileCopy("C:\Temp\*.txt", "C:\Temp\TxtFiles\", 8)
; �ұߵ� 'TxtFiles' ��Ŀ��Ŀ¼,���ƹ�ȥ���ļ����ƺ�ԭʼ������ͬ.

FileCopy("C:\Temp\*.txt", "C:\Temp\TxtFiles\", 9) ; ��־ = 1 + 8 (���� + ����Ŀ��Ŀ¼�ṹ)
; ����TXT�ļ���Ŀ��Ŀ¼��,���Ŀ��Ŀ¼�������򴴽�.����ļ������򸲸�.
