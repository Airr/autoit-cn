; ����:         Zedna

#include <GUIConstantsEx.au3>
#include <TreeviewConstants.au3>
#include <WindowsConstants.au3>

$gui = GUICreate("ControlTreeview ����", 212, 212)
$treeview = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
$h_tree = ControlGetHandle($gui, "", $treeview)

$root = GUICtrlCreateTreeViewItem("��", $treeview)
$item1 = GUICtrlCreateTreeViewItem("��Ŀ 1", $root)
$item2 = GUICtrlCreateTreeViewItem("��Ŀ 2", $root)
$item3 = GUICtrlCreateTreeViewItem("��Ŀ 3", $root)
$item4 = GUICtrlCreateTreeViewItem("��Ŀ 4", $root)
$item41 = GUICtrlCreateTreeViewItem("��Ŀ 41", $item4)
$item42 = GUICtrlCreateTreeViewItem("��Ŀ 42", $item4)
$item5 = GUICtrlCreateTreeViewItem("��Ŀ 5", $root)

GUISetState(@SW_SHOW)

; һЩ����
ControlTreeView ($gui, "", $h_tree, "Expand", "��")

ControlTreeView ($gui, "", $h_tree, "Exists", "��|��Ŀ 4")
ControlTreeView ($gui, "", $h_tree, "Check", "��|��Ŀ 4")
ControlTreeView ($gui, "", $h_tree, "Select", "��|��Ŀ 4")
ControlTreeView ($gui, "", $h_tree, "Expand", "��|��Ŀ 4")

While 1
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
	EndSelect
WEnd
