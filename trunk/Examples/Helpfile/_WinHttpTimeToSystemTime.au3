#Include <WinHTTP.au3>
#Include <Array.au3>

; ��HTTP/1.0ʱ���ʽת��Ϊϵͳʱ���ʽ $time_array = _WinHttpTimeToSystemTime ( " Mon, 12 Jul 2010 20:42:16 GMT " )
_arraydisplay($time_array, "_WinHttpTimeToSystemTime() ")

