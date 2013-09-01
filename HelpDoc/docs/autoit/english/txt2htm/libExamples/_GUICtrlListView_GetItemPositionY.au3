#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iX, $iY, $hListView

	GUICreate("ListView Get Item Position Y", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; Add columns
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Add items
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Get item 2 position
	$iX = _GUICtrlListView_GetItemPositionX($hListView, 1)
	$iY = _GUICtrlListView_GetItemPositionY($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Item 2 Position : [%d, %d]", $iX, $iY))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
