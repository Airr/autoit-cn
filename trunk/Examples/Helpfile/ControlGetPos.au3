Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]","")
$pos = ControlGetPos("[CLASS:Notepad]", "", "Edit1")
MsgBox(0, "����״̬:", "����: " & $pos[0] & "," & $pos[1] & " ��С: " & $pos[2] & "," & $pos[3] )
