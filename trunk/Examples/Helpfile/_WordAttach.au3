; *******************************************************
; ʾ�� 1 - ���ӵ��Ѵ� "Test.doc" �ļ��� Word ����,
;				Ȼ����ʾ���ĵ��������ļ�·��.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordAttach(@ScriptDir & "\Test.doc", "FileName")
If Not @error Then
	Local $oDoc = _WordDocGetCollection($oWordApp, 0)
	MsgBox(4160, "Document FileName", $oDoc.FullName)
EndIf

; *******************************************************
; ʾ�� 2 - ���ӵ��ĵ������к��� "The quick brown fox"
;               �ı��� Word ����
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordAttach("The quick brown fox", "Text")
