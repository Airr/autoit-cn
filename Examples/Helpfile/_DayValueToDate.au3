
#include  <Date.au3>

; �����������
$sJulDate = _DateToDayValue(@YEAR, @MON, @MDAY)
msgbox(4096, "", "Todays Julian date is:" & $sJulDate)

; 14��ǰ��
Dim $Y, $M, $D
$sJulDate = _DayValueToDate($sJulDate - 14, $Y, $M, $D)
msgbox(4096, "", "14 days ago:" & $M & "/" & $D & "/" & $Y & "  (" & $sJulDate & ")")

