; *******************************************************
; ʾ�� 1 - �򿪺� "��" ʾ���������, ͨ������
;				��ȡ���ύ��ť�����ò� "���" ��. �����ύ
;				���ķ���������, ��Ϊ���������� JavaScript
;				��������ύ��ť�� "onClick" �¼�ʹ�� _IEFormSubmit()
;				������Ԥ��һ��ִ��
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oSubmit = _IEGetObjByName($oIE, "submitExample")
_IEAction($oSubmit, "click")
_IELoadWait($oIE)

; *******************************************************
; ʾ�� 2 - ��ͬʾ�� 1, ����ʹ�õ��, �������ý��㵽Ԫ����
;				Ȼ��ʹ�� ControlSend ���ͻس���������˵Ľű�
;				������������ʱʹ�����ַ�������ֹ�ؼ�
;				�Զ����ص����Ĵ���.
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oSubmit = _IEGetObjByName($oIE, "submitExample")
Local $hwnd = _IEPropertyGet($oIE, "hwnd")
_IEAction($oSubmit, "focus")
ControlSend($hwnd, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "{Enter}")

; �ȴ����洰��, Ȼ���� OK
WinWait("Windows Internet Explorer", "ExampleFormSubmitted")
ControlClick("Windows Internet Explorer", "ExampleFormSubmitted", "[CLASS:Button; TEXT:OK; Instance:1;]")
_IELoadWait($oIE)
