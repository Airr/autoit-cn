
; **********************************************************
; ����һ��word����, ��һ���ĵ�, ���ش���, Ȼ����ʹ��ɼ�.
; **********************************************************
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & " \Test.doc ")
Sleep(2000)
_WordPropertySet($oWordApp, "visible ", False)
Sleep(2000)
_WordPropertySet($oWordApp, "visible ", True)

