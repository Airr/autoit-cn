Opt("WinTitleMatchMode", 2) ; ƥ�����ַ���
Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")

WinSetTrans("[CLASS:Notepad]", "", 170) ; �ü��±���͸��.
