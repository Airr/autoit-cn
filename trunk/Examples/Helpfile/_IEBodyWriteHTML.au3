; *******************************************************
; ʾ�� 1 - �򿪺� iFrame ʾ���������, ͨ��
;				"iFrameTwo" �����ƻ�ȡ�� iFrame �����ò��滻�� HTML ����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("iframe")
Local $oFrame = _IEFrameGetObjByName($oIE, "iFrameTwo")
_IEBodyWriteHTML($oFrame, "Hello <b>iFrame!</b>")
