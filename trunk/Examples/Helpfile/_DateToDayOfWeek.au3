
#include  <Date.au3>

; �������ڵ��ܵ������
$iWeekday = _DateToDayOfWeek(@YEAR, @MON, @MDAY)
; ��@Wday��ͬ
msgbox(4096, "", "Todays WeekdayNumber is:" & $iWeekday)
msgbox(4096, "", "Today is a :" & _DateDayOfWeek($iWeekday))

