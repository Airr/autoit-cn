; *******************************************************
; ʾ�� 1 - ����һ���µ�Microsoft Word�ļ�����,��ȡ�ı����ݺ��˳�.
;
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 0, 0)
; ��ʾ��ȡ���ı�����
Local $sText = $oWordApp.ActiveDocument.Range.Text
MsgBox(0, "��ȡ�ı�����", $sText)
_WordQuit($oWordApp)
