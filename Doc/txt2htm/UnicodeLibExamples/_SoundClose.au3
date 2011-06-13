﻿#include <Sound.au3>

;打开声音文件: 在 Vista 中运行时必须进行修改
Local $sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")
If @error = 2 Then
	MsgBox(0, "Error", "The file does not exist")
	Exit
ElseIf @extended <> 0 Then
	Local $extended = @extended ;赋值, 因为 @extended 将在 DllCall 后才会被设置
	Local $stText = DllStructCreate("char[128]")
	Local $errorstring = DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $extended, "ptr", DllStructGetPtr($stText), "int", 128)
	MsgBox(0, "Error", "The open failed." & @CRLF & "Error Number: " & $extended & @CRLF & "Error Description: " & DllStructGetData($stText, 1) & @CRLF & "Please Note: The sound may still play correctly.")
Else
	MsgBox(0, "Success", "The file opened successfully")
EndIf

If _SoundClose($sound) = 1 Then
	MsgBox(0, "Success", "The sound was closed successfully")
Else
	MsgBox(0, "Error", "The file was not closed successfully")
EndIf
