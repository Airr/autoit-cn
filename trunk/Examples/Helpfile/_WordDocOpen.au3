; *******************************************************
; ʾ�� 1 - ����һ���µ�Word���ڲ���һ���Ѿ����ڵ��ĵ�.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate("")
Local $oDoc = _WordDocOpen($oWordApp, @ScriptDir & "\Test.doc")
