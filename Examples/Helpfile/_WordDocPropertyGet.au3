; *******************************************************
; ʾ�� 1 - ����word����, ���ĵ�, Ȼ���ȡ��������ȡ���п�������
; *******************************************************
#include <Word.au3>
#include <Array.au3>
Dim $aProp
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
$oDoc = _WordDocGetCollection($oWordApp, 0)
For $i = 1 To 30
	_ArrayAdd($aProp, _WordDocPropertyGet($oDoc, $i))
Next
_ArrayDisplay($aProp)

; *******************************************************
; ʾ��2 - ����word����, ���ĵ�, Ȼ���ȡ���⣬�����������
; *******************************************************
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
$oDoc = _WordDocGetCollection($oWordApp, 0)
msgbox(4096, '', "Title -" & _WordDocPropertyGet($oDoc, "Title") & @CRLF & _
		"Subject -" & _WordDocPropertyGet($oDoc, "Subject") & @CRLF & _
		"Author -" & _WordDocPropertyGet($oDoc, "Author"))

