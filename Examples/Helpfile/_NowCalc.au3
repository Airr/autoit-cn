#include <Date.au3>

; ����� EPOCH (1970/01/01 00:00:00) ��ʼ�������
Local $iDateCalc = _DateDiff('s', "1970/01/01 00:00:00", _NowCalc())
MsgBox(4096, "", "Number of seconds since EPOCH: " & $iDateCalc)

; ������������Сʱ��
$iDateCalc = _DateDiff('h', @YEAR & "/01/01 00:00:00", _NowCalc())
MsgBox(4096, "", "Number of Hours this year: " & $iDateCalc)
