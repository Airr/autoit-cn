#include <Access.au3>
Dim $yo
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Computer"

$yo = _accessCountRecords($adSource, $adTable)
MsgBox(0, '��¼��', '������' & _accessCountRecords($adSource, $adTable) & '�����ݼ�¼')