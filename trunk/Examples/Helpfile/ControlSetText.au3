Run("notepad.exe")
WinWait("[CLASS:Notepad]")
ControlSetText("[CLASS:Notepad]", "", "Edit1", "���������õ��ı�" )
