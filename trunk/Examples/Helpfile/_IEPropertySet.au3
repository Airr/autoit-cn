; *******************************************************
; ʾ�� 1 - �򿪺�����ʾ���������, ���
;				��ַ���Ƿ�ɼ�, ���û����������ʾ. Ȼ��ı�
;				״̬������ʾ���ı�
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
If Not _IEPropertyGet($oIE, "statusbar") Then _IEPropertySet($oIE, "statusbar", True)
_IEPropertySet($oIE, "statustext", "Look What I can Do")
Sleep(1000)
_IEPropertySet($oIE, "statustext", "I can change the status text")
