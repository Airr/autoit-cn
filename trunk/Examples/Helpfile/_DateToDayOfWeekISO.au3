#include <Date.au3>

; ָ�����ڵ� ISO ������� 0=����һ - 6=������
Local $iWeekday = _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)
; ��ͬ�� @Wday
MsgBox(4096, "", "Todays ISO WeekdayNumber is: " & $iWeekday)
