; �����Զ��庯����ʾ���ű�
; ע�����(variables), ����(ByRef), �� ����ֵ(Return)���÷�

$foo = 2
$bar = 5
msgBox(0,"������ " & today(), "$foo ����:" & $foo)
swap($foo, $bar)
msgBox(0,"���� $foo �� $bar ������", "���� $foo ��ֵ�ǣ�" & $foo)
msgBox(0,"���", "3 �� 4 �нϴ������:" & max(3,4))
Exit

Func swap(ByRef $a, ByRef $b)  ;������������������
	Local $t
	$t = $a
	$a = $b
	$b = $t
EndFunc

Func today()  ;�� mm/dd/yyyy ����ʽ���ص�ǰ����
	return (@MON & "/" & @MDAY & "/" & @YEAR)
EndFunc

Func max($x, $y)  ;�����������еĽϴ�ֵ
	If $x > $y Then
		return $x
	Else
		return $y
	EndIf
EndFunc

;ʾ���ű�����
