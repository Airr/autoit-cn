#include <Date.au3>

; ����+5��
Local $sNewDate = _DateAdd('d', 5, _NowCalcDate())
MsgBox( 4096, "", "���� + 5 ��:" & $sNewDate )

; �����ȥ����
$sNewDate = _DateAdd('w', -2, _NowCalcDate())
MsgBox( 4096, "", "�����ȥ����: " & $sNewDate )

; ��ǰʱ�� +15 ����
$sNewDate = _DateAdd('n', 15, _NowCalc())
MsgBox( 4096, "", "��ǰʱ�� +15 ����: " & $sNewDate )

; ����� 1970/01/01 00:00:00 ��ʼ ���� 1087497645 ����ʱ��
$sNewDate = _DateAdd('s', 1087497645, "1970/01/01 00:00:00")
MsgBox( 4096, "", "����ʱ��: " & $sNewDate )
