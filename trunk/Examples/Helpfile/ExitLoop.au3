Local $sum = 0
While 1 ;���ǵ��� ExitLoop ,������ѭ��
	Local $ans = InputBox("���д���=" & $sum, _
		"	����һ������.  (�������˳�)")
	If $ans < 0 Then ExitLoop
	$sum = $sum + $ans
WEnd
MsgBox(0,"����Ϊ:", $sum)
