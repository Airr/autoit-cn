﻿#include <String.au3>

Local $String = "I like AutoIt3"
Local $Hex = _StringToHex($String)
MsgBox(4096, "转换一个字符串到十六进制字符串.", "转换前: " & $String & @LF & "转换后: " & $Hex)

$Hex = "49206C696B65204175746F497433"
$String = _HexToString($Hex)
MsgBox(4096, "转换十六进制字符串到一个字符串", "转换前: " & $Hex & @LF & "转换后: " & $String)