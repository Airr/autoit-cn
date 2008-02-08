; AutoIt 3.0.103 example
; 17 Jan 2005 - CyberSlug
; This script shows manual positioning of all controls;
;   there are much better methods of positioning...
#include <GuiConstantsEx.au3>
#include <AVIConstants.au3>
#include <TreeViewConstants.au3>

; GUI
GuiCreate("GUI����", 400, 400)
GuiSetIcon(@SystemDir & "\mspaint.exe", 0)


; �˵� 
$menu=GuiCtrlCreateMenu("�˵�1[&O]")
GUICtrlCreateMenuItem("�����˵�[&S]",$menu)
GuiCtrlCreateMenu("�˵�2[&T]")
GuiCtrlCreateMenu("�˵�3[&R]")
GuiCtrlCreateMenu("�˵�4[&F]")

; CONTEXT MENU
$contextMenu = GuiCtrlCreateContextMenu()
GuiCtrlCreateMenuItem("�����Ĳ˵�", $contextMenu)
GuiCtrlCreateMenuItem("", $contextMenu) ;separator
GuiCtrlCreateMenuItem("����[&P]", $contextMenu)

; PIC
GuiCtrlCreatePic("logo4.gif",0,0, 169,68)
GuiCtrlCreateLabel("ͼƬ����:", 75, 1, 55, 15)
GuiCtrlSetColor(-1,0xf11fff)


; AVI
GuiCtrlCreateAvi("sampleAVI.avi",0, 180, 10, 32, 32, $ACS_AUTOPLAY)
GuiCtrlCreateLabel(" Avi����", 170, 50)


; TAB
GuiCtrlCreateTab(240, 0, 150, 70)
GuiCtrlCreateTabItem("��һҳ")
GuiCtrlCreateLabel("Tab ��ǩ����", 250, 40)
GuiCtrlCreateTabItem("�ڶ�ҳ")
GuiCtrlCreateTabItem("����ҳ")
GuiCtrlCreateTabItem("")

; COMBO
GuiCtrlCreatecombo("��Ͽ�����", 250, 80, 120, 100)

; PROGRESS
GuiCtrlCreateProgress(85, 80, 130, 20)
GuiCtrlSetData(-1, 60)
GuiCtrlCreateLabel("����������:", 5, 82)

; EDIT
GuiCtrlCreateEdit(@CRLF & "  �༭������", 10, 110, 150, 70)

; LIST
GuiCtrlCreateList("", 5, 190, 100, 90)
GuiCtrlSetData(-1, "a.�б�|b.����|c.��|d.����", "b.�б�")

; ICON
GuiCtrlCreateIcon("shell32.dll", 2, 175, 120)
GuiCtrlCreateLabel("ͼ��", 180, 160, 50, 20)

; LIST VIEW
$listView = GuiCtrlCreateListView("�б�鿴|����|", 110, 190, 110, 80)
GuiCtrlCreateListViewItem("A|һ", $listView)
GuiCtrlCreateListViewItem("B|��", $listView)
GuiCtrlCreateListViewItem("C|��", $listView)

; GROUP WITH RADIO BUTTONS
GuiCtrlCreateGroup("������:", 230, 120)
GuiCtrlCreateRadio("��ѡ1", 250, 140, 80)
GuiCtrlSetState(-1, $GUI_CHECKED)
GuiCtrlCreateRadio("��ѡ2", 250, 165, 80)
GUICtrlCreateGroup ("",-99,-99,1,1)  ;close group

; UPDOWN
GuiCtrlCreateLabel("��������", 350, 115)
GuiCtrlCreateInput("42", 350, 130, 40, 20)
GuiCtrlCreateUpDown(-1)

; LABEL
GuiCtrlCreateLabel("��ɫ" & @CRLF & "��ǩ����", 350, 165, 40, 40)
GuiCtrlSetBkColor(-1, 0x00FF00)

; SLIDER
GuiCtrlCreateLabel("������:", 235, 215)
GuiCtrlCreateSlider(270, 210, 120, 30)
GuiCtrlSetData(-1, 30)

; INPUT
GuiCtrlCreateInput("���������", 235, 255, 130, 20)

; DATE
GuiCtrlCreateDate("", 5, 280, 200, 20)
GuiCtrlCreateLabel("(����ѡ������)", 10, 305, 200, 20)

; BUTTON
GuiCtrlCreateButton("��ť����", 10, 330, 100, 30)

; CHECKBOX
GuiCtrlCreateCheckbox("��ѡ��ť", 130, 335, 80, 20)
GuiCtrlSetState(-1, $GUI_CHECKED)

; TREEVIEW ONE
$treeOne = GuiCtrlCreateTreeView(210, 290, 80, 80)
$treeItem = GuiCtrlCreateTreeViewItem("�����б�", $treeOne)
GuiCtrlCreateTreeViewItem("��Ŀ1", $treeItem)
GuiCtrlCreateTreeViewItem("��Ŀ2", $treeItem)
GuiCtrlCreateTreeViewItem("����Ŀ1", -1)
GuiCtrlSetState($treeItem, $GUI_EXPAND)

; TREEVIEW TWO
$treeTwo = GuiCtrlCreateTreeView(295, 290, 103, 80, $TVS_CHECKBOXES)
GuiCtrlCreateTreeViewItem("�����б�2", $treeTwo)
GuiCtrlCreateTreeViewItem("ʹ��", $treeTwo)
GuiCtrlCreateTreeViewItem("��ѡ��ť", $treeTwo)
GuiCtrlSetState(-1, $GUI_CHECKED)
GuiCtrlCreateTreeViewItem("��ʽ", $treeTwo)


; GUI MESSAGE LOOP
GuiSetState()
While GuiGetMsg() <> $GUI_EVENT_CLOSE
WEnd