; *******************************************************
; ʾ�� - �򿪴���iFrameʾ���������, 
;				��ȡ����Ϊ"iFrameTwo"�ĸ�����ܵ����ò��滻��HTML����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("iframe")
Local $oFrame = _IEFrameGetObjByName($oIE, "iFrameTwo")
_IEBodyWriteHTML($oFrame, "Hello <b>iFrame!</b>")
