#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Computer"
$adCol = "a TEXT(255) | b MEMO | c COUNTER | d INTEGER | e YESNO | f DATETIME | g CURRENCY | h OLEOBJECT"
$rData = "�ı� | ��ע | 1 | 111";��DB1.mdb���ݿ�������¼�¼������ı����ǹ���������Ӧ����

_accessCreateDB($adSource);�ڽű�Ŀ¼����DB1.mdb���ݿ�
_accessCreateTable($adSource, $adTable, $adCol);��DB1.mdb���ݿ��д�����
$yo = _accessAddRecord($adSource, $adTable, $rData, $adCol = 0);��DB1.mdb���ݿ�������¼�¼
MsgBox(0, "��ʾ", "���ݿ�����¼�¼<" & $rData & ">�ɹ�")