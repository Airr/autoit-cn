#include <Color.au3>

$nColor = 0x8090ff

$aColor = _ColorGetRGB( $nColor )
MsgBox( 4096, "AutoIt", "��ɫΪ=" & Hex($nColor) & @CRLF & " ��=" & Hex($aColor[0],2) & " ��=" & Hex($aColor[1],2) & " ��=" & Hex($aColor[2],2))
