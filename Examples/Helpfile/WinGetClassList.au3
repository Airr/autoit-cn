
Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")





Local $text = WinGetClassList("[CLASS:Notepad]", "")
MsgBox(0, "���б�Ϊ:", $text)
