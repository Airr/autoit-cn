; *******************************************************
; ʾ�� - �򿪴��л���ʾ���������,
;				�������"user forum"�ı�������
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
_IELinkClickByText($oIE, "user forum")

; *******************************************************
; ʾ�� 2 - ��������������� AutoIt ��ҳ, ѭ��ҳ���ϵ�
;				���Ӳ�����ı�Ϊ "wallpaper" ������
;				ʹ�����ַ���ƥ��.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")

Local $sMyString = "wallpaper"
Local $oLinks = _IELinkGetCollection($oIE)
For $oLink In $oLinks
	Local $sLinkText = _IEPropertyGet($oLink, "innerText")
	If StringInStr($sLinkText, $sMyString) Then
		_IEAction($oLink, "click")
		ExitLoop
	EndIf
Next
