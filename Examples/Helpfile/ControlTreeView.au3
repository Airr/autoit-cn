; ����:         Zedna

#include <GUIConstantsEx.au3>
#include <TreeviewConstants.au3>
#include <WindowsConstants.au3>

Local $gui = GUICreate("ControlTreeview ����", 212, 212)
Local $treeview = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
Local $h_tree = ControlGetHandle($gui, "", $treeview)

Local $root = GUICtrlCreateTreeViewItem("��", $treeview)
GUICtrlCreateTreeViewItem("��Ŀ 1", $root)
GUICtrlCreateTreeViewItem("��Ŀ 2", $root)
GUICtrlCreateTreeViewItem("��Ŀ 3", $root)
Local $item4 = GUICtrlCreateTreeViewItem("��Ŀ 4", $root)
GUICtrlCreateTreeViewItem("��Ŀ 41", $item4)
GUICtrlCreateTreeViewItem("��Ŀ 42", $item4)
GUICtrlCreateTreeViewItem("��Ŀ 5", $root)

GUISetState(@SW_SHOW)

; һЩ����
ControlTreeView ($gui, "", $h_tree, "Expand", "��")

ControlTreeView ($gui, "", $h_tree, "Exists", "��|��Ŀ 4")
ControlTreeView ($gui, "", $h_tree, "Check", "��|��Ŀ 4")
ControlTreeView ($gui, "", $h_tree, "Select", "��|��Ŀ 4")
ControlTreeView ($gui, "", $h_tree, "Expand", "��|��Ŀ 4")

While 1
	Local $msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
	EndSelect
WEnd
