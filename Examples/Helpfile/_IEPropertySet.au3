; *******************************************************
; ʾ�� - ��һ����ʾ���������, �鿴��ַ���Ƿ�ɼ�, ����ɼ���ر�, ���ɼ����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
If Not _IEPropertyGet($oIE, "statusbar") Then _IEPropertySet($oIE, "statusbar", True)
_IEPropertySet($oIE, "statustext", "Look What I can Do")
Sleep(1000)
_IEPropertySet($oIE, "statustext", "I can change the status text")
