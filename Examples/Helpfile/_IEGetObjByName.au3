; *******************************************************
; ʾ�� - �򿪴��б�ʾ���������, ��ȡ����Ϊ"Example Form"��Ԫ�صĶ��������.
;     �ڴ�����½����ʹ��$oForm = _IEFormGetObjByName($oIE, "Example Form")��ͬ
; *******************************************************
#include <IE.au3>
$oIE = _IE_Example(" form ")
$oForm = _IEGetObjByName($oIE, "Example Form ")

