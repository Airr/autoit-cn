Local $bBinary = Binary("0x10203040") ; ����������(binary)���� 0x10203040
Local $bExtract = BinaryMid($bBinary, 2, 2)
MsgBox(4096, "", "�ڶ����ֽں͵������ֽ�Ϊ:" & $bExtract)
