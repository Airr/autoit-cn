; *******************************************************
; ʾ�� 1 - �򿪺���ʾ���������, ����
;				�ı���Ԫ�ص�ֵ, ��ȡ����ʾԪ�ص�ֵ
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
Local $IEAu3Version = _IE_VersionInfo()
_IEFormElementSetValue($oText, $IEAu3Version[5])
MsgBox(4096, "Form Element Value", _IEFormElementGetValue($oText))
