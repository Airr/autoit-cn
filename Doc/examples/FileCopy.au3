FileCopy("C:\*.au3", "D:\mydir\*.*")

; ����һ���ļ��м�������
DirCreate("C:\new")
FileCopy("C:\old\*.*", "C:\new\")

FileCopy("C:\Temp\*.txt", "C:\Temp\TxtFiles\", 8)
; ���ұߵ�'TxtFiles'�ǵ�ǰĿ��Ŀ¼�����ļ�������Դ��

FileCopy("C:\Temp\*.txt", "C:\Temp\TxtFiles\", 9) ; ��־ = 1 + 8 (�޸� + ����Ŀ��Ŀ¼�ṹ)
; ��Դ��Ŀ������ͬ�������޸ĸ��� txt �ļ�
