; *******************************************************
; ʾ��1 - �򿪴��б�ʾ���������, ��ȡ��������, ��ȡѡ��Ԫ�ص�����, ѭ��10��ͨ��ֵ�ı�������ѡ��ѡ��
;    ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ��
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oForm = _IEFormGetObjByName($oIE, "Example Form ")
$oSelect = _IEFormElementGetObjByName($oForm, "select Example ")
For $i = 1 To 10
	_IEFormElementOptionSelect($oSelect, "Freepage ", 1, "byText ")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "midipage.html ", 1, "byValue ")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 0, 1, "byIndex ")
	Sleep(1000)
Next

; *******************************************************
; ʾ��2 - �򿪴��б�ʾ���������, ��ȡ��������, ��ȡѡ���Ķ��Ԫ�ص�����, ѭ��5��ͨ��ֵ, �ı�������ѡ��ѡ��ѡ����ѡ
;    ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ��
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oForm = _IEFormGetObjByName($oIE, "Example Form ")
$oSelect = _IEFormElementGetObjByName($oForm, "multipleSelect Example ")
For $i = 1 To 5
	_IEFormElementOptionSelect($oSelect, "Carlos ", 1, "byText ")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Name2 ", 1, "byValue ")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 5, 1, "byIndex ")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Carlos ", 0, "byText ")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Name2 ", 0, "byValue ")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 5, 0, "byIndex ")
	Sleep(1000)
Next

; *******************************************************
; ʾ��3 - �򿪴��б�ʾ���������, ��ȡ��������, ��ȡѡ��Ԫ�ص�����, �鿴�Ƿ�ѡ��ѡ��"Freepage "
;   ��������. �ظ�����Ϊ0��ѡ���ֵΪ'midipage.html'��ѡ��
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oForm = _IEFormGetObjByName($oIE, "Example Form ")
$oSelect = _IEFormElementGetObjByName($oForm, "select Example ")
If _IEFormElementOptionSelect($oSelect, "Freepage ", -1, "byText ") Then
	msgbox(0, "Option Selected ", "Option Freepage is selected ")
Else
	msgbox(0, "Option Selected ", "Option Freepage is Not selected ")
EndIf
If _IEFormElementOptionSelect($oSelect, 0, -1, "byIndex ") Then
	msgbox(0, "Option Selected ", "The First (index 0) option is selected ")
Else
	msgbox(0, "Option Selected ", "The First (index 0) option is Not selected ")
EndIf
If _IEFormElementOptionSelect($oSelect, "midipage.html ", -1, "byValue ") Then
	msgbox(0, "Option Selected ", "The option with value 'midipage.html' is selected ")
Else
	msgbox(0, "Option Selected ", "The option with value 'midipage.html' is NOT selected ")
EndIf

