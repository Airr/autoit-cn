; *******************************************************
; ʾ��1 - ��ȡ0��������ָ����������, ������Ϊҳ�е��׸���
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.google.com ")
$oForm = _IEFormGetCollection($oIE, 0)
$oQuery = _IEFormElementGetCollection($oForm, 1)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3 ")
_IEFormSubmit($oForm)

; *******************************************************
; ʾ��2 - ��ȡҳ�б����ϵ�����, ����һ��ʾÿ��������Ϣ
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.google.com ")
$oForms = _IEFormGetCollection($oIE)
msgbox(0, "Forms Info ", "There are" & @extended & "  forms on this page ")
For $oForm In $oForms
	msgbox(0, "Form Info ", $oForm .name)
Next

; *******************************************************
; ʾ��3 - ��ȡҳ�б����ϵ�����, ����һ��ʾÿ��������Ϣ, ����ʾ���������÷�
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.google.com ")
$oForms = _IEFormGetCollection($oIE)
$iNumForms = @extended
msgbox(0, "Forms Info ", "There are" & $iNumForms & "  forms on this page ")
For $i = 0 to $iNumForms - 1
	$oForm = _IEFormGetCollection($oIE, $i)
	msgbox(0, "Form Info ", $oForm .name)
Next

