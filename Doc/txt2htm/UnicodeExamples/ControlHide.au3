﻿Run("winver.exe")
$HWND=WinWaitActive('[REGEXPTITLE:.+Windows;REGEXPCLASS:#\d+]','')
If IsHWnd($HWND) Then
	MsgBox(32,$HWND,'系统关于窗口出现咯...我们隐藏掉确定按钮试试')
	ControlHide($HWND, "", "Button1")
Else
	MsgBox(32,"ERROR","貌似没找到窗口嘛...")
EndIf