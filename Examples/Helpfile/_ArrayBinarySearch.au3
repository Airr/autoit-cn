#include <Array.au3>

;===============================================================================
; ���� 1 (ʹ��һ���ֶ����������)
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

; �������������
_ArraySort($avArray)

; ��ʾ����������
_ArrayDisplay($avArray, "$avArray ����� _ArraySort()")

; ���Ҵ��ڵ���Ŀ
Local $iKeyIndex = _ArrayBinarySearch($avArray, "Jon")
If Not @error Then
	MsgBox(0,'��Ŀ�ҵ���',' ����: ' & $iKeyIndex)
Else
	MsgBox(0,'��Ŀδ�ҵ�',' ����: ' & @error)
EndIf

; ���Ҳ����ڵ���Ŀ
$iKeyIndex = _ArrayBinarySearch($avArray, "Unknown")
If Not @error Then
	MsgBox(0,'��Ŀ�ҵ���',' ����: ' & $iKeyIndex)
Else
	MsgBox(0,'��Ŀδ�ҵ�',' ����: ' & @error)
EndIf


;===============================================================================
; ���� 2 (ʹ��һ�� StringSplit() �������ص�����)
;===============================================================================
$avArray = StringSplit("a,b,d,c,e,f,g,h,i", ",")

; ����������
_ArraySort($avArray, 0, 1) ; ������ 1 ��ʼ,���� $avArray[0]

; ��ʾ���������
_ArrayDisplay($avArray, "$avArray ����� _ArraySort()")

 ; ��ʼ������ 1 ���� $avArray[0]
$iKeyIndex = _ArrayBinarySearch($avArray, "c", 1)
If Not @error Then
	MsgBox(0,'��Ŀ�ҵ���',' ����: ' & $iKeyIndex)
Else
	MsgBox(0,'��Ŀδ�ҵ�',' ����: ' & @error)
EndIf
