; *******************************************************
; ʾ�� 1 - �򿪺�����ʾ���������, ��ȡ��
;				ID Ϊ "line1" �� DIV Ԫ�صĶ�������. ��ʾ��Ԫ�ص� innerText
;				������̨.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjById($oIE, "line1")
ConsoleWrite(_IEPropertyGet($oDiv, "innertext") & @CRLF)
