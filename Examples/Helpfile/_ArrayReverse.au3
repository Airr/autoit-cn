#include <Array.au3>

Local $avArray[10] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

_ArrayDisplay($avArray, "����ǰ")
_ArrayReverse($avArray)
_ArrayDisplay($avArray, "���к�ת����˳��")
_ArrayReverse($avArray, 3, 6)
_ArrayDisplay($avArray, "���к�ת����3��6��˳��")
