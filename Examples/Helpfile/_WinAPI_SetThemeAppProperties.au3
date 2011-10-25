#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $hForm, $Theme = _WinAPI_GetThemeAppProperties()

$hForm = GUICreate('MyGUI ', 310, 360)
GUISetFont(8.5, 400, 0, 'MS Shell Dlg ', $hForm)
GUICtrlCreateGroup('Group ', 10, 10, 140, 95)
GUICtrlCreateCheckbox('Check1 ', 22, 26, 120, 23)
GUICtrlCreateCheckbox('Check2 ', 22, 49, 120, 23)
GUICtrlCreateCheckbox('Check3 ', 22, 72, 120, 23)
GUICtrlCreateGroup('Group ', 160, 10, 140, 95)
GUICtrlCreateRadio('Radio1 ', 172, 26, 120, 23)
GUICtrlCreateRadio('Radio2 ', 172, 49, 120, 23)
GUICtrlCreateRadio('Radio3 ', 172, 72, 120, 23)
GUICtrlCreateButton('OK ', 120, 330, 70, 23)
_WinAPI_SetThemeAppProperties($STAP_ALLOW_NONCLIENT)
GUICtrlCreateTab(10, 118, 292, 206)
GUICtrlCreateTabItem('Tab1')
GUICtrlCreateTabItem('Tab2')
GUICtrlCreateTabItem('')
_WinAPI_SetThemeAppProperties($Theme)

GUISetState()

Do
Until GUIGetMsg() = -3

