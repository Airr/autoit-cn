#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"

_accessCreateDB($adSource)
msgbox(0, "��ʾ", "���ݿⴴ���ɹ�������·���ڣ�" & $adSource)
