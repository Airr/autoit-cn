#include <String.au3>

Local $String = "I like AutoIt3"
Local $Hex = _StringToHex($String)
MsgBox(0, "ת��һ���ַ�����ʮ�������ַ���.", "ת��ǰ: " & $String & @LF & "ת����: " & $Hex)

$Hex = "49206C696B65204175746F497433"
$String = _HexToString($Hex)
MsgBox(0, "ת��ʮ�������ַ�����һ���ַ���", "ת��ǰ: " & $Hex & @LF & "ת����: " & $String)