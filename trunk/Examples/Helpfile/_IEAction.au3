; *******************************************************
; ʾ��1 - �򿪴���"��"ʾ���������,  ͨ�����ƻ�ȡ�ύ��ť��
;    ���ò�"���". ���ύ���ķ�������������һЩ������ӦJavaScript���������
;    "onClick"�¼����޷���Ԥ��ִ��_IEFormSubmit()
; *******************************************************
;
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oSubmit = _IEGetObjByName($oIE, "submit Example ")
_IEAction($oSubmit, "click ")
_IELoadWait($oIE)

; *******************************************************
; ʾ��2 - ��ʾ��1��ͬ, ��ͨ������Ԫ�ؽ��㲢ʹ��ControlSend����Enter������.
;    ;����������ص�������˽ű���ֹ�ؼ��Զ����ص����������ʱʹ�ô˷���.
; *******************************************************
;
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oSubmit = _IEGetObjByName($oIE, "submit Example ")
$hwnd = _IEPropertyGet($oIE, "hwnd ")
_IEAction($oSubmit, "focus ")
ControlSend($hwnd, "", "[CLASS:Internet Explorer_Server; INSTANCE:1] ", "{Enter} ")

; �ȴ����洰��, Ȼ����OK
WinWait(" Windows Internet Explorer ", "Example FormSubmitted ")
ControlClick(" Windows Internet Explorer ", "Example FormSubmitted ", "[CLASS:Button; TEXT:OK; Instance:1;] ")
_IELoadWait($oIE)

