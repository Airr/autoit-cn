; ������(Binary) ANSI �� �ַ���(String) 
$buffer = StringToBinary("Hello - ���")
MsgBox(4096, "String() ����" , $buffer)
$buffer = BinaryToString($buffer)
MsgBox(4096, "BinaryToString() ANSI ����" , $buffer)

; ������ UTF16-LE ת�� �ַ���.ע:LE����Little Encode(С����) 
$buffer = StringToBinary("Hello - ���", 2)
MsgBox(4096, "String() ����" , $buffer)
$buffer = BinaryToString($buffer, 2)
MsgBox(4096, "BinaryToString() UTF16-LE ����" , $buffer)

; ������ UTF16-BE ת�� �ַ���.ע:BE����Big Encode(�����) 
$buffer = StringToBinary("Hello - ���", 3)
MsgBox(4096, "String() ����" , $buffer)
$buffer = BinaryToString($buffer, 3)
MsgBox(4096, "BinaryToString() UTF16-BE ����" , $buffer)

; ������ UTF8 ת�� �ַ��� 
$buffer = StringToBinary("Hello - ���", 4)
MsgBox(4096, "String() ����" , $buffer)
$buffer = BinaryToString($buffer, 4)
MsgBox(4096, "BinaryToString() UTF8 ����" , $buffer)
