; *******************************************************
; ���� 1 - ����һ���µ�Microsoft Word�ļ�����(�����ɹ����Զ����浽��Ӧ·��)
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate (@ScriptDir & "\Test.doc")

; *******************************************************
; ���� 2 - ���Ը��ӵ�һ���Ѵ��ڵ�word����
;               ����ļ������ڣ�����һ���µ�Microsoft Word�ļ�����.
; *******************************************************
;���Ը��ӵ�һ���Ѵ��ڵ�word����
#include <Word.au3>
$oWordApp = _WordCreate (@ScriptDir & "\Test.doc", 1)
; Check @extended return value to see if attach was successful
If @extended Then
	MsgBox(0, "���ӳɹ�", "���ӵ����еĴ���")
Else
	MsgBox(0, "����ʧ��", "�����´���")
EndIf

; *******************************************************
; ���� 3 - ����һ����Microsoft Word�ļ�����
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate ()

; *******************************************************
;���� 4 -����һ���µ�Microsoft Word�ļ�����(ָ������Ϊ����״̬)��
;            ׷��һЩ�ı���Ȼ�󱣴�����˳�.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate (@ScriptDir & "\Test.doc", 0, 0)
$oDoc = _WordDocGetCollection ($oWordApp, 0)
$oDoc.Range.insertAfter ("����׷�ӵ��ı�����.")
_WordQuit ($oWordApp, -1)