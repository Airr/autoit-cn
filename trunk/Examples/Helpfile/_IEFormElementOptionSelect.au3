; *******************************************************
; ʾ�� 1 - �򿪺���ʾ���������, ��ȡ����������, ��ȡ
;				��ѡ��Ԫ�ص�����, ���� byValue, byText �� byIndex ѭ��ʮ�ν���ѡ��
;				ע��: ��������Ҫ���¹���ҳ�����鿴�����ı仯
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oSelect = _IEFormElementGetObjByName($oForm, "selectExample")
For $i = 1 To 10
	_IEFormElementOptionSelect($oSelect, "Freepage", 1, "byText")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "midipage.html", 1, "byValue")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 0, 1, "byIndex")
	Sleep(1000)
Next

; *******************************************************
; ʾ�� 2 - �򿪺���ʾ���������, ��ȡ����������, ��ȡ
;				��ѡ��Ķ��Ԫ�ص�����, ѭ�� 5 �ν���ѡ��Ȼ��ȡ��ѡ��
;				ѡ�� byValue, byText �� byIndex.
;				ע��: ��������Ҫ���¹���ҳ�����鿴�����ı仯
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
$oSelect = _IEFormElementGetObjByName($oForm, "multipleSelectExample")
For $i = 1 To 5
	_IEFormElementOptionSelect($oSelect, "Carlos", 1, "byText")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Name2", 1, "byValue")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 5, 1, "byIndex")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Carlos", 0, "byText")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Name2", 0, "byValue")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 5, 0, "byIndex")
	Sleep(1000)
Next

; *******************************************************
; ʾ�� 3 - �򿪺���ʾ���������, ��ȡ����������, ��ȡ
;				��ѡ���Ԫ�ص�����, ����Ƿ�ѡ���� "Freepage" ѡ�
;				������.  ���� index 0 ��
;				'midipage.html' ��ѡ��ֵ�ظ�����
;				ע��: ��������Ҫ���¹���ҳ�����鿴�����ı仯
; *******************************************************
;
#include <IE.au3>
$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
$oSelect = _IEFormElementGetObjByName($oForm, "selectExample")
If _IEFormElementOptionSelect($oSelect, "Freepage", -1, "byText") Then
	MsgBox(4096, "Option Selected", "Option Freepage is selected")
Else
	MsgBox(4096, "Option Selected", "Option Freepage is Not selected")
EndIf
If _IEFormElementOptionSelect($oSelect, 0, -1, "byIndex") Then
	MsgBox(4096, "Option Selected", "The First (index 0) option is selected")
Else
	MsgBox(4096, "Option Selected", "The First (index 0) option is Not selected")
EndIf
If _IEFormElementOptionSelect($oSelect, "midipage.html", -1, "byValue") Then
	MsgBox(4096, "Option Selected", "The option with value 'midipage.html' is selected")
Else
	MsgBox(4096, "Option Selected", "The option with value 'midipage.html' is NOT selected")
EndIf
