Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")



$title = WinGetTitle("[CLASS:Notepad]", "")
MsgBox(0, "�����ı���Ϊ:", $title)
