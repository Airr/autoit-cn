#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox($MB_SYSTEMMODAL, 'Min Index String value', _ArrayMinIndex($avArray, 0, 1))
MsgBox($MB_SYSTEMMODAL, 'Min Index Numeric value', _ArrayMinIndex($avArray, 1, 1))
