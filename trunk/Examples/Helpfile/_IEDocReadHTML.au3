; *******************************************************
; ʾ�� 1 - �򿪺�����ʾ���������, ��ȡ HTML document
;				(���� <HEAD> �ͽű������� HTML) ����ʾ�� MsgBox
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $sHTML = _IEDocReadHTML($oIE)
MsgBox(4096, "Document Source", $sHTML)
