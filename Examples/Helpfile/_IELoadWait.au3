; *******************************************************
; ʾ�� 1 - �� AutoIt ��̳ҳ��, ʹ�� tab �� "View new posts"
;				���Ӳ��ûس�������.
;				Ȼ���ڼ���ǰ�ȴ�ҳ����ؽ���.
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com/forum/index.php")
Send("{TAB 12}")
Send("{ENTER}")
_IELoadWait($oIE)
