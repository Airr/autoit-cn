; *******************************************************
; ��ȡ����ָ���ı�������. ������, ��Google���������ύ��ѯ
; ע������Ƽ�ͨ��ҳ��HTMLԴ�ҵ��ı�Ԫ��
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetObjByName($oIE, "f")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
