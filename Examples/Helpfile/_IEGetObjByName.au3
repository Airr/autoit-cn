; *******************************************************
; ʾ�� - �򿪴��б�ʾ���������, ��ȡ����Ϊ"Example Form"��Ԫ�صĶ��������.
;     �ڴ�����½����ʹ��$oForm = _IEFormGetObjByName($oIE, "Example Form")��ͬ
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEGetObjByName($oIE, "ExampleForm")
