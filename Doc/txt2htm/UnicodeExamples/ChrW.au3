﻿Local $sText = ""
For $i = 256 To 512
	$sText = $sText & ChrW($i) ; Or $sText &= ChrW($i) can be used as well.
Next
MsgBox(4096, "Unicode 字符 256 到 512", $sText) ; Display the unicode characters between 256 to 512.
