﻿Send("#r")
WinWaitActive("Run")
Send("notepad.exe{Enter}")
WinWaitActive("Untitled -")
Send("Today's time/date is {F5}")