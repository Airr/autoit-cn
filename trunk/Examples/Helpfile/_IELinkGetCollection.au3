; *******************************************************
; ʾ�� 1 - �򿪺�����ʾ���������, ��ȡ���Ӽ���,
;				ѭ�����е�ÿ���ʾ������ URL ����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oLinks = _IELinkGetCollection($oIE)
Local $iNumLinks = @extended
MsgBox(4096, "Link Info", $iNumLinks & " links found")
For $oLink In $oLinks
	MsgBox(4096, "Link Info", $oLink.href)
Next
