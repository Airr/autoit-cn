; Binary ANSI to String 
$buffer = StringToBinary("Hello - ���")
MsgBox(4096, "String() representation" , $buffer)
$buffer = BinaryToString($buffer)
MsgBox(4096, "BinaryToString() ANSI representation" , $buffer)

; Binary UTF16-LE to String 
$buffer = StringToBinary("Hello - ���", 2)
MsgBox(4096, "String() representation" , $buffer)
$buffer = BinaryToString($buffer, 2)
MsgBox(4096, "BinaryToString() UTF16-LE representation" , $buffer)

; Binary UTF16-BE to String 
$buffer = StringToBinary("Hello - ���", 3)
MsgBox(4096, "String() representation" , $buffer)
$buffer = BinaryToString($buffer, 3)
MsgBox(4096, "BinaryToString() UTF16-BE representation" , $buffer)

; Binary UTF8 to String 
$buffer = StringToBinary("Hello - ���", 4)
MsgBox(4096, "String() representation" , $buffer)
$buffer = BinaryToString($buffer, 4)
MsgBox(4096, "BinaryToString() UTF8 representation" , $buffer)
