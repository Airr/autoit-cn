; *******************************************************
; ʾ�� 1 - ���� word ����, ���ĵ�,
;				Ȼ�����������ȡ������Ч���ĵ�����
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
For $i = 1 To 30
	ConsoleWrite("Property Index " & $i & " - " & _WordDocPropertyGet($oDoc, $i) & @CR)
Next

; *******************************************************
; ʾ�� 2 - ���� word ����, ���ĵ�,
;				Ȼ��������ƶ�ȡ����, �������������.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
$oDoc = _WordDocGetCollection($oWordApp, 0)
ConsoleWrite("Title - " & _WordDocPropertyGet($oDoc, "Title") & @CRLF)
ConsoleWrite("Subject - " & _WordDocPropertyGet($oDoc, "Subject") & @CRLF)
ConsoleWrite("Author - " & _WordDocPropertyGet($oDoc, "Author") & @CRLF)
