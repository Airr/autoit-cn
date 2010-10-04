﻿#AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; Check ClassName being passed to ListView functions, set to True and use a handle to another control to see it work

_Main()

Func _Main()
	Local $hListView
	
	GUICreate("ListView Delete Column", 400, 300)

	$hListView = GUICtrlCreateListView("col1|col2|col3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("line1|data1|more1", $hListView)
	GUICtrlCreateListViewItem("line2|data2|more2", $hListView)
	GUICtrlCreateListViewItem("line3|data3|more3", $hListView)
	GUICtrlCreateListViewItem("line4|data4|more4", $hListView)
	GUICtrlCreateListViewItem("line5|data5|more5", $hListView)
	GUISetState()
	
	MsgBox(4160, "Information", "Delete Column")
	_GUICtrlListView_DeleteColumn($hListView, 1)
	
	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main