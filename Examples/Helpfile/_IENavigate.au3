; *******************************************************
; ʾ�� 1 - ������������ڲ�������ĳ��վ��,
;				�ȴ� 5 ��󵼺�����һ��
;				�ȴ� 5 ��󵼺�����һ��
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("www.autoitscript.com")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php?")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php?showforum=9")

; *******************************************************
; ʾ�� 2 - ������������ڲ�������ĳ��վ��,
;				���ȴ�ҳ����ؽ������Ƶ���һ��
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("www.autoitscript.com", 0)
MsgBox(4096, "_IENavigate()", "This code executes immediately")
