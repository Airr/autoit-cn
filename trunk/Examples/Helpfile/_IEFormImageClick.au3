; *******************************************************
; ʾ�� 1 - �򿪺���ʾ���������, ���
;				ƥ�� alt �ı��� <input type=image> ��Ԫ��
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
_IEFormImageClick($oIE, "AutoIt Homepage", "alt")

; *******************************************************
; ʾ�� 2 - �򿪺���ʾ���������, ���ƥ�� img Դ URL (���ַ���) �� <input type=image>
;				��Ԫ��
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
_IEFormImageClick($oIE, "autoit_6_240x100.jpg", "src")

; *******************************************************
; ʾ�� 3 - �򿪺���ʾ���������, ���ƥ�����Ƶ�
;				<input type=image> ��Ԫ��
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
_IEFormImageClick($oIE, "imageExample", "name")
