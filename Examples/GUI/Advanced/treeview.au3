#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("GUI ֮��� treeviews", 340, 200, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_MAXIMIZEBOX, $WS_GROUP, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU))

	Local $idTreeView = GUICtrlCreateTreeView(10, 10, 120, 150)
	Local $idAboutItem = GUICtrlCreateTreeViewItem("����", $idTreeView)
	Local $idGeneralItem = GUICtrlCreateTreeViewItem("����", $idTreeView)
	Local $idToolsItem = GUICtrlCreateTreeViewItem("����", $idTreeView)
	Local $idEffectItem = GUICtrlCreateTreeViewItem("Ч��", $idGeneralItem)
	Local $idStyleItem = GUICtrlCreateTreeViewItem("��ʽ", $idGeneralItem)
	GUICtrlCreateTreeViewItem("������", $idToolsItem)
	GUICtrlCreateTreeViewItem("����", $idToolsItem)

	Local $idDescriptionGroup = GUICtrlCreateGroup("��ϸ��Ϣ", 140, 105, 180, 55)
	GUICtrlSetState(-1, $GUI_HIDE)

	Local $idEffectsGroup = GUICtrlCreateGroup("Ч��", 140, 5, 180, 95)
	GUICtrlSetState(-1, $GUI_HIDE)
	Local $idEffectsTreeView = GUICtrlCreateTreeView(150, 20, 160, 70, BitOR($TVS_CHECKBOXES, $TVS_DISABLEDRAGDROP), $WS_EX_CLIENTEDGE)
	GUICtrlSetState(-1, $GUI_HIDE)
	Local $idEffect1 = GUICtrlCreateTreeViewItem("Ч�� 1", $idEffectsTreeView)
	GUICtrlCreateTreeViewItem("Ч�� 2", $idEffectsTreeView)
	Local $idEffect3 = GUICtrlCreateTreeViewItem("Ч�� 3", $idEffectsTreeView)
	GUICtrlCreateTreeViewItem("Ч�� 4", $idEffectsTreeView)
	GUICtrlCreateTreeViewItem("Ч�� 5", $idEffectsTreeView)

	Local $idStylesGroup = GUICtrlCreateGroup("��ʽ", 140, 5, 180, 95)
	GUICtrlSetState(-1, $GUI_HIDE)
	Local $idStylesTreeView = GUICtrlCreateTreeView(150, 20, 160, 70, BitOR($TVS_CHECKBOXES, $TVS_DISABLEDRAGDROP), $WS_EX_CLIENTEDGE)
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateTreeViewItem("��ʽ 1", $idStylesTreeView)
	GUICtrlCreateTreeViewItem("��ʽ 2", $idStylesTreeView)
	GUICtrlCreateTreeViewItem("��ʽ 3", $idStylesTreeView)
	Local $iStyle4 = GUICtrlCreateTreeViewItem("��ʽ 4", $idStylesTreeView)
	Local $idStyle5 = GUICtrlCreateTreeViewItem("��ʽ 5", $idStylesTreeView)

	Local $idAboutLabel = GUICtrlCreateLabel("��ֻ��һ��treeview��ʾ.", 160, 80, 160, 20)

	Local $idCancelButton = GUICtrlCreateButton("ȡ��", 130, 170, 85, 25)
	GUISetState(@SW_SHOW, $hGUI)

	GUICtrlSetState($idEffect1, $GUI_CHECKED)
	GUICtrlSetState($idEffect3, $GUI_CHECKED)
	GUICtrlSetState($idStyle4, $GUI_CHECKED)
	GUICtrlSetState($idStyle5, $GUI_CHECKED)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idCancelButton
				ExitLoop

			Case $idAboutItem
				GUICtrlSetState($idDescriptionGroup, $GUI_HIDE)
				GUICtrlSetState($idEffectsTreeView, $GUI_HIDE)
				GUICtrlSetState($idEffectsGroup, $GUI_HIDE)
				GUICtrlSetState($idStylesTreeView, $GUI_HIDE)
				GUICtrlSetState($idStylesGroup, $GUI_HIDE)
				GUICtrlSetState($idAboutLabel, $GUI_SHOW)

			Case $idEffectItem
				GUICtrlSetState($idStylesTreeView, $GUI_HIDE)
				GUICtrlSetState($idStylesGroup, $GUI_HIDE)
				GUICtrlSetState($idAboutLabel, $GUI_HIDE)
				GUICtrlSetState($idEffectsGroup, $GUI_SHOW)
				GUICtrlSetState($idDescriptionGroup, $GUI_SHOW)
				GUICtrlSetState($idEffectsTreeView, $GUI_SHOW)
				GUICtrlSetBkColor($idEffectsTreeView, 0xD0F0F0)

			Case $idStyleItem
				GUICtrlSetState($idEffectsTreeView, $GUI_HIDE)
				GUICtrlSetState($idEffectsGroup, $GUI_HIDE)
				GUICtrlSetState($idAboutLabel, $GUI_HIDE)
				GUICtrlSetState($idStylesGroup, $GUI_SHOW)
				GUICtrlSetState($idDescriptionGroup, $GUI_SHOW)
				GUICtrlSetState($idStylesTreeView, $GUI_SHOW)
				GUICtrlSetColor($idStylesTreeView, 0xD00000)
				GUICtrlSetBkColor($idStylesTreeView, 0xD0FFD0)

		EndSwitch
	WEnd
	GUIDelete($hGUI)
	Exit
EndFunc   ;==>Example
