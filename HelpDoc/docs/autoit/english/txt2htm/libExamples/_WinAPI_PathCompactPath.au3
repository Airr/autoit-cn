#include <GUIConstantsEx.au3>
#include <WinAPIShPath.au3>

GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), 260, 60)
Local $Label = GUICtrlCreateLabel('', 10, 22, 240, 16)
Local $hLabel = GUICtrlGetHandle($Label)
GUICtrlSetData(-1, _WinAPI_PathCompactPath($hLabel, @ScriptFullPath))
GUISetState(@SW_SHOW)

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE
