#include <String.au3>

; �������� "�ƶ���" �»��߲���ӡ���������̨
For $i = -20 To 20
	ConsoleWrite($i & @TAB & _StringInsert("Supercalifragilistic", "___", $i) & @CRLF)
Next
