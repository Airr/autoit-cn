; *******************************************************
; ʾ�� 1 - ���ݻ��� 0 ��������ȡ��ָ����������,
;				��ʱ��ҳ�����׸���
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 1)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)

; *******************************************************
; ʾ�� 2 - ��ȡ��ҳ���ϱ����ϵ�����,
;				Ȼ��������ѭ����ʾ����ÿ������Ϣ
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")
Local $oForms = _IEFormGetCollection($oIE)
MsgBox(4096, "Forms Info", "There are " & @extended & " forms on this page")
For $oForm In $oForms
	MsgBox(4096, "Form Info", $oForm.name)
Next

; *******************************************************
; ʾ�� 3 - ��ȡ��ҳ���ϱ����ϵ�����,
;				Ȼ��������ѭ����ʾ����ÿ������Ϣ
;				��ʾ��������ʹ��
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")
$oForms = _IEFormGetCollection($oIE)
Local $iNumForms = @extended
MsgBox(4096, "Forms Info", "There are " & $iNumForms & " forms on this page")
For $i = 0 To $iNumForms - 1
	$oForm = _IEFormGetCollection($oIE, $i)
	MsgBox(4096, "Form Info", $oForm.name)
Next
