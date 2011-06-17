﻿#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WINAPI.au3>

	$gui = GUICreate("trans", 300, 400, -1, -1, -1, $WS_EX_LAYERED)
	GUICtrlCreateLabel("This is text on a transparent Layered GUI", 10, 10, 200, 20, -1, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetTip(-1, "Click label to drag layered window")
	$layButt = GUICtrlCreateButton("Button", 10, 40, 40)
	GUISetBkColor(0xABCDEF)
	_WinAPI_SetLayeredWindowAttributes($gui, 0x010101)
	GUISetState()
	
	$guicontrol = GUICreate("ControlGUI", 300, 400, 100, 100)
	$checkTrans = GUICtrlCreateCheckbox("Transparent color 0xABCDEF (Checked) Or 0x010101", 10, 10)
	$checkBorder = GUICtrlCreateCheckbox("POPUP-Style", 10, 30)
	GUICtrlCreateLabel("Transparency for Layered GUI", 10, 50)
	$slidTrans = GUICtrlCreateSlider(10, 70, 200, 30)
	GUICtrlSetLimit($slidTrans, 255, 0)
	GUICtrlSetData(-1, 255)
	GUISetState()

While 1
	$extMsg = GUIGetMsg(1)
	$msg = $extMsg[0]
	Switch $extMsg[1]
		Case $guicontrol
			Select
				Case $msg = $GUI_EVENT_CLOSE
					Exit
				Case $msg = $checkTrans Or $msg = $slidTrans
					
					; 改变透明颜色的属性和窗口透明度
					
					If BitAND(GUICtrlRead($checkTrans), $GUI_CHECKED) = $GUI_CHECKED Then
						_WinAPI_SetLayeredWindowAttributes($gui, 0xABCDEF, GUICtrlRead($slidTrans))
					Else
						_WinAPI_SetLayeredWindowAttributes($gui, 0x010101, GUICtrlRead($slidTrans))
					EndIf
					
				Case $msg = $checkBorder
					If BitAND(GUICtrlRead($checkBorder), $GUI_CHECKED) = $GUI_CHECKED Then
						GUISetStyle($WS_POPUP, -1, $gui)
					Else
						GUISetStyle($GUI_SS_DEFAULT_GUI, -1, $gui)
					EndIf
			EndSelect
		Case $gui
			Select
				Case $msg = $layButt
					Dim $transcolor, $alpha
					$info = _WinAPI_GetLayeredWindowAttributes($gui,$transcolor, $alpha)
					MsgBox(0, 'Layered GUI', "Button on layered Window Clicked" & @CRLF & "Information about this window: " & @CRLF & _
						"Transparent Color: " & $transcolor & @CRLF & _
						"Alpha Value: " & $alpha & @CRLF & _
						"LWA_COLORKEY: " & (BitAND($info,$LWA_COLORKEY)=$LWA_COLORKEY) & @CRLF & _
						"LWA_ALPHA: " & (BitAND($info,$LWA_ALPHA)=$LWA_ALPHA) 		)
				Case $msg = $GUI_EVENT_CLOSE
					Exit MsgBox(0, '', "Close from Layered GUI")
			EndSelect
	EndSwitch
WEnd
