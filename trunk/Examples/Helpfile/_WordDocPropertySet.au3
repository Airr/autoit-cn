
;
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; ʾ�� - ����word����, ���ĵ�, Ȼ�����ñ��⣬��Ŀ����������
;
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
;
#include  <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
$oDoc = _WordDocGetCollection($oWordApp, 0)
_WordDocPropertySet($oDoc, "Title", "Test Title")
_WordDocPropertySet($oDoc, "Subject", "Test
Subject" )
_WordDocPropertySet($oDoc, "Author", "Test Author")

