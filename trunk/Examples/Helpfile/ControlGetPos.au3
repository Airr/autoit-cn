Run("notepad.exe")
WinWait("[CLASS:Notepad]")
Local $aPos = ControlGetPos("[CLASS:Notepad]", "", "Edit1")
MsgBox(0, "����״̬:", "����: " & $aPos[0] & "," & $aPos[1] & @CRLF & "��С: " & $aPos[2] & "," & $aPos[3] )
