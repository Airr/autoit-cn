$x1 = "12333"
MsgBox(0,"�����", "����ֵΪ:" & StringIsDigit($x1));����ֵΪ: 1

$x2 = "1.5"
MsgBox(0,"�����", "����ֵΪ:" & StringIsDigit($x2));����ֵΪ: 0, ������С����

$x3 = "1 2 3"
MsgBox(0,"�����", "����ֵΪ:" & StringIsDigit($x3));����ֵΪ: 0, �����пհ׷�

$x4 = ""
MsgBox(0,"�����", "����ֵΪ:" & StringIsDigit($x4));����ֵΪ: 0