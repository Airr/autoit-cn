Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]","")
ControlCommand("[CLASS:Notepad]", "", "Edit1", "EditPaste", "�ŵ��ı���ȥ")
