#include <ACN_NET.au3>

$aID = _NetworkGetIDCardInfos("110107198106012037");�������ɵ�
MsgBox(0, "��ѯ�����֤�������Ϊ", $aID[1])
MsgBox(0, "���֤���������Ϊ", $aID[2])
MsgBox(0, "���֤����Ϊ", $aID[3])
If $aID[4] = "m" Then
	MsgBox(0, "���֤�Ա�Ϊ", "��")
Else
	MsgBox(0, "���֤�Ա�Ϊ", "Ů")
EndIf

$aID = _NetworkGetIDCardInfos("1310107198106012037");�������ɵ�
If @error Then
	MsgBox(0,"����","��ѯ����")
	Exit
EndIf