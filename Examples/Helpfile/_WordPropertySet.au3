; *******************************************************
; ʾ�� 1 - ����һ���µ�Microsoft Word�ļ����򿪣�����Word����, Ȼ����ʹ��ɼ�.
;
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Sleep(2000)
_WordPropertySet ($oWordApp, "visible", False);����
Sleep(2000)
_WordPropertySet ($oWordApp, "visible", True);��ʾ