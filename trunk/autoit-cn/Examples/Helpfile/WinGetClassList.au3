
Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")





$text = WinGetClassList("[CLASS:Notepad]", "")
MsgBox(0, "���б�Ϊ:", $text)
