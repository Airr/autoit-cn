#include <Date.au3>

If _DateIsLeapYear( @YEAR ) Then
	MsgBox( 4096, "����", "����������,��366��(�����³���)." )
Else
	MsgBox( 4096, "����", "���겻������." )
EndIf
