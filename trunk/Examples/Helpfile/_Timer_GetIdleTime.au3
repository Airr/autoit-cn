#include <Timers.au3>

; ���� 10 �������/���̵Ĳ������ı䱨��Ŀ���ʱ��
Sleep(10 * 1000); 10��

Global $iIdleTime = _Timer_GetIdleTime()

MsgBox(4160, "_Timer_GetIdleTime", "Idle time = " & $iIdleTime & "ms")
