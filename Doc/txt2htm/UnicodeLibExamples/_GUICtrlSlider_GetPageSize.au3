﻿#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $hSlider

	; 创建 GUI
	GUICreate("Slider Get Page Size", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Get Page Size
	MsgBox(4160, "Information", "Page Size: " & _GUICtrlSlider_GetPageSize($hSlider))

	; Set Page Size
	_GUICtrlSlider_SetPageSize($hSlider, 4)

	; Get Page Size
	MsgBox(4160, "Information", "Page Size: " & _GUICtrlSlider_GetPageSize($hSlider))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
