#include <Date.au3>

; ָ��������һ����ĳ�������
Local $iWeekday = _DateToDayOfWeek(@YEAR, @MON, @MDAY)
; Ӧ���൱�� @Wday
MsgBox(4096, "", "Todays WeekdayNumber is: " & $iWeekday)
MsgBox(4096, "", "Today is a : " & _DateDayOfWeek($iWeekday))
