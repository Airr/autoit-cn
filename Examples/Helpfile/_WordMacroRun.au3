; *******************************************************
; ʾ�� 1 - ����һ���µ�Microsoft Word�ļ����򿪣������� "Test" ����һ��
;�0�2�0�2�0�2�0�2�0�2�0�2        ��Ϊ "My Macro" �ĺ�, Ȼ�󲻱����˳�.
; *******************************************************

#include <Word.au3>
$oWordApp = _WordCreate (@ScriptDir & "\Test.doc")
_WordMacroRun ($oWordApp, "My Macro", "Test")
_WordQuit ($oWordApp, 0)