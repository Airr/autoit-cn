﻿;要打开的文件
Local $file = FileOpen("test.txt", 0)

; 检查打开的文件是否可读
If $file = -1 Then
	MsgBox(4096, "错误", "不能打开文件.")
	Exit
EndIf

; 每次读取一行文本,直到文件结束.
While 1
	Local $line = FileReadLine($file)
	If @error = -1 Then ExitLoop
	MsgBox(4096, "读取的行:", $line)
WEnd

FileClose($file)
