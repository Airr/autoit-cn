; *******************************************************
; ʾ�� 1 - �򿪺�����ʾ���������, ��ȡ��
;				����Ԫ�صļ��ϲ���ʾ����ÿ���� tagname �� innerText
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oElements = _IETagNameAllGetCollection($oIE)
For $oElement In $oElements
	MsgBox(4096, "Element Info", "Tagname: " & $oElement.tagname & @CR & "innerText: " & $oElement.innerText)
Next
