
#AutoIt3Wrapper_Au3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include  <Timers.au3>

; ���/���̶�������10���ӳ��ڼ䱨�����ʱ��
Sleep(10 * 1000) ; 10��

Global $iIdleTime = _Timer_GetIdleTime()

msgbox(64, "_Timer_GetIdleTime", "Idle time =" & $iIdleTime & "ms")

