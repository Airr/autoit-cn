; *******************************************************
; ʾ�� 1 - ��� _WordErrorNotify �ĵ�ǰ״̬, ���״̬Ϊ����ر�,���״̬Ϊ�ر����
; *******************************************************
;
#include <Word.au3>

If _WordErrorNotify() Then
	MsgBox(4096, "_WordErrorNotify ״̬", "״̬Ϊ��, �ر���.")
	_WordErrorNotify(1)
Else
	MsgBox(4096, "_WordErrorNotify ״̬", "״̬Ϊ�ر�, ����.")
	_WordErrorNotify(0)
EndIf