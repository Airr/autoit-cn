﻿#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

_Main()

Func _Main()
	Local $hGUI, $hSlider

	; 创建 GUI
	$hGUI = GUICreate("(UDF Created) Slider Destroy", 400, 296)
	$hSlider = _GUICtrlSlider_Create($hGUI, 2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	GUISetState()

	MsgBox(4160, "Information", "Destroy Slider")
	_GUICtrlSlider_Destroy($hSlider)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
