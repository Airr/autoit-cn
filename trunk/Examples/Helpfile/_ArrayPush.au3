#include <Array.au3>
;_ArrayPush(ByRef $avArray, $vValue[, $iDirection = 0])
;$avArray(��Ҫ�ı������) 
;$vValue(ѡ�����:0=δ�� 1=����)


Local $avArrayTarget[9] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Local $avArraySource[2] = [100, 200]

_ArrayDisplay($avArrayTarget, "����ǰ")

_ArrayPush($avArrayTarget, $avArraySource);�ı�δ�������е�����ֵ
_ArrayDisplay($avArrayTarget, "���к�δ���ı�")

_ArrayPush($avArrayTarget, $avArraySource, 1);�ı䶥�������е�����ֵ
_ArrayDisplay($avArrayTarget, "���к󶥲��ı�")

_ArrayPush($avArrayTarget, "�Ҹı���", 1);�ı䶥�������е�����ֵ
_ArrayDisplay($avArrayTarget, "���к󶥲��ַ��ı�")
