; *******************************************************
; �򿪴��б�ʾ���������, ��ȡ����INPUT��ǩ�ļ��ϲ���ʾ�����Ƽ�����
; *******************************************************
#include <IE.au3>
$oIE = _IE_Example(" form ")
$oInputs = _IETagNameGetCollection($oIE, "input ")
For $oInput In $oInputs
	msgbox(0, "Form Input Type ", "Form:" & $oInput .form.name & "  Type:" & $oInput .type)
Next

