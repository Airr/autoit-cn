﻿; 修改当前目录中所有 *.au3 文件的属性为(只读+系统)属性. 
If Not FileSetAttrib("*.au3", "+RS") Then
    MsgBox(4096,"错误", "属性设置问题.")
EndIf

; 修改 C:\ 目录及其所有子目录中的所有 *.bmp 文件的属性为(可写+存档)属性.
If Not FileSetAttrib("C:\*.bmp", "-R+A", 1) Then
    MsgBox(4096,"错误", "属性设置问题.")
EndIf