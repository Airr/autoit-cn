$sum = 0
While 1 ;�� ExitLoop ֮���ȡ��������ѭ��
	$ans = InputBox("���м���=" & $sum, _
		"	����һ������.  (�������˳�)")
	If $ans < 0 Then ExitLoop
	$sum = $sum + $ans
WEnd
MsgBox(0,"�����ǣ�", $sum)
