#include <Date.au3>

; ʹ�� pc ��ʽ��ʾ��ǰ����/ʱ��
MsgBox(4096, "Pc Long format", _DateTimeFormat(_NowCalc(), 1))
MsgBox(4096, "Pc Short format", _DateTimeFormat(_NowCalc(), 2))
