;=============================================================
;�ٷ�����
;=============================================================
;ʾ�� 1, ����ƥ����Ŀ������.��ʹ��ƫ����
Local $nOffset = 1

Local $array
While 1
	$array = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '<(?i)test>(.*?)</(?i)test>', 1, $nOffset)

	If @error = 0 Then
		$nOffset = @extended
	Else
		ExitLoop
	EndIf
	For $i = 0 To UBound($array) - 1
		MsgBox(4096, "������� ��־ֵ 1 - " & $i, $array[$i])
	Next
WEnd


;ʾ�� 2, ���ذ�������ƥ�������.(Perl/ PHP ��ʽ).
$array = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '<(?i)test>(.*?)</(?i)test>', 2)
For $i = 0 To UBound($array) - 1
	MsgBox(4096, "������� ��־ֵ 2 - " & $i, $array[$i])
Next


;ʾ�� 3, ����ȫ��ƥ�������.
$array = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '<(?i)test>(.*?)</(?i)test>', 3)

For $i = 0 To UBound($array) - 1
	MsgBox(4096, "������� ��־ֵ 3 - " & $i, $array[$i])
Next


;ʾ�� 4, ���ذ�������ƥ��(Perl/ PHP ��ʽ)��ȫ��ƥ�������.
$array = StringRegExp('F1oF2oF3o', '(F.o)*?', 4)

For $i = 0 To UBound($array) - 1

	Local $match = $array[$i]
	For $j = 0 To UBound($match) - 1
		MsgBox(4096, "������� ��־ֵ 4 - " & $i & ',' & $j, $match[$j])
	Next
Next

;=============================================================
;kodin��ܰ��ʾ�����˼����Ƽ�ʹ��������Թ��߸���ѧϰ��
;����������Թ��ߵ�ַ��http://www.gskinner.com/RegExr/
;=============================================================

;ʾ�� 1 ƥ�� Email��ַ
$Email = '131sg31gsg autoit@acn.com  313sfsg31sg'
$array = StringRegExp($Email, '\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b', 2)
MsgBox(4096, "�������", $array[UBound($array[0])])

;ʾ�� 2 ƥ�� ����ʱ��(yyyy-mm-dd hh:mm:ss)
$data = 'data 2010-03-27 12:30:10'
$array = StringRegExp($data, '(19[0-9]{2}|2[0-9]{3})-(0[1-9]|1[012])-([123]0|[012][1-9]|31) ([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])', 2)
MsgBox(4096, "�������", $array[UBound($array[0])])