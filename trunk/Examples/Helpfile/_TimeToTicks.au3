#include <Date.au3>

Global $Sec, $Min, $Hour, $Time
; ��ʱ�����
Local $StartTicks = _TimeToTicks(@HOUR, @MIN, @SEC)
; ����45�ֺ�
Local $EndTicks = $StartTicks + 45 * 60 * 1000
_TicksToTime($EndTicks, $Hour, $Min, $Sec)
MsgBox(262144, '', 'New Time:' & $Hour & ":" & $Min & ":" & $Sec)

