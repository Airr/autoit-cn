﻿; 求某个数的反余弦值(arcCosine).
Local $x = ACos(0.5)
MsgBox(4096, "ACos函数", "值为：" & $x)

Local $pi = 3.14159265358979
Local $radToDeg = 180 / $pi
Local $y = ACos(-1) * $radToDeg ; -1的反余弦值是 180°
MsgBox(4096, "ACos函数", "值为：" & $y & "°")
