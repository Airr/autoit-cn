; *******************************************************
; ʾ�� - ��iFrameʾ��, ��ȡ��Ϊ"iFrameTwo"�Ĳ��滻��HTML
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" iframe ")
$oFrame = _IEFrameGetObjByName($oIE, "iFrameTwo ")
_IEBodyWriteHTML($oFrame, "Hello <b>iFrame!</b> ")
_IELoadWait($oFrame)

