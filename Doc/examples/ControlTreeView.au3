; ���������:         Zedna

#include <GUIConstantsEx.au3>
#include <TreeviewConstants.au3>
#include <WindowsConstants.au3>

$gui = GUICreate("����ͼ�������", 212, 212)
$treeview = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
$h_tree = ControlGetHandle($gui, "", $treeview)

$root = GUICtrlCreateTreeViewItem("��Ŀ¼", $treeview)
$item1 = GUICtrlCreateTreeViewItem("���� 1", $root)
$item2 = GUICtrlCreateTreeViewItem("���� 2", $root)
$item3 = GUICtrlCreateTreeViewItem("���� 3", $root)
$item4 = GUICtrlCreateTreeViewItem("���� 4", $root)
$item41 = GUICtrlCreateTreeViewItem("���� 41", $item4)
$item42 = GUICtrlCreateTreeViewItem("���� 42", $item4)
$item5 = GUICtrlCreateTreeViewItem("���� 5", $root)

GUISetState(@SW_SHOW)

; һЩ����
ControlTreeView ($gui, "", $h_tree, "Expand", "��Ŀ¼")

ControlTreeView ($gui, "", $h_tree, "Exists", "��Ŀ¼|���� 4")
ControlTreeView ($gui, "", $h_tree, "Check", "��Ŀ¼|���� 4")
ControlTreeView ($gui, "", $h_tree, "Select", "��Ŀ¼|���� 4")
ControlTreeView ($gui, "", $h_tree, "Expand", "��Ŀ¼|���� 4")

While 1
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
	EndSelect
WEnd
