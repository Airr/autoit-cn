; *******************************************************
; ʾ�� 1 - ��ȡ����ʾ Word.au3 �汾��Ϣ
; *******************************************************
;
#include <Word.au3>

Local $aVersion = _Word_VersionInfo()
MsgBox(4096, "Word.au3 Version", $aVersion[5] & " released " & $aVersion[4])
