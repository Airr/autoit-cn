; *******************************************************
; ʾ�� - �򿪻���ʾ���������, ��ȡIDΪ"line1"��DIVԪ�صĶ��������.
;        ������Ԫ�ص�innerText��ʾ������̨.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjById($oIE, "line1")
ConsoleWrite(_IEPropertyGet($oDiv, "innertext") & @CRLF)
