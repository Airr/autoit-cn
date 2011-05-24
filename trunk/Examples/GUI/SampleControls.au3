; AutoIt 3.0.103 example
; 17 Jan 2005 - CyberSlug
; This script shows manual positioning of all controls;
;   there are much better methods of positioning...

#include <GuiConstantsEx.au3>
#include <AVIConstants.au3>
#include <TreeViewConstants.au3>

; GUI
GUICreate("GUI����", 400, 400)
GUISetIcon(@SystemDir & "\mspaint.exe", 0)


; �˵� 
$menu=GuiCtrlCreateMenu("�˵�1[&O]")
GUICtrlCreateMenuItem("�����˵�[&S]",$menu)
GUICtrlCreateMenu("�˵�2[&T]")
GUICtrlCreateMenu("�˵�3[&R]")
GUICtrlCreateMenu("�˵�4[&F]")

; CONTEXT MENU
Local $contextMenu = GUICtrlCreateContextMenu()
GUICtrlCreateMenuItem("�����Ĳ˵�", $contextMenu)
GUICtrlCreateMenuItem("", $contextMenu) ;separator
GUICtrlCreateMenuItem("����[&P]", $contextMenu)

; PIC
GUICtrlCreatePic("logo4.gif",0,0, 169,68)
GUICtrlCreateLabel("ͼƬ����:", 75, 1, 53, 15)
GUICtrlSetColor(-1,0xf11fff)


; AVI
GUICtrlCreateAvi("sampleAVI.avi",0, 180, 10, 32, 32, $ACS_AUTOPLAY)
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
Local $listView = GUICtrlCreateListView("�б�鿴|����|", 110, 190, 110, 80)
GUICtrlCreateListViewItem("A|һ", $listView)
GUICtrlCreateListViewItem("B|��", $listView)
GUICtrlCreateListViewItem("C|��", $listView)

; GROUP WITH RADIO BUTTONS
GUICtrlCreateGroup("������:", 230, 120)
GUICtrlCreateRadio("��ѡ1", 250, 140, 80)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateRadio("��ѡ2", 250, 165, 80)
GUICtrlCreateGroup ("",-99,-99,1,1)  ;close group

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
Local $treeOne = GUICtrlCreateTreeView(210, 290, 80, 80)
Local $treeItem = GUICtrlCreateTreeViewItem("�����б�", $treeOne)
GUICtrlCreateTreeViewItem("��Ŀ1", $treeItem)
GUICtrlCreateTreeViewItem("��Ŀ2", $treeItem)
GUICtrlCreateTreeViewItem("����Ŀ1", -1)
GUICtrlSetState($treeItem, $GUI_EXPAND)

; TREEVIEW TWO
Local $treeTwo = GUICtrlCreateTreeView(295, 290, 103, 80, $TVS_CHECKBOXES)
GUICtrlCreateTreeViewItem("�����б�2", $treeTwo)
GUICtrlCreateTreeViewItem("ʹ��", $treeTwo)
GUICtrlCreateTreeViewItem("��ѡ��ť", $treeTwo)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateTreeViewItem("��ʽ", $treeTwo)


; GUI MESSAGE LOOP
GUISetState()
While GUIGetMsg() <> $GUI_EVENT_CLOSE
WEnd