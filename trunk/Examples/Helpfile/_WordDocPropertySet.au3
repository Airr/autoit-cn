; *******************************************************
; ʾ�� 1 - ����һ���µĿհ��ĵ�Word����, ��һ���ĵ�,
;				Ȼ�����ñ���,����,������������
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
_WordDocPropertySet($oDoc, "Title", "Test Title")
_WordDocPropertySet($oDoc, "Subject", "Test Subject")
_WordDocPropertySet($oDoc, "Author", "Test Author")
