; *******************************************************
; ʾ�� - �����հ׵�word����, 
;				��һ���Ѵ��ڵ��ļ�, �ر��ļ��˳�.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate("")
Local $oDoc = _WordDocOpen($oWordApp, @ScriptDir & "\Test.doc")
_WordDocClose($oDoc)
_WordQuit($oWordApp)
