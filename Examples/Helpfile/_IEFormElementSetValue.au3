; *******************************************************
; ʾ�� 1 - �򿪺���ʾ���������, �����ı���Ԫ�ص�ֵ
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! This works!")

; *******************************************************
; ʾ�� 2 - ��ȡ��ָ����Ԫ�ص����ò���������ֵ.
;				����, �ύ��ѯ���ȸ���������
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.google.com")
$oForm = _IEFormGetObjByName($oIE, "f")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)

; *******************************************************
; Example 3 - Set the value of an INPUT TYPE=TEXT element using Send()
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oInputFile = _IEFormElementGetObjByName($oForm, "textExample")

; �����뽹�㶨λ������ֶ�Ȼ�����ı��ַ���
_IEAction($oInputFile, "focus")

; Select existing content so it will be overwritten.
_IEAction($oInputFile, "selectall")

Send("This works")

; *******************************************************
; ʾ�� 4 - ���� INPUT TYPE=TEXT Ԫ�ص�ֵ
;				(���ڰ�ȫ���ƶ���ֹʹ�� _IEFormElementSetValue)
; *******************************************************
;
#include <IE.au3>

$oIE = _IE_Example("form")

; �����������������ʾ�����ı������ɼ�����
_IEAction($oIE, "invisible")

$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
$oInputFile = _IEFormElementGetObjByName($oForm, "textExample")

; �����뽹�㶨λ������ֶ�Ȼ�����ı��ַ���
_IEAction($oInputFile, "focus")

; Select existing content so it will be overwritten.
_IEAction($oInputFile, "selectall")

; Get a handle to the IE window.
Local $hIE = _IEPropertyGet($oIE, "hwnd")
ControlSend($hIE, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "This works")

MsgBox(4096, "Success", "Value set to 'This works'")
_IEAction($oIE, "visible")
