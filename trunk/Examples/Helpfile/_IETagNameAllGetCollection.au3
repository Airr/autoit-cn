; *******************************************************
; �򿪴��л���ʾ���������, ��ȡ����Ԫ�صļ��ϲ���ʾÿ����ǩ����innerText
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" basic ")
$oElements = IETagNameAllGetCollection $oIE)
For $oElement In $oElements
	msgbox(0, "Element info ", "Tagname:" & $oElement .form.tagname & " innerText:" & $oElement .innerText)
Next

