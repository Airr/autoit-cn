Local $x = BitShift(14, 2)
;  x == 3 ��Ϊ 1110b ���������� 11b == 3

Local $y = BitShift(14, -2)
;  y == 56 ��Ϊ 1110b ���������� 111000b == 56

Local $z = BitShift(1, -31)
;  z == -2147483648 ��Ϊ�� 2'����Ƿ�, the
;  32nd digit from the right has a negative sign.
