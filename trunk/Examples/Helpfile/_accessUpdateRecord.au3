#include <Access.au3>
Dim $yo
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Computer"
$adCol = "a"
$adQuery = "�ı�"
$adcCol = "a"
$adData = "�ı��ı�"
$yo = _accessUpdateRecord($adSource, $adTable, $adCol, $adQuery, $adcCol, $adData)
MsgBox(0, "", $yo)