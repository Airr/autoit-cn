﻿Send("#r")
WinWaitActive("运行")
Send("notepad.exe{Enter}")
WinWaitActive("[CLASS:Notepad]")
Send("Today's time/date is {F5}")
