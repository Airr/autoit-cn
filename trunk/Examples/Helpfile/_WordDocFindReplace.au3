; *******************************************************
; ʾ�� 1 - ���� word ����, ���ĵ�, ���� "this",
;				�� "THIS" �滻����ƥ��, �������޸��˳�.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
Local $oFind = _WordDocFindReplace($oDoc, "this", "THIS")
If $oFind Then
	MsgBox(4096, "FindReplace", "Found and replaced.")
Else
	MsgBox(4096, "FindReplace", "Not Found")
EndIf
_WordQuit($oWordApp, 0)
