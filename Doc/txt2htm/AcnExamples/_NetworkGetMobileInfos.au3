#include <ACN_NET.au3>

$aMobile = _NetworkGetMobileInfos("13942587746");��㰴�˸�����
MsgBox(0, "��ѯ���ֻ�����Ϊ", $aMobile[1])
MsgBox(0, "�ֻ����������Ϊ", $aMobile[2])


$aMobile = _NetworkGetMobileInfos("1439425877466");��㰴�˸�����
If @error Then
	MsgBox(0,"����","��ѯ����")
	Exit
EndIf