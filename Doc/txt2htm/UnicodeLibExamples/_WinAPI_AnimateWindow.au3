﻿#NoTrayIcon

#Include <Constants.au3>
#Include <GUIConstantsEx.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)
Opt('TrayMenuMode', 1)

Global Const $SC_MINIMIZE = 0xF020

Global $hTray = ControlGetHandle('[CLASS:Shell_TrayWnd]', '', 'TrayNotifyWnd1')
Global $hForm, $GUIMsg, $TrayMsg, $Dummy, $TrayRestoreItem, $TrayExitItem

$TrayRestoreItem = TrayCreateItem('Restore')
TrayItemSetState(-1, $TRAY_DEFAULT)
TrayCreateItem('')
$TrayExitItem = TrayCreateItem('Exit')
TraySetClick(8)

$hForm = GUICreate('My GUI')
$Dummy = GUICtrlCreateDummy()
GUIRegisterMsg($WM_SYSCOMMAND, 'WM_SYSCOMMAND')
GUISetState()

While 1
	$TrayMsg = TrayGetMsg()
	Switch $TrayMsg
		Case $TrayRestoreItem
			_WinAPI_DrawAnimatedRects($hForm, _WinAPI_GetWindowRect($hTray), _WinAPI_GetWindowRect($hForm))
			GUISetState(@SW_SHOW, $hForm)
			TraySetState(2)
		Case $TrayExitItem
			ExitLoop
	EndSwitch
	$GUIMsg = GUIGetMsg()
	Switch $GUIMsg
		Case -3
			_WinAPI_AnimateWindow($hForm, BitOR($AW_BLEND, $AW_HIDE))
			ExitLoop
		Case $Dummy ; Minimize
			_WinAPI_DrawAnimatedRects($hForm, _WinAPI_GetWindowRect($hForm), _WinAPI_GetWindowRect($hTray))
			GUISetState(@SW_HIDE, $hForm)
			TraySetState(1)
	EndSwitch
WEnd

Func WM_SYSCOMMAND($hWnd, $iMsg, $wParam, $lParam)
	Switch $hWnd
		Case $hForm
			Switch $wParam
				Case $SC_MINIMIZE
					GUICtrlSendToDummy($Dummy)
					Return 0
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SYSCOMMAND
