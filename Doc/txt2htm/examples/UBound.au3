Local $myArray[10][20]   ;Ԫ�� 0,0 �� 9,19
Local $rows = UBound($myArray)
Local $cols = UBound($myArray, 2)
Local $dims = UBound($myArray, 0)

MsgBox(0, "��ǰ " & $dims & "-ά������", _
	$rows & " ��, " & $cols & " ��")

;��ʾ $myArray's ����
Local $output = ""
For $r = 0 To UBound($myArray, 1) - 1
	$output = $output & @LF
	For $c = 0 To UBound($myArray, 2) - 1
		$output = $output & $myArray[$r][$c] & " "
	Next
Next
MsgBox(4096,"��������", $output)
