; *******************************************************
; ʾ�� 1 - �򿪺�����ʾ���������, ���
;				��ַ���Ƿ�ɼ�, ����ɼ�����������, ����������ʾ
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
If _IEPropertyGet($oIE, "addressbar") Then
	MsgBox(4096, "AddressBar Status", "AddressBar Visible, turning it off")
	_IEPropertySet($oIE, "addressbar", False)
Else
	MsgBox(4096, "AddressBar Status", "AddressBar Invisible, turning it on")
	_IEPropertySet($oIE, "addressbar", True)
EndIf

; *******************************************************
; ʾ�� 2 - �򿪺���ʾ�������������ȡ��
;				���ı�����Ԫ�ص�����.  ��ȡ�ı����������ͳߴ�,
;				�����������������β��ƶ�������
; *******************************************************

$oIE = _IE_Example("form")

Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oTextArea = _IEFormElementGetObjByName($oForm, "textareaExample")

; ��ȡ�ı����������ͳߴ�
Local $iScreenX = _IEPropertyGet($oTextArea, "screenx")
Local $iScreenY = _IEPropertyGet($oTextArea, "screeny")
Local $iBrowserX = _IEPropertyGet($oTextArea, "browserx")
Local $iBrowserY = _IEPropertyGet($oTextArea, "browserY")
Local $iWidth = _IEPropertyGet($oTextArea, "width")
Local $iHeight = _IEPropertyGet($oTextArea, "height")

; �����������������β��ƶ�������
MouseMove($iScreenX, $iScreenY)
MouseMove($iScreenX + $iWidth, $iScreenY)
MouseMove($iScreenX + $iWidth, $iScreenY + $iHeight)
MouseMove($iScreenX, $iScreenY + $iHeight)
MouseMove($iScreenX, $iScreenY)
MouseMove($iScreenX + $iWidth / 2, $iScreenY + $iHeight / 2)
