; AutoIt GUI Example
; Created: 17/01/2005 - CyberSlug
; Modifed: 05/01/2011 - guinness

#include <GuiConstantsEx.au3>
#include <AVIConstants.au3>
#include <TreeViewConstants.au3>

; GUI
GUICreate("GUI����", 400, 400)
GUISetIcon(@SystemDir & "\mspaint.exe", 0)


; �˵� 
$menu=GUICtrlCreateMenu("�˵�1[&O]")
GUICtrlCreateMenuItem("�����˵�[&S]",$menu)
GUICtrlCreateMenu("�˵�2[&T]")
GUICtrlCreateMenu("�˵�3[&R]")
GUICtrlCreateMenu("�˵�4[&F]")

; CONTEXT MENU
Local $iContextMenu = GUICtrlCreateContextMenu()
GUICtrlCreateMenuItem("�����Ĳ˵�", $iContextMenu)
GUICtrlCreateMenuItem("", $iContextMenu) ; Separator
GUICtrlCreateMenuItem("����[&P]", $iContextMenu)

; PIC
GUICtrlCreatePic("logo4.gif", 0, 0, 169, 68)
GUICtrlCreateLabel("ͼƬ����:", 75, 1, 53, 15)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetColor(-1, 0xFFFFFF)


; AVI
GUICtrlCreateAvi("SampleAVI.avi", 0, 180, 10, 32, 32, $ACS_AUTOPLAY)
GUICtrlCreateLabel(" Avi����", 170, 50)


; TAB
GUICtrlCreateTab(240, 0, 150, 70)
GUICtrlCreateTabItem("��һҳ")
GUICtrlCreateLabel("Tab ��ǩ����", 250, 40)
GUICtrlCreateTabItem("�ڶ�ҳ")
GUICtrlCreateTabItem("����ҳ")
GUICtrlCreateTabItem("")

; COMBO
GUICtrlCreateCombo("��Ͽ�����", 250, 80, 120, 100)

; PROGRESS
GUICtrlCreateProgress(60, 80, 150, 20)
GUICtrlSetData(-1, 60)
GUICtrlCreateLabel("����������:", 5, 82)

; EDIT
GUICtrlCreateEdit(@CRLF & "  �༭������", 10, 110, 150, 70)

; LIST
GUICtrlCreateList("", 5, 190, 100, 90)
GUICtrlSetData(-1, "a.�б�|b.����|c.��|d.����", "b.�б�")

; ICON
GUICtrlCreateIcon("shell32.dll", 1, 175, 120)
GUICtrlCreateLabel("ͼ��", 180, 160, 50, 20)

; LIST VIEW
Local $iListView = GUICtrlCreateListView("�б�鿴|����|", 110, 190, 110, 80)
GUICtrlCreateListViewItem("A|һ", $iListView)
GUICtrlCreateListViewItem("B|��", $iListView)
GUICtrlCreateListViewItem("C|��", $iListView)

; GROUP WITH RADIO BUTTONS
GUICtrlCreateGroup("������:", 230, 120)
GUICtrlCreateRadio("��ѡ1", 250, 140, 80)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateRadio("��ѡ2", 250, 165, 80)
GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

; UPDOWN
GUICtrlCreateLabel("��������", 350, 115)
GUICtrlCreateInput("42", 350, 130, 40, 20)
GUICtrlCreateUpdown(-1)

; LABEL
GUICtrlCreateLabel("��ɫ" & @CRLF & "��ǩ����", 350, 165, 40, 40)
GUICtrlSetBkColor(-1, 0x00FF00)

; SLIDER
GUICtrlCreateLabel("������:", 235, 215)
GUICtrlCreateSlider(270, 210, 120, 30)
GUICtrlSetData(-1, 30)

; INPUT
GUICtrlCreateInput("���������", 235, 255, 130, 20)

; DATE
GUICtrlCreateDate("", 5, 280, 200, 20)
GUICtrlCreateLabel("(����ѡ������)", 10, 305, 200, 20)

; BUTTON
GUICtrlCreateButton("��ť����", 10, 330, 100, 30)

; CHECKBOX
GUICtrlCreateCheckbox("��ѡ��ť", 130, 335, 80, 20)
GUICtrlSetState(-1, $GUI_CHECKED)

; TREEVIEW ONE
Local $iTreeView_1 = GUICtrlCreateTreeView(210, 290, 80, 80)
Local $iTreeItem = GUICtrlCreateTreeViewItem("�����б�", $iTreeView_1)
GUICtrlCreateTreeViewItem("��Ŀ1", $iTreeItem)
GUICtrlCreateTreeViewItem("��Ŀ2", $iTreeItem)
GUICtrlCreateTreeViewItem("����Ŀ1", -1)
GUICtrlSetState($iTreeItem, $GUI_EXPAND)

; TREEVIEW TWO
Local $iTreeView_2 = GUICtrlCreateTreeView(295, 290, 103, 80, $TVS_CHECKBOXES)
GUICtrlCreateTreeViewItem("�����б�2", $iTreeView_2)
GUICtrlCreateTreeViewItem("ʹ��", $iTreeView_2)
GUICtrlCreateTreeViewItem("��ѡ��ť", $iTreeView_2)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateTreeViewItem("��ʽ", $iTreeView_2)


; GUI MESSAGE LOOP
GUISetState(@SW_SHOW)
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd