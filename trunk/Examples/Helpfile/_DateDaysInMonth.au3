#include <Date.au3>

$iDays = _DateDaysInMonth( @YEAR,@MON )
MsgBox( 4096, "һ���µ�����", "����¹��� " & String( $iDays ) & " ��." )
