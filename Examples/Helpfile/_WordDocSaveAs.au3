; *******************************************************
; ʾ�� 1 - ����һ���µ�Microsoft Word�ļ�����,׷��һЩ�ı�,
;				ִ�����Ϊ����, Ȼ���˳�.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate ()
$oDoc = _WordDocGetCollection ($oWordApp, 0)

Sleep(3500);�ӳ��Ա�۲�仯
$oDoc.Range.Text = "����׷�ӵ��ı�����."
Sleep(3500);�ӳ��Ա�۲�仯

_WordDocSaveAs ($oDoc, @ScriptDir & "\Test.doc")
_WordQuit ($oWordApp)