; *******************************************************
; ʾ�� - ����ʾAutoIt��ҳ�����������, ��ȡ�ĵ���������ò���ʾ�ĵ�����
; *******************************************************
#include <IE.au3>
$oIE = _IECreate(" www.autoitscript.com ")
$oDoc = _IEDocGetObj($oIE)
msgbox(0, "Document Created Date ", $oDoc .fileCreateDate)

