
#include  <Date.au3>

; �����5��
$sNewDate = _DateAdd('d', 5, _NowCalcDate())
msgbox(4096, "", "Today + 5 days:" & $sNewDate)

; �����2��
$sNewDate = _DateAdd('w', -2, _NowCalcDate())
msgbox(4096, "", "Today minus 2 weeks:" & $sNewDate)

; ��ǰʱ���15��
$sNewDate = _DateAdd('n', 15, _NowCalc())
msgbox(4096, "", "Current time +15 minutes:" & $sNewDate)

; �ɷ��ش�1970/01/01 00:00:00��������ļ������¼���־����
$sNewDate = _DateAdd('s', 1087497645, "1970/01/01 00:00:00")
msgbox(4096, "", "Date:" & $sNewDate)

