#include <Array.au3>

;===============================================================================
; ʾ�� 1 (ʹ��һά����)
;===============================================================================
Local $avArray[10] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

_ArrayDisplay($avArray, "Ĭ������ʽ" )
_ArraySort($avArray)
_ArrayDisplay($avArray, "�������з�ʽ" )
_ArraySort($avArray, 1)
_ArrayDisplay($avArray, "�������з�ʽ" )
_ArraySort($avArray, 0, 3, 6)
_ArrayDisplay($avArray, "��ֵ����ʽ 3 to 6" )

;===============================================================================
; ʾ�� 2 (ʹ�ö�ά����)
;===============================================================================
Local $avArray[5][3] = [ _
		[5, 20, 8], _
		[4, 32, 7], _
		[3, 16, 9], _
		[2, 35, 0], _
		[1, 19, 6]]

_ArrayDisplay($avArray, "Ĭ������ʽ" )
_ArraySort($avArray, 0, 0, 0, 0)
_ArrayDisplay($avArray, "������0�������з�ʽ" )
_ArraySort($avArray, 0, 0, 0, 1)
_ArrayDisplay($avArray, "������1�������з�ʽ" )
_ArraySort($avArray, 0, 0, 0, 2)
_ArrayDisplay($avArray, "������2�������з�ʽ" )
