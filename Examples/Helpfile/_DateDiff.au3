#include <Date.au3>

; ����һ����Խ���ͺ������,(��1970/01/01 00:00:00) 
Local $iDateCalc = _DateDiff('s', "1970/01/01 00:00:00", _NowCalc())
MsgBox( 4096, "", "�����ڱȽϾ���������: " & $iDateCalc )

; ������꾭����Сʱ��
$iDateCalc = _DateDiff('h', @YEAR & "/01/01 00:00:00", _NowCalc())
MsgBox( 4096, "", "������꾭����Сʱ��: " & $iDateCalc )
