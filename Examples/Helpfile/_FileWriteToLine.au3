#include <File.au3>
;ʾ��: д�뵽 c:\test.txt �ĵ����в�������
_FileWriteToLine("c:\test.txt", 3, "my replacement for line 3", 1)
;ʾ��: д�뵽 c:\test.txt �ĵ����е���������
_FileWriteToLine("c:\test.txt", 3, "my insertion", 0)