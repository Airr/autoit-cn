; *******************************************************
; ʾ�� 1 - �������ƻ�ȡ��ָ����������.  ����, �ύ��ѯ
;				���ȸ���������.  ע������ƺͱ�
;				Ԫ�ؿ��Բ鿴 HTML Դ�����ҵ�
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetObjByName($oIE, "f")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
