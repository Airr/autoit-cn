; *******************************************************
; ʾ�� - ����һ���µ�Microsoft Word�ļ���,������"Test"����һ��
;        ��Ϊ"My Macro"�ĺ�, Ȼ�󲻱����˳�.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
_WordMacroRun($oWordApp, "My Macro", "Test")
_WordQuit($oWordApp, 0)
