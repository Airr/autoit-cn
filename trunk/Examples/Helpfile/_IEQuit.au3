; *******************************************************
; �� 1 - ����һ�����ص����������, ������һ��
;				��վ, ��ȡһЩ��Ϣ���˳�
; *******************************************************
;
#include <IE.au3>
$oIE = _IECreate ("http://sourceforge.net", 0, 0)
; ��ʾ���ҳ����������"sfmarquee"Ԫ�ص�innerText
$oMarquee = _IEGetObjByName ($oIE, "sfmarquee")
MsgBox(0, "SourceForge ��Ϣ", $oMarquee.innerText)
_IEQuit ($oIE)