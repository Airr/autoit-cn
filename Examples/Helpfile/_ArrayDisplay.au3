#include <Array.au3>

;===============================================================================
; ���� 1
;===============================================================================
Local $asControls = StringSplit(WinGetClassList("[active]", ""), @LF)
_ArrayDisplay($asControls, "����ڰ�����'��'�б�")

;===============================================================================
; ���� 2 (ʹ��һ���ֶ����������)
;===============================================================================
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

_ArrayDisplay($avArray, "$avArray Ϊһά����")
_ArrayDisplay($avArray, "$avArray Ϊ�ߵ���һά����", -1, 1)

;===============================================================================
; ���� 3 (ʹ��һ�� StringSplit() �������ص�����)
;===============================================================================
$avArray = StringSplit(WinGetClassList("", ""), @LF)
_ArrayDisplay($avArray, "$avArray Ϊһ������ڰ�����'��'�б�")

;===============================================================================
; Example 4 (a 2D array)
;===============================================================================
Local $avArray[2][5] = [["JPM", "Holger", "Jon", "Larry", "Jeremy"],["Valik", "Cyberslug", "Nutster", "JdeB", "Tylo"]]
_ArrayDisplay($avArray, "$avArray Ϊ��ά����")
_ArrayDisplay($avArray, "$avArray Ϊ��ά����, �ߵ���", -1, 1)
