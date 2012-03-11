﻿#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; 检查传递给函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

Global $hImage, $hStateImage

_Main()

Func _Main()

	Local $hItem[10], $hChildItem[30], $iYItem = 0, $iRand, $hInsert, $hTreeView
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)

	GUICreate("TreeView Insert Item", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 0 To 9
		$hItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Item", $x), $hTreeView)
		For $y = 1 To 3
			$hChildItem[$iYItem] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] New Child", $iYItem), $hItem[$x])
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	$iRand = Random(0, 9, 1)
	MsgBox(4160, "信息", StringFormat("Inserted after index %d: %s", $iRand, _GUICtrlTreeView_InsertItem($hTreeView, "Inserted Item", 0, $hItem[$iRand])))

	$iRand = Random(0, 29, 1)
	$hInsert = _GUICtrlTreeView_InsertItem($hTreeView, "Inserted Item", _GUICtrlTreeView_GetParentHandle($hTreeView, $hChildItem[$iRand]), $hChildItem[$iRand])
	MsgBox(4160, "信息", StringFormat("Inserted after child index %d: %s", $iRand, $hInsert))

	$hInsert = _GUICtrlTreeView_InsertItem($hTreeView, "Inserted first child Item", _GUICtrlTreeView_GetParentHandle($hTreeView, $hChildItem[$iRand]), $TVI_FIRST)
	MsgBox(4160, "信息", StringFormat("Inserted child index %d firsts: %s", $iRand, $hInsert))
	_GUICtrlTreeView_SelectItem($hTreeView, $hInsert)

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
