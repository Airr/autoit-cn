; *******************************************************
; ʾ�� 1 - �򿪺���ʾ���������, ��ȡ��
;				����Ϊ "ExampleForm" ��Ԫ�صĶ�������.  ��ʱ
;				�����ͬ��ʹ�� $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEGetObjByName($oIE, "ExampleForm")
