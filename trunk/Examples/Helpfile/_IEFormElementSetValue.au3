


��� _IEFormElementGetValue, _IEFormElementGetCollection, _IEFormElementGetObjByName, _IEFormElementOptionSelect, _IEFormElementCheckboxSelect, _IEFormElementRadioSelect

ʾ��
; *******************************************************
; ʾ��1 - �򿪴��б�ʾ���������, ���ñ��ı�Ԫ�ص�ֵ
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oForm = _IEFormGetObjByName($oIE, "ʾ��Form ")
$oText = _IEFormElementGetObjByName($oForm, "text Example ")
_IEFormElementSetValue($oText, "Hey! This works! ")

; *******************************************************
; ʾ��2 - ��ȡָ����Ԫ�ص����ò�������ֵ. ������, ��Google���������ύ��ѯ.
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.google.com ")
$oForm = _IEFormGetObjByName($oIE, "f ")
$oQuery = _IEFormElementGetObjByName($oForm, "q ")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3 ")
_IEFormSubmit($oForm)

; *******************************************************
; ʾ��3 - ��¼��Hotmail
; *******************************************************
#include  <IE.au3>
; ������������ڲ����hotmail
$oIE = _IECreate(" http://www.hotmail.com ")

; ��ȡ��¼�����û���, ���뼰��������ָ��
$o_form = _IEFormGetObjByName($oIE, "f1 ")
$o_login = _IEFormElementGetObjByName($o_form, "login ")
$o_password = _IEFormElementGetObjByName($o_form, "passwd ")
$o_signin = _IEFormElementGetObjByName($o_form, "SI ")

$username = " your username here "
$password = " your password here "

; �����ֶ�ֵ���ύ
_IEFormElementSetValue($o_login, $username)
_IEFormElementSetValue($o_password, $password)
_IEAction($o_signin, "click ")

; *******************************************************
; ʾ�� 4 - ����<INPUT TYPE=FILE>Ԫ�ص�ֵ(��ȫ������ֹʹ��_IEFormElementSetValue)
; *******************************************************
#include  <IE.au3>

$oIE = _IE_Example(" form ")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm ")
$oInputFile = _IEFormElementGetObjByName($oForm, "fileExample ")

; �����뽹����䵽�ֶβ������ı���
_IEAction($oInputFile, "focus ")
Send(" C:\myfile.txt ")

; *******************************************************
; ʾ��5 - ����<INPUT TYPE=FILE>Ԫ�ص�ֵ, ��ǰ����ͬ, �����ش���(��ȫ������ֹʹ��_IEFormElementSetValue)
; *******************************************************
#include  <IE.au3>

$oIE = _IE_Example(" form ")

; ���������������ʾ�򲻿ɼ����ڷ����ı�
_IEAction($oIE, "invisible ")

$oForm = _IEFormGetObjByName($oIE, "ExampleForm ")
$oInputFile = _IEFormElementGetObjByName($oForm, "fileExample ")

; �����뽹����䵽�ֶβ������ı���
_IEAction($oInputFile, "focus ")
$hIE = _IEPropertyGet($oIE, "hwnd ")
ControlSend($hIE, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "C:\myfile.txt ")

msgbox(0, "Success", "Value set to C:\myfile.txt ")
_IEAction($oIE, "visible ")

