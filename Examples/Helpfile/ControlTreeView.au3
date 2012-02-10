#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
Local $hGUI = GUICreate("ControlTreeView ����", 212, 212)
	Local $iTreeView_1 = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
	Local $hTreeView_1 = ControlGetHandle($hGUI, "", $iTreeView_1)

	Local $iRoot = GUICtrlCreateTreeViewItem("��", $iTreeView_1)
	GUICtrlCreateTreeViewItem("��Ŀ 1", $iRoot)
	GUICtrlCreateTreeViewItem("��Ŀ 2", $iRoot)
	GUICtrlCreateTreeViewItem("��Ŀ 3", $iRoot)
	Local $iItem_4 = GUICtrlCreateTreeViewItem("��Ŀ 4", $iRoot)
	GUICtrlCreateTreeViewItem("��Ŀ 4.1", $iItem_4)
	GUICtrlCreateTreeViewItem("��Ŀ 4.2", $iItem_4)
	GUICtrlCreateTreeViewItem("��Ŀ 5", $iRoot)

	GUISetState(@SW_SHOW, $hGUI)

	ControlTreeView ($hGUI, "", $hTreeView_1, "Expand", "��")

	ControlTreeView ($hGUI, "", $hTreeView_1, "Exists", "��|��Ŀ 4")
	ControlTreeView ($hGUI, "", $hTreeView_1, "Check", "��|��Ŀ 4")
	ControlTreeView ($hGUI, "", $hTreeView_1, "Select", "��|��Ŀ 4")
	ControlTreeView ($hGUI, "", $hTreeView_1, "Expand", "��|��Ŀ 4")

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
