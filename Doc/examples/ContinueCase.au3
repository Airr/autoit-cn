$msg = ""
$szName = InputBox(Default, "������......", "", " M", Default, Default, Default, Default, 10)
Switch @error
Case 2
	$msg = "��ʱ "
	ContinueCase
Case 1; ������һ�¼�
	$msg &= "ע��"
Case 0
	Switch $szName
	Case "a", "e", "i", "o", "u"
		$msg = "�����ַ�"
	Case "258"
		$msg = "��������"
	Case "Q" to "QZ"
		$msg = "Science"
	Case Else
		$msg = "������"
	EndSwitch
Case Else
	$msg = "Something went horribly wrong."
EndSwitch

MsgBox(0, Default, $msg)
