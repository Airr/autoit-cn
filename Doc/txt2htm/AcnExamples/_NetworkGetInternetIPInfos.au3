#include <ACN_NET.au3>

$aSelfIP = _NetworkGetInternetIPInfos()
MsgBox(0, "����ipΪ", $aSelfIP[1])
MsgBox(0, "ip������Ϊ", $aSelfIP[2])




$aIP = _NetworkGetInternetIPInfos("220.181.8.178")
MsgBox(0, "��ѯ��ipΪ", $aIP[1])
MsgBox(0, "ip������Ϊ", $aIP[2])

$aIP = _NetworkGetInternetIPInfos("220.181.8.1789")
If @error Then
	MsgBox(0,"����","��ѯ����")
	Exit
EndIf
