_IEQuit������Ӧ����_IECreateEmbedded������Ƕ�������. ����������̽���������һ���GUI���ڹرն��ر�.


��� _IEAttach, _IECreate

ʾ��
; *******************************************************
; ʾ�� - ����һ�����ɼ������������, ���һ����ַ, ��ȡһЩ��Ϣ���˳�
; *******************************************************
#include <IE.au3>
$oIE = _IECreate(" http://sourceforge.net ", 0, 0)
; ��ʾ"sfmarquee"ҳ����һ��Ԫ���ϵ�innerTextage
$oMarquee = _IEGetObjByName($oIE, "sfmarquee ")
msgbox(0, "SourceForge Information ", $oMarquee .innerText)
_IEQuit($oIE)

