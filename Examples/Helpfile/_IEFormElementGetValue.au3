; *******************************************************
; ʾ��1 -�򿪴��б�ʾ���������, ���ñ��ı�Ԫ�ص�ֵ, ��ȡ����ʾԪ�ص�ֵ
; *******************************************************
#include <IE.au3>
$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
$oText = _IEFormElementGetObjByName($oForm, "textExample")
$IEAu3Version = _IE_VersionInfo()
_IEFormElementSetValue($oText, $IEAu3Version[5])
msgbox(0, "Form Element Value", _IEFormElementGetValue($oText))

