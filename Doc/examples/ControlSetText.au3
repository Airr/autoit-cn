Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]","")
ControlSetText("[CLASS:Notepad]", "", "Edit1", "���������õ��ı�" )
