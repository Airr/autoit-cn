; *******************************************************
; ʾ�� - ��һ����ʾ���������, �鿴��ַ���Ƿ�ɼ�, ����ɼ���ر�, ���ɼ����
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example("basic")
If _IEPropertyGet($oIE, "addressbar") Then
	msgbox(0, "AddressBar Status", "AddressBar Visible, turning it off")
	_IEPropertySet($oIE, "addressbar", False)
Else
	msgbox(0, "AddressBar Status", "AddressBar Invisible, turning it on")
	_IEPropertySet($oIE, "addressbar", True)
EndIf

