; *******************************************************
; ʾ�� 1 - �������µĿ��ĵ��� word ����,
;				��ӵڶ������ĵ�, ���һ�ȡ�ĵ�����.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate()
_WordDocAdd($oWordApp)
Local $oDocuments = _WordDocGetCollection($oWordApp)
MsgBox(4096, "Document Count", @extended)
_WordQuit($oWordApp)
