; *******************************************************
; ʾ�� - �򿪴��л���ʾ���������, ��ȡ���Ӽ�, ѭ����Ŀ����ʾ������ӵ�ַ������
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" basic ")
$oLinks = _IELinkGetCollection($oIE)
$iNumLinks = @extended
msgbox(0, "Link Info ", $iNumLinks & " links found ")
For $oLink In $oLinks
	msgbox(0, "Link Info ", $oLink .href)
Next

