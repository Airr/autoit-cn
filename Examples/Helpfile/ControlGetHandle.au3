Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]","")
Local $handle = ControlGetHandle("[CLASS:Notepad]", "", "Edit1")
MsgBox(32,"����ǲ���һ�����?","����ֵ:" & IsHWnd($handle))