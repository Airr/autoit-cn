#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

Example()

Func Example()
	Local $hTab

	; Create GUI
	GUICreate("Tab Control Get Highlight Item", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState()

	; Add tabs
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Highlight tab 2
	_GUICtrlTab_HighlightItem($hTab, 1)

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
