; *****************************************************************************
; ʾ��1 - ����һ�������ظ�ֵ��һά����, ʹ��_ArrayUnique�½�һ��ֻ����Ψһֵ������.
; *****************************************************************************
#include <Array.au3>

Dim $aArray[10] = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
_ArrayDisplay($aArray, "$aArray ")

$aNewArray = _ArrayUnique($aArray) ;ʹ��Ĭ�ϲ���
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray ")

; *****************************************************************************
; ʾ��2 - ����һ�������ظ�ֵ�Ķ�ά����, ʹ��_ArrayUnique�½�һ��ֻ����Ψһֵ��һά����.
; *****************************************************************************
#include <Array.au3>

Dim $aArray[6][2] = [[1, "A "],[2, "B "],[3, "C "],[1, "A "],[2, "B "],[3, "C "]]
_ArrayDisplay($aArray, "$aArray ")

$aNewArray = _ArrayUnique($aArray) ;ʹ��Ĭ�ϲ���
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray ")

$aNewArray = _ArrayUnique($aArray, 2) ;ʹ�õڶ�ά
_ArrayDisplay($aNewArray, "$aNewArray represents the 2nd Dimension of $aArray ")

; *****************************************************************************
; ʾ��3 - ����һ�������ظ�ֵ��һά����, ʹ��_ArrayUnique����Сд�����½�һ��ֻ��Ψһֵ������.
; *****************************************************************************
#include <Array.au3>

Dim $aArray[6][2] = [[1, "A "],[2, "B "],[3, "C "],[1, "a "],[2, "b "],[3, "c "]]
_ArrayDisplay($aArray, "$aArray ")

$aNewArray = _ArrayUnique($aArray, 1, 0, 1) ;ʹ��Ĭ�ϲ���, �Ҵ�Сд����
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray ")

$aNewArray = _ArrayUnique($aArray, 2, 0, 1) ;ʹ��Ĭ�ϲ������Ҵ�Сд����
_ArrayDisplay($aNewArray, "$aNewArray represents the 2st Dimension of $aArray ")

; *****************************************************************************
; ʾ��4 - ����һ�������ظ�ֵ�� " | " ��һά���飬ʹ��_ArrayUnique�½�һ��ֻ����Ψһֵ������
; *****************************************************************************
#include <Array.au3>

Dim $aArray[6][2] = [[1, "|A "],[2, "B "],[3, "C "],[1, "|A "],[2, "B "],[3, "C "]]
Local $smsgbox

$aNewArray = _ArrayUnique($aArray, 2) ;ʹ�õڶ�ά

For $i = 0 To $aNewArray[0]
	$smsgbox &= " [" & $i & " ]:" & $aNewArray[$i] & @CRLF
Next

; ����ı�����Ա���_ArrayDisplay����ʾһ������ " | " ��Ԫ��
_ArrayDisplay($aNewArray, "$aNewArray represents the 1st Dimension of $aArray ", -1, 0, "@ ")

