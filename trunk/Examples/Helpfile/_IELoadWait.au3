; *******************************************************
; ʾ�� - ��AutoIt��̳ҳ, "View new posts"��ǩ, ���Ӳ���Enter������. Ȼ�����ƶ�ǰ�ȴ�ҳ��������.
; *******************************************************
;
#include  <IE.au3>
$oI = _IECreate(" http://www.autoitscript.com/forum/index.php ")
Send(" {TAB 12} ")
Send(" {ENTER} ")
_IELoadWait($oIE)

