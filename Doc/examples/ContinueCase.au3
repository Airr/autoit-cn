$msg = ""
$szName = InputBox(Default, "������һ������", "", " M", Default, Default, Default, Default, 10)
Switch @error
Case 2
	$msg = "��ʱ"
	ContinueCase
Case 1; ������һCase�¼�
	$msg &= "ȡ��"
Case 0
	Switch $szName
	Case "a", "e", "i", "o", "u"
		$msg = "����Ԫ����ĸ"
	Case "QP"
		$msg = "��ѧ"
	Case "Q" to "QZ"
		$msg = "��Ȼ��ѧ"
	Case Else
		$msg = "����"
	EndSwitch
Case Else
	$msg = "�����˷ǳ����µĴ���."
EndSwitch

MsgBox(0, Default, $msg)
