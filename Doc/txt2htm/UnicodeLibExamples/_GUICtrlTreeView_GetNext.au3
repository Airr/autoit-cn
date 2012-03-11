﻿#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; 检查传递给函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

_Main()

Func _Main()

	Local $hItem[10], $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView Get Next", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 3
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $x + 1), $hTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Child", $y), $hItem[$x])
		Next
	Next
	$hItem[4] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", 5), $hTreeView)
	For $x = 5 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $x + 1), $hTreeView)
		For $y = 1 To Random(2, 10, 1)
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Child", $y), $hItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	MsgBox(4160, "信息", "Index 2, Next: " & _GUICtrlTreeView_GetNext($hTreeView, $hItem[2]))
	_GUICtrlTreeView_SelectItem($hTreeView, _GUICtrlTreeView_GetNext($hTreeView, $hItem[2]))

	MsgBox(4160, "信息", "Index 4, Next: " & _GUICtrlTreeView_GetNext($hTreeView, $hItem[4]))
	_GUICtrlTreeView_SelectItem($hTreeView, _GUICtrlTreeView_GetNext($hTreeView, $hItem[4]))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
