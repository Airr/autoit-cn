#include <Array.au3>

Local $avArray[10]

$avArray[0] = "JPM"
$avArray[1] = "Holger"
$avArray[2] = "Jon"
$avArray[3] = "Larry"
$avArray[4] = "Jeremy"
$avArray[5] = "Valik"
$avArray[6] = "Cyberslug"
$avArray[7] = "Nutster"
$avArray[8] = "JdeB"
$avArray[9] = "Tylo"

MsgBox(0,"��ʾ", "�������б���ͼ����ʾ����_ArrayPop()֮ǰ��һά���ά����")
_ArrayDisplay($avArray, "����ǰ")
While UBound($avArray)
	MsgBox(0,"����ֵ��ʾ", "���᷵����������һ��Ԫ�أ�" & _ArrayPop($avArray))
	_ArrayDisplay($avArray, "���к�")
WEnd
