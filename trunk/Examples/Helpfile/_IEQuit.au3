; *******************************************************
; �� 1 - ����һ�����ص����������, ������һ��
;				��վ, ��ȡһЩ��Ϣ���˳�
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://sourceforge.net", 0, 0)
; ��ʾ���ҳ����������"sfmarquee"Ԫ�ص�innerText
Local $oMarquee = _IEGetObjByName($oIE, "sfmarquee")
MsgBox(4096, "SourceForge ��Ϣ", $oMarquee.innerText)
_IEQuit($oIE)
