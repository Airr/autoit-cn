Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")



Local $title = WinGetTitle("[CLASS:Notepad]", "")
MsgBox(0, "�����ı���Ϊ:", $title)
