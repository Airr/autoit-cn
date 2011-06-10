﻿#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; 检查传递给 MonthCal 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

Global $hMonthCal, $iMemo, $hGUI

_Main()

Func _Main()

	; 创建 GUI
	$hGUI = GUICreate("Month Calendar Hit Test", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; 创建 memo 控件
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 循环直到用户退出
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_MOUSEMOVE
				DoHitTest()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>_Main

; 执行点击测试
Func DoHitTest()
	Local $tHit

	$tHit = _GUICtrlMonthCal_HitTest($hMonthCal, _WinAPI_GetMousePosX(True, $hGUI), _WinAPI_GetMousePosY(True, $hGUI))
	If BitAND(DllStructGetData($tHit, "Hit"), $MCHT_CALENDARDATE) <> 0 Then
		MemoWrite("Date: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tHit, "Month"), _
				DllStructGetData($tHit, "Day"), _
				DllStructGetData($tHit, "Year")))
	EndIf
EndFunc   ;==>DoHitTest

; 写入消息到 memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
