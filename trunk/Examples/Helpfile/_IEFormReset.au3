; *******************************************************
; ʾ�� - �򿪴��б�ʾ���������, 
;				��������������ΪĬ��ֵ
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! It works!")
_IEFormReset($oForm)
