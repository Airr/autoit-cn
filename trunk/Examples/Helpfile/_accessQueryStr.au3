#include <Access.au3>
Dim $yo
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Computer"
$adCol = "a"
$Find = "�ı�1"
$yo = _accessQueryStr($adSource, $adTable, $adCol, $Find)
msgbox(0, "1", $yo);�ɹ��򷵻��ֶε�ֵ��ʧ���򷵻ؿ��ַ���
