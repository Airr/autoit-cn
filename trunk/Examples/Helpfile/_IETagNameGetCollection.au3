; *******************************************************
; ʾ�� 1 - �򿪺���ʾ���������, ��ȡ��
;				���� INPUT ��ǵļ��ϲ���ʾ����ÿ���ı����ƺ�����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oInputs = _IETagNameGetCollection($oIE, "input")
For $oInput In $oInputs
	MsgBox(4096, "Form Input Type", "Form: " & $oInput.form.name & " Type: " & $oInput.type)
Next
