#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"

_accessCreateDB($adSource)
MsgBox(0, "��ʾ", "���ݿⴴ���ɹ�������·���ڣ�" & $adSource)