#include  <File.au3>
; ʾ��: �滻д�뵽c:\test.txt������
_FileWriteToLine(" c:\test.txt ", 3, "my replacement for line 3 ", 1)
; ʾ��: ���滻д�뵽c:\test.txt������
_FileWriteToLine(" c:\test.txt ", 3, "my insertion ", 0)

