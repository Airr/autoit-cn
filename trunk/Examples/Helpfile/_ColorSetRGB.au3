#include <Color.au3>

Local $aColor[3] = [0x80, 0x90, 0xff]

Local $nColor = _ColorSetRGB($aColor)
MsgBox( 4096, "AutoIt", " ��=" & Hex($aColor[0],2) & " ��=" & Hex($aColor[1],2) & " ��=" & Hex($aColor[2],2) & @CRLF & _
		"��ɫ=" & Hex($nColor))
