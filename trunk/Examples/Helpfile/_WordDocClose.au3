; *******************************************************
; ʾ�� - �����հ׵�word����, ��һ���Ѵ��ڵ��ļ�, �ر��ļ��˳�.
; *******************************************************
#include  <Word.au3>
$oWordApp = _WordCreate("")
$oDoc = _WordDocOpen($oWordApp, @ScriptDir & " \Test.doc ")
_WordDocClose($oDoc)
_WordQuit($oWordApp)

