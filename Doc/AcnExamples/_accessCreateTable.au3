#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Computer"
$adCol = "a TEXT(10) | b MEMO | c COUNTER | d INTEGER | e YESNO | f DATETIME | g CURRENCY | h OLEOBJECT"

_accessCreateDB($adSource);�ڽű�Ŀ¼����DB1.mdb���ݿ�
_accessCreateTable($adSource, $adTable, $adCol);��DB1.mdb���ݿ��д�����
MsgBox(0, "��ʾ", "���ݿ�<" & $adTable & ">�����ɹ�����������Ϊ" & $adCol)