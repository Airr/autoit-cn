﻿#comments-start
	MsgBox(4096, "", "这是不执行的")
	MsgBox(4096, "", "或者这样")
#comments-end

; #cs
MsgBox(4096, "提示", "如果取消上下行任意的注释将出现警告:" & @CRLF & "没有发现匹配的 '#cs/#ce'.")
; #ce
