; *******************************************************
; ʾ�� - ��һ���Ѵ��ڵ�word�ĵ�, ���һЩ�ı�, Ȼ�󱣴沢�˳�.
; *******************************************************
#include  <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & " \Test.doc ")
$oDoc = _WordDocGetCollection($oWordApp ", 0 )
$oDoc.Range.insertAfter(" This is some text to insert. ")
_WordDocSave($oDoc)
_WordQuit($oWordApp)

