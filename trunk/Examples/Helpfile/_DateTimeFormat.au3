
#include  <Date.au3>

; ��PC��ʽ��ʾ��ǰ������/ʱ��
msgbox(4096, "Pc Long format", _DateTimeFormat( _NowCalc(), 1))
msgbox(4096, "Pc Short format", _DateTimeFormat( _NowCalc(), 2))

