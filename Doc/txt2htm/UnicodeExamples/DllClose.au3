﻿Local $dll = DllOpen("user32.dll")
Local $result = DllCall($dll, "int", "MessageBox", "hwnd", 0, "str", "若干文本", "str", "若干标题", "int", 0)
DllClose($dll)
