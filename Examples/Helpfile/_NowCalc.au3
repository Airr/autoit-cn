
#include  <Date.au3>

; ��EPOCH(1970/01/01 00:00:00)��ʼ���������
$iDateCalc = _DateDiff('s', "1970/01/01 00:00:00", _NowCalc())
msgbox(4096, "", "Number of seconds since EPOCH:" & $iDateCalc)

; ���㱾���Сʱ��
$iDateCalc = _DateDiff('h', @YEAR & "/01/01 00:00:00", _NowCalc())
msgbox(4096, "", "Number of Hours this year:" & $iDateCalc)


