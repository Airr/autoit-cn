; *******************************************************
; ʾ�� 1 - �������µĿ��ĵ��� word ����,
;				�������, Ȼ���ȡ���Ӽ���.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate()
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
_WordDocAddLink($oDoc, "", "www.AutoIt3.com", "", "AutoIt" & @CRLF, "Link to AutoIt")
Local $oLinks = _WordDocLinkGetCollection($oDoc)
MsgBox(4096, "Link Count", @extended)
