; *******************************************************
; ʾ�� 1 - ��������������� AutoIt ��ҳ, ��ȡ��
;				document ��������ò���ʾ�ĵ�����
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oDoc = _IEDocGetObj($oIE)
MsgBox(4096, "Document Created Date", $oDoc.fileCreatedDate)
