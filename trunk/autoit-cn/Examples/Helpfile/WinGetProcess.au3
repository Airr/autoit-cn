Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")




$pid = WinGetProcess("[CLASS:Notepad]")
MsgBox(0, "���� PID Ϊ", $pid)
