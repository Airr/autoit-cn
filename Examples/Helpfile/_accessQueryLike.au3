#include <Access.au3>
#include <Array.au3>
Dim $yo
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Computer"
$adCol = "a"
$Find = ""
$adFull = 1
$yo = _accessQueryLike($adSource, $adTable, $adCol, $Find, $adFull)
_arraydisplay($yo, "����ֵ")
$aRecord = StringSplit($yo[1], Chr(28))
_arraydisplay($aRecord, "ÿ��ֵ")
