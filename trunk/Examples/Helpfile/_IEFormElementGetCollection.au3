; *******************************************************
; ʾ�� - ��ȡ0��������ָ����Ԫ�ص�����. ������, ��Google���������ύ��ѯ
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.google.com ")
$oForm = _IEFormGetCollection($oIE, 0)
$oQuery = _IEFormElementGetCollection($oForm, 1)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3 ")
_IEFormSubmit($oForm)

