#include <MsgBoxConstants.au3>

TrayTip("I'm a title", "I'm the message", 5, 1)
MsgBox($MB_SYSTEMMODAL, "", "Press OK to see another tip.")
TrayTip("clears any tray tip", "", 0)
TrayTip("", "A different tray tip.", 5)
Sleep(5000)
