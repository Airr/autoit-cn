#include <Date.au3>
;#include <ACN_Date.au3>	;���Ҫʹ�����ĵ��������ƻ�����������ʹ����� #include
; ���س���
$sLongDayName = _DateDayOfWeek( @WDAY )

; ���ض���
$sShortDayName = _DateDayOfWeek( @WDAY, 1 )

MsgBox( 4096, "һ���е�һ��", "������: " & $sLongDayName & " (" & $sShortDayName & ")" )
