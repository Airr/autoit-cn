#include<String.au3>
; �������� "�ƶ���" �»��߲���ӡ���������̨
For $i_loop = -20 To 20
	ConsoleWrite($i_loop & @TAB & _StringInsert("Supercalifragilistic", "___", $i_loop) & @CRLF)
Next
