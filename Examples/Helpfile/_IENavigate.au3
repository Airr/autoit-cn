; *******************************************************
; ʾ��1 - ������������ڲ����һ����ַ, �ȴ�5��������һ��, �ٵȴ�5�������һ��
; *******************************************************
;
#include <IE.au3>
$oIE = _IECreate(" www.autoitscript.com ")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php? ")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php?showforum=9 ")

; *******************************************************
; ʾ��2 - ������������ڲ����һ����ַ, ���ƶ�����һ��ǰ���ȴ�ҳ��������
; *******************************************************
;
#include <IE.au3>
$oIE = _IECreate(" www.autoitscript.com ", 0)
msgbox(0, "_IENavigate() ", "This code executes immediately ")

