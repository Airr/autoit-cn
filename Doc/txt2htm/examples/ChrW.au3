Local $text = ""
For $i = 256 to 512
	$text = $text & ChrW($i)
Next
MsgBox(0, "Unicode �ַ� 256 �� 512", $text)
