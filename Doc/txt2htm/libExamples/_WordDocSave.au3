; *******************************************************
; ʾ�� 1 - ����һ���µ�Microsoft Word�ļ�����,׷��һЩ�ı�,Ȼ�󱣴�����˳�.
;
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)

Sleep(3500);�ӳ��Ա�۲�仯
$oDoc.Range.insertAfter ("����׷�ӵ��ı�����.")
Sleep(3500);�ӳ��Ա�۲�仯

_WordDocSave($oDoc)
_WordQuit($oWordApp)
