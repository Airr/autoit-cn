; *******************************************************
; ʾ�� 1 - ��� _WordErrorNotify �ĵ�ǰ״̬, ���״̬Ϊ����ر�,���״̬Ϊ�ر����
; *******************************************************
;
#include <Word.au3>
If _WordErrorNotify () Then
	MsgBox(0, "_WordErrorNotify ״̬", "״̬Ϊ��, �ر���.")
	_WordErrorNotify (1)
Else
	MsgBox(0, "_WordErrorNotify ״̬", "״̬Ϊ�ر�, ����.")
	_WordErrorNotify (0)
EndIf