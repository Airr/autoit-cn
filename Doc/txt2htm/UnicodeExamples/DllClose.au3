﻿Local $dll = DllOpen("user32.dll")
Local $result
$result = DllCall($dll, "int", "MessageBoxW", "hwnd", 0, "wstr", "若干文本", "wstr", "若干标题", "int", 0)
$result = DllCall($dll, "int", "MessageBoxA", "hwnd", 0, "str", "若干文本", "str", "若干标题", "int", 0)
$result = DllCall($dll, "int", "MessageBox", "hwnd", 0, "str", "若干文本", "str", "若干标题", "int", 0)
DllClose($dll)