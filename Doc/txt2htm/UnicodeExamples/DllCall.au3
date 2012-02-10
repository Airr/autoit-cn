﻿; *******************************************************
; 示例 1 - 直接调用 MessageBox API
; *******************************************************

Local $result = DllCall("user32.dll", "int", "MessageBox", "hwnd", 0, "str", "若干文字", "str", "若干标题", "int", 0)


; *******************************************************
; 示例 2 - 调用一个函数修改参数
; *******************************************************

Local $hwnd = WinGetHandle("[CLASS:Notepad]")
$result = DllCall("user32.dll", "int", "GetWindowText", "hwnd", $hwnd, "str", "", "int", 32768)
MsgBox(4096, "", $result[0])	; 返回的字符数
MsgBox(4096, "", $result[2])	; 在参数 2 返回的文本


; *******************************************************
; 示例 3 - 显示系统更改图标窗口
; *******************************************************

Local $sFileName = @SystemDir & '\shell32.dll'

; 创建一个数据结构储存图标索引
Local $stIcon = DllStructCreate("int")
Local $stString = DllStructCreate("wchar[260]")
Local $structsize = DllStructGetSize($stString) / 2
DllStructSetData($stString, 1, $sFileName)

; 运行更改图标窗口 - '62' 是这个函数的顺序值
DllCall("shell32.dll", "none", 62, "hwnd", 0, "ptr", DllStructGetPtr($stString), "int", $structsize, "ptr", DllStructGetPtr($stIcon))

$sFileName = DllStructGetData($stString, 1)
Local $nIconIndex = DllStructGetData($stIcon, 1)

; 显示文件名和图标索引
MsgBox(4096, "信息", "最后选择的文件: " & $sFileName & @LF & "图标索引: " & $nIconIndex)
