#include <Array.au3>	; For _ArrayDisplay()

; �ַ���ת��Ϊ ASCII ������.
Local $a = StringToASCIIArray("abc")

; ��ʾ����ÿ���ַ���ASCII�������.
_ArrayDisplay($a)

; ASCII ������ת��Ϊ�ַ���.
Local $s = StringFromASCIIArray($a)

;ת��������᷵�� ASCII ���ʾ���ַ���.
MsgBox(4096, "ת�����", $s)

