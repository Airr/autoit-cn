; *****************************************************************************
; ʾ�� 1 - ����һ�������ظ�ֵ��һά����.
; ʹ�� _ArrayUnique ����һ��������Ψһֵ��������.
; *****************************************************************************

#include <Array.au3>

Local $aArray[10] = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
_ArrayDisplay($aArray, "$aArray")
Local $aNewArray = _ArrayUnique($aArray) ;ʹ��Ĭ�ϲ���
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray")

; ******************************************************************************************
; ʾ�� 2 - ����һ�������ظ�ֵ�Ķ�ά����.
; ʹ�� _ArrayUnique ����һ��������Ψһֵ���µ�һά����.
; ******************************************************************************************

#include <Array.au3>

Dim $aArray[6][2] = [[1, "A"],[2, "B"],[3, "C"],[1, "A"],[2, "B"],[3, "C"]]
_ArrayDisplay($aArray, "$aArray")
$aNewArray = _ArrayUnique($aArray) ;ʹ��Ĭ�ϲ���
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray")

$aNewArray = _ArrayUnique($aArray, 2) ;ʹ�õڶ�ά
_ArrayDisplay($aNewArray, "$aNewArray represents the 2nd Dimension of $aArray")

; *****************************************************************************************
; ʾ�� 3 - ����һ�������ظ�ֵ��һά����.
; ʹ�� _ArrayUnique �����ִ�Сд����һ��������Ψһֵ��������.
; *****************************************************************************************

#include <Array.au3>

Dim $aArray[6][2] = [[1, "A"],[2, "B"],[3, "C"],[1, "a"],[2, "b"],[3, "c"]]
_ArrayDisplay($aArray, "$aArray")
$aNewArray = _ArrayUnique($aArray, 1, 0, 1) ;ʹ��Ĭ�ϲ���,�����ִ�Сд
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray")

$aNewArray = _ArrayUnique($aArray, 2, 0, 1) ;ʹ��Ĭ�ϲ���,�����ִ�Сд
_ArrayDisplay($aNewArray, "$aNewArray represents the 2st Dimension of $aArray")

; *****************************************************************************************
; ʾ�� 4 - ����һ�������ظ�ֵ�� "|" ��һά����.
; ʹ�� _ArrayUnique ����һ��������Ψһֵ��������.
; *****************************************************************************************

#include <Array.au3>

Dim $aArray[6][2] = [[1, "|A"],[2, "B"],[3, "C"],[1, "|A"],[2, "B"],[3, "C"]]
Local $sMsgBox

$aNewArray = _ArrayUnique($aArray, 2) ;ʹ�õڶ�ά

For $i = 0 To $aNewArray[0]
	$sMsgBox &= "[" & $i & "]: " & $aNewArray[$i] & @CRLF
Next

;����ı�����ſ����� _ArrayDisplay ����ʾ���� "|" ��Ԫ��
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray", -1, 0, "@")