; *******************************************************
; ��ȡ����ָ���ı�������. ������, ��Google���������ύ��ѯ
; ע������Ƽ�ͨ��ҳ��HTMLԴ�ҵ��ı�Ԫ��
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.google.com ")
$oForm = _IEFormGetObjByName($oIE, "f ")
$oQuery = _IEFormElementGetObjByName($oForm, "q ")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3 ")
_IEFormSubmit($oForm)

