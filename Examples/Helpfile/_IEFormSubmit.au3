; *******************************************************
; ʾ�� 1 - �򿪴���ʾ���������, ��д���ֶβ��ύ
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! It works!")
_IEFormSubmit($oForm)

; *******************************************************
; ʾ�� 2 - ��ȡָ���������ò�����ֵ. 
;				������, ��Google���������ύ����
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.google.com")
$oForm = _IEFormGetObjByName($oIE, "f")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)

; *******************************************************
; ʾ�� 3 - ��ȡָ���������ò�����ֵ. 
;				��������ʱ�ֹ�����_IELoadWait.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.google.com")
$oForm = _IEFormGetObjByName($oIE, "f")
$oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm, 0)
_IELoadWait($oIE)
