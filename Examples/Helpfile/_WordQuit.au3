
; *******************************************************
; ʾ�� - ����һ�����ɼ���word����, ��һ���ĵ�, ��ȡ��Ϣ���˳�
; *******************************************************

#include <Word.au3>

$oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 0, 0)
; ��ʾ�ĵ��е��ı�
$sText = $oWordApp.ActiveDocument.Range.Text
msgbox(0, "Document Text", $sText)
_WordQuit($oWordApp)

