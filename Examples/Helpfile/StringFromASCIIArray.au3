#include <Array.au3>

; �ַ���ת��Ϊ ASCII ������.
Local $a = StringToASCIIArray("abc")

; ��ʾ����ÿ���ַ���ASCII�������.
_ArrayDisplay($a)

; ASCII ������ת��Ϊ�ַ���.
Local $s = StringFromASCIIArray($a)

;ת��������᷵�� ASCII ���ʾ���ַ���.
MsgBox(0, "ת�����", $s)

