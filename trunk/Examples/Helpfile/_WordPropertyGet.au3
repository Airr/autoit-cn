; *******************************************************
; ʾ�� 1 - ����һ���µ�Microsoft Word�ļ�����,���״̬���Ƿ�ɼ�,
;              ����ɼ���ر�, ������ɼ����.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
If _WordPropertyGet($oWordApp, "statusbar") Then
	MsgBox(4096, "״̬��״̬", "״̬���ɼ�, ����ر�.")
	_WordPropertySet($oWordApp, "statusbar", False)
Else
	MsgBox(4096, "״̬��״̬", "״̬�����ɼ�, �����.")
	_WordPropertySet($oWordApp, "statusbar", True)
EndIf
