
#include  <Date.au3>
; �������ڵ��ܵ�ISO�����0=��һ - 6=����
$iWeekday = _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)
; ��@Wday��ͬ
msgbox(4096, "", "Todays ISO WeekdayNumber is:" & $iWeekday)

