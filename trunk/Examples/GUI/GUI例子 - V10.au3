#NoTrayIcon
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiButton.au3>
#include <GuiImageList.au3>
#include <GuiStatusBar.au3>
#include <ComboConstants.au3>
#include <AVIConstants.au3>
#include <GuiTreeView.au3>
#include <Timers.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

$Reg = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt", "InstallDir");��ȡע���AUTOIT V3��װĿ¼
SplashImageOn("", $Reg & "\Examples\GUI\logo4.gif", 169, 68, -1, -1, 1);��������ͼƬ
;-----------------------------------------------------------------------------------------------
Local $aParts[3] = [200, 400, -1];����״̬��

$Form1 = GUICreate("GUI����", 720, 550, -1, -1, $WS_OVERLAPPEDWINDOW);����һ�� GUI ����
GUISetIcon(@SystemDir & "\mspaint.exe", 0);���ô���ͼ��
;-----------------------------------------------------------------------------------------------
$menu_A = GUICtrlCreateMenu("�˵�1[&O]");����һ���˵��ؼ�
$menu_A1 = GUICtrlCreateMenuItem("����[&S]", $menu_A);����һ���˵���Ŀ�ؼ�
GUICtrlCreateMenu("�˵�2[&T]");����һ���˵��ؼ�
;-----------------------------------------------------------------------------------------------

$contextMenu = GUICtrlCreateContextMenu();����һ�������Ĳ˵�
GUICtrlCreateMenuItem("�����Ĳ˵�", $contextMenu);����һ���˵���Ŀ�ؼ�
GUICtrlCreateMenuItem("", $contextMenu);����һ���˵���Ŀ�ؼ�
$contextMenu1 = GUICtrlCreateMenuItem("����[&P]", $contextMenu);����һ���˵���Ŀ�ؼ�
;-----------------------------------------------------------------------------------------------
;����һ����̬��ǩ(Label)�ؼ�
$Label_A1 = GUICtrlCreateLabel("", 180, 0, 1, 70, $SS_ETCHEDHORZ);����
$Label_A2 = GUICtrlCreateLabel("", 250, 0, 1, 70, $SS_ETCHEDHORZ);����
$Label_A3 = GUICtrlCreateLabel("", 320, 0, 1, 70, $SS_ETCHEDHORZ);����
$Label_A4 = GUICtrlCreateLabel("", 448, 0, 1, 70, $SS_ETCHEDHORZ);����
$Label_A5 = GUICtrlCreateLabel("", 530, 0, 1, 70, $SS_ETCHEDHORZ);����
$Label_A6 = GUICtrlCreateLabel("", 530, 69, 2000, 1, $SS_ETCHEDHORZ);����

GUICtrlSetResizing($Label_A1, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_A2, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_A3, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_A4, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_A5, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_A6, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
;-----------------------------------------------------------------------------------------------
GUICtrlCreatePic($Reg & "\Examples\GUI\logo4.gif", 0, 0, 169, 68);����ͼƬ

$CreateAvi1 = GUICtrlCreateAvi($Reg & "\Examples\GUI\sampleAVI.avi", 0, 200, 10, 32, 32, $ACS_AUTOPLAY);����һ��AVI��Ƶ�����ؼ�
GUICtrlSetResizing($CreateAvi1, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ

$CreateIcon1 = GUICtrlCreateIcon("shell32.dll", 2, 265, 10);����һ��ͼ��(Icon)�ؼ�
GUICtrlSetResizing($CreateIcon1, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ

$ButtonA_1 = GUICtrlCreateButton("1", 365, 5, 40, 40, $BS_ICON);����һ��ͼ�갴ť
GUICtrlSetImage($ButtonA_1, "shell32.dll", 5);����ָ���ؼ���λͼ��ͼ��
GUICtrlSetResizing($ButtonA_1, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ

$ButtonA_2 = GUICtrlCreateButton("2", 470, 5, 40, 40, $BS_ICON);����һ��ͼ�갴ť
GUICtrlSetImage($ButtonA_2, "shell32.dll", 22);����ָ���ؼ���λͼ��ͼ��
GUICtrlSetResizing($ButtonA_2, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ

;����һ����̬��ǩ(Label)�ؼ�
$Label_B1 = GUICtrlCreateLabel("ͼƬ����", 120, 0, 55, 15)
$Label_B2 = GUICtrlCreateLabel("Avi����", 195, 50)
$Label_B3 = GUICtrlCreateLabel("ͼ������", 260, 50)
$Label_B4 = GUICtrlCreateLabel("�ļ���ѡ��Ի�������", 325, 50, 120, 17)
$Label_B5 = GUICtrlCreateLabel("ͼ�갴ť����", 455, 50, 72, 17)
$Label_B6 = GUICtrlCreateLabel("AutoItCN �ٷ�����Ⱥ", 550, 10, 150, 17)
$Label_B7 = GUICtrlCreateLabel("40672266", 565, 30, 150, 22)

GUICtrlSetResizing($Label_B1, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_B2, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_B3, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_B4, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_B5, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_B6, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ
GUICtrlSetResizing($Label_B7, $GUI_DOCKALL);����ĳ���ؼ��Ĵ�С������ʽ

GUICtrlSetBkColor($Label_B4, 0x00FF00);����ָ���ؼ��ı�����ɫ
GUICtrlSetBkColor($Label_B5, 0xFFFF00);����ָ���ؼ��ı�����ɫ
GUICtrlSetColor($Label_B6, 0x0000ff) ;�����ı���ɫ
GUICtrlSetColor($Label_B7, 0xff0000) ;�����ı���ɫ

GUICtrlSetFont($Label_B6, 10, 400, 4) ;��������Ч��
GUICtrlSetFont($Label_B7, 18, 400, 0) ;��������Ч��
;-----------------------------------------------------------------------------------------------
;����һ������(Group)�ؼ�
$CreateGroup1 = GUICtrlCreateGroup("TreeView �ؼ�����", 10, 70, 200, 430)
GUICtrlSetResizing($CreateGroup1, 2 + 32 + 64 + 256);����ĳ���ؼ��Ĵ�С������ʽ

;����һ��TreeView�ؼ�
$hTreeView = GUICtrlCreateTreeView(20, 90, 180, 400, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS), $WS_EX_CLIENTEDGE)
GUICtrlSetResizing($hTreeView, 2 + 32 + 64 + 256);����ĳ���ؼ��Ĵ�С������ʽ

$menu_B = GUICtrlCreateContextMenu($hTreeView);���������Ĳ˵�(�Ҽ�)
$menu_B1 = GUICtrlCreateMenuItem("��ȡ��ʽ(1)", $menu_B);����һ���˵���Ŀ�ؼ�
$menu_B2 = GUICtrlCreateMenuItem("��ȡ��ʽ(2)", $menu_B);����һ���˵���Ŀ�ؼ�
GUICtrlCreateMenuItem("", $menu_B);����һ���˵���Ŀ�ؼ�
$menu_B3 = GUICtrlCreateMenuItem("��ȡ��ʽ(3)", $menu_B);����һ���˵���Ŀ�ؼ�
;-----------------------------------------------------------------------------------------------
;����һ������(Group)�ؼ�
$CreateGroup2 = GUICtrlCreateGroup("ListView �ؼ�����", 220, 70, 490, 430)
GUICtrlSetResizing($CreateGroup2, $GUI_DOCKBORDERS);����ĳ���ؼ��Ĵ�С������ʽ

;����һ������б��(ComboBox)�ؼ�
$Driver = GUICtrlCreateCombo("", 230, 270, 365, 21, BitOR($GUI_SS_DEFAULT_COMBO, $CBS_SIMPLE))
GUICtrlSetResizing($Driver, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKMENUBAR);����ĳ���ؼ��Ĵ�С������ʽ

;����һ�� ListView �ؼ�
$hListView1 = GUICtrlCreateListView("����|����|��ʽ|���ÿռ�|�ܴ�С", 230, 90, 365, 175)
_GUICtrlListView_SetExtendedListViewStyle($hListView1, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES));�������
_GUICtrlListView_SetColumn($hListView1, 0, "����", 50, 2);����������
_GUICtrlListView_SetColumn($hListView1, 1, "����", 90, 2)
_GUICtrlListView_SetColumn($hListView1, 2, "��ʽ", 60, 2)
_GUICtrlListView_SetColumn($hListView1, 3, "���ÿռ�", 70, 2)
_GUICtrlListView_SetColumn($hListView1, 4, "�ܴ�С", 70, 2)
GUICtrlSetColor($hListView1, 0x0055ff);����ָ���ؼ����ı���ɫ
GUICtrlSetResizing($hListView1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKMENUBAR);����ĳ���ؼ��Ĵ�С������ʽ

$menu_C = GUICtrlCreateContextMenu($hListView1);���������Ĳ˵�(�Ҽ�)
$menu_C1 = GUICtrlCreateMenuItem("��ȡ����(1)", $menu_C);����һ���˵���Ŀ�ؼ�
GUICtrlCreateMenuItem("", $menu_C);����һ���˵���Ŀ�ؼ�
$menu_C2 = GUICtrlCreateMenuItem("��ȡ����(2)", $menu_C);����һ���˵���Ŀ�ؼ�
;-----------------------------------------------------------------------------------------------
$ButtonB_1 = GUICtrlCreateButton("����(&A)", 600, 90, 100, 30, $BS_PUSHLIKE);����һ����ť�ؼ�
_GUICtrlButton_SetImageList($ButtonB_1, _set_button_image(1), 5);����һ��ͼ���б���ť�ؼ�(Сͼ��Ч��)
GUICtrlSetResizing($ButtonB_1, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT);����ĳ���ؼ��Ĵ�С������ʽ

$ButtonB_2 = GUICtrlCreateButton("����(&B)", 600, 125, 100, 30, $BS_PUSHLIKE);����һ����ť�ؼ�
_GUICtrlButton_SetImageList($ButtonB_2, _set_button_image(2), 1);����һ��ͼ���б���ť�ؼ�(Сͼ��Ч��)
GUICtrlSetResizing($ButtonB_2, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT);����ĳ���ؼ��Ĵ�С������ʽ

$ButtonB_3 = GUICtrlCreateButton("��ʽ(&C)", 600, 160, 100, 30, $BS_PUSHLIKE);����һ����ť�ؼ�
_GUICtrlButton_SetImageList($ButtonB_3, _set_button_image(3), 5);����һ��ͼ���б���ť�ؼ�(Сͼ��Ч��)
GUICtrlSetResizing($ButtonB_3, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT);����ĳ���ؼ��Ĵ�С������ʽ

$ButtonB_4 = GUICtrlCreateButton("���ÿռ�(&D)", 600, 230, 100, 30, $BS_PUSHLIKE);����һ����ť�ؼ�
GUICtrlSetResizing($ButtonB_4, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT);����ĳ���ؼ��Ĵ�С������ʽ

$ButtonB_5 = GUICtrlCreateButton("�ܴ�С(&E)", 600, 195, 100, 30, $BS_PUSHLIKE);����һ����ť�ؼ�
GUICtrlSetResizing($ButtonB_5, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT);����ĳ���ؼ��Ĵ�С������ʽ

$ButtonB_6 = GUICtrlCreateButton("<<-��ȡ(&F)", 600, 265, 100, 30, $BS_PUSHLIKE);����һ����ť�ؼ�
GUICtrlSetResizing($ButtonB_6, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT);����ĳ���ؼ��Ĵ�С������ʽ
;-----------------------------------------------------------------------------------------------
$hListView2 = GUICtrlCreateListView("", 230, 300, 365, 190, $WS_BORDER);;����һ�� ListView �ؼ� $WS_BORDER���ϸ�߿�
_GUICtrlListView_SetExtendedListViewStyle($hListView2, BitOR($LVS_EX_CHECKBOXES, $LVS_EX_FULLROWSELECT, $LVS_EX_DOUBLEBUFFER))
_GUICtrlListView_SetView($hListView2, 4);������ʽ����ѡ(1��2��3��4)
GUICtrlSetResizing($hListView2, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKBOTTOM);����ĳ���ؼ��Ĵ�С������ʽ
;-----------------------------------------------------------------------------------------------
$ButtonC_1 = GUICtrlCreateButton("<<-��ȡ", 600, 300, 100, 40);����һ����ť�ؼ�
_GUICtrlButton_SetImageList($ButtonC_1, _set_button_image_max(3), 1);����һ��ͼ���б���ť�ؼ�(��ͼ��Ч��)
GUICtrlSetResizing($ButtonC_1, $GUI_DOCKRIGHT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT);����ĳ���ؼ��Ĵ�С������ʽ

$CreateGroup3 = GUICtrlCreateGroup("ѡ�����ʽ", 600, 350, 100, 140);����һ������(Group)�ؼ�
GUICtrlSetResizing($CreateGroup3, 4 + 32 + 64 + 256);����ĳ���ؼ��Ĵ�С������ʽ

$radio1 = GUICtrlCreateRadio("A", 630, 365, 30, 20);����һ����ѡ��(Radio)�ؼ�
GUICtrlSetResizing($radio1, 4 + 32 + 256);����ĳ���ؼ��Ĵ�С������ʽ

$radio2 = GUICtrlCreateRadio("B", 630, 395, 30, 20);����һ����ѡ��(Radio)�ؼ�
GUICtrlSetResizing($radio2, 4 + 32 + 256);����ĳ���ؼ��Ĵ�С������ʽ

$radio3 = GUICtrlCreateRadio("C", 630, 425, 30, 20);����һ����ѡ��(Radio)�ؼ�
GUICtrlSetResizing($radio3, 4 + 32 + 256);����ĳ���ؼ��Ĵ�С������ʽ

$radio4 = GUICtrlCreateRadio("D", 630, 455, 30, 20);����һ����ѡ��(Radio)�ؼ�
GUICtrlSetResizing($radio4, 4 + 32 + 256);����ĳ���ؼ��Ĵ�С������ʽ
;-----------------------------------------------------------------------------------------------
_DisksType();��ȡӲ���Լ�������Ϣ������TreeView�ؼ�����ʾ

$var = DriveGetDrive("ALL");����һ������ָ���������̷�������
If Not @error Then
	For $i = 1 To $var[0]
		Dim $Vars[$var[0] + 1]

		$Vars[$i] = StringUpper($var[$i]);ת���ַ���Ϊ��д��ĸ
		$DriveType = DriveGetType($var[$i]);������������
		$DriveFile = DriveGetFileSystem($var[$i]);��ʽ
		$DriveFree = DriveSpaceFree($var[$i]);���ÿռ�
		$DriveFreeGB = ByteConversion($DriveFree);��λת��
		$DriveTotal = DriveSpaceTotal($var[$i]);�ܴ�С
		$DriveTotalGB = ByteConversion($DriveTotal);��λת��

		;�޸�����б��ؼ�������
		GUICtrlSetData($Driver, $Vars[$i] & "  " & $DriveType & "  " & $DriveFile & "  " & $DriveFreeGB & "  " & $DriveTotalGB, _
				$Vars[1] & "  " & $DriveType & "  " & $DriveFile & "  " & $DriveFreeGB & "  " & $DriveTotalGB)

		If $DriveType = "Unknown" Then;�ж��������Ƿ� Unknown ����

		ElseIf $DriveType = "Removable" Then;�ж��������Ƿ� Removable ����
			$DriveTypeS = "���ƶ�������"
			;����һ�� ListView ��Ŀ�ؼ�
			GUICtrlCreateListViewItem($Vars[$i] & "|" & $DriveTypeS & "|" & $DriveFile & "|" & $DriveFreeGB & "|" & $DriveTotalGB, $hListView1)
			GUICtrlSetImage(-1, "shell32.dll", 8);����ָ���ؼ���λͼ��ͼ��

			GUICtrlCreateListViewItem("����  " & $Vars[$i] & @CRLF & "[���ÿռ䣺" & $DriveFreeGB & "][�ܴ�С��" & $DriveTotalGB & "]", $hListView2)
			GUICtrlSetImage(-1, "shell32.dll", 8);����ָ���ؼ���λͼ��ͼ��
			; ��������1
			$x = _GUICtrlListView_GetCounterPage($hListView2) - 1;�����ڿ��������пɴ�ֱ��ʾ����Ŀ����
			_GUICtrlListView_EnableGroupView($hListView2);���ÿؼ��е���Ŀ������ʾ
			_GUICtrlListView_InsertGroup($hListView2, -1, 1, "Removable");�������
			_GUICtrlListView_SetItemGroupID($hListView2, $x, 1);������Ŀ������

		ElseIf $DriveType = "Fixed" Then;�ж��������Ƿ� Fixed ����
			$DriveTypeS = "�̶�������"
			;����һ�� ListView ��Ŀ�ؼ�
			GUICtrlCreateListViewItem($Vars[$i] & "|" & $DriveTypeS & "|" & $DriveFile & "|" & $DriveFreeGB & "|" & $DriveTotalGB, $hListView1)
			GUICtrlSetImage(-1, "shell32.dll", 9);����ָ���ؼ���λͼ��ͼ��

			GUICtrlCreateListViewItem("����  " & $Vars[$i] & @CRLF & "[���ÿռ䣺" & $DriveFreeGB & "][�ܴ�С��" & $DriveTotalGB & "]", $hListView2)
			GUICtrlSetImage(-1, "shell32.dll", 9);����ָ���ؼ���λͼ��ͼ��
			; ��������2
			$x = _GUICtrlListView_GetCounterPage($hListView2) - 1;�����ڿ��������пɴ�ֱ��ʾ����Ŀ����
			_GUICtrlListView_EnableGroupView($hListView2);���ÿؼ��е���Ŀ������ʾ
			_GUICtrlListView_InsertGroup($hListView2, -1, 2, "Fixed");�������
			_GUICtrlListView_SetItemGroupID($hListView2, $x, 2);������Ŀ������

		ElseIf $DriveType = "Network" Then;�ж��������Ƿ� Network ����
			$DriveTypeS = "����������"
			;����һ�� ListView ��Ŀ�ؼ�
			GUICtrlCreateListViewItem($Vars[$i] & "|" & $DriveTypeS & "|" & $DriveFile & "|" & $DriveFreeGB & "|" & $DriveTotalGB, $hListView1)
			GUICtrlSetImage(-1, "shell32.dll", 10)

			GUICtrlCreateListViewItem("����  " & $Vars[$i] & @CRLF & "[���ÿռ䣺" & $DriveFreeGB & "][�ܴ�С��" & $DriveTotalGB & "]", $hListView2)
			GUICtrlSetImage(-1, "shell32.dll", 10);����ָ���ؼ���λͼ��ͼ��
			; ��������3
			$x = _GUICtrlListView_GetCounterPage($hListView2) - 1;�����ڿ��������пɴ�ֱ��ʾ����Ŀ����
			_GUICtrlListView_EnableGroupView($hListView2);���ÿؼ��е���Ŀ������ʾ
			_GUICtrlListView_InsertGroup($hListView2, -1, 3, "Network");�������
			_GUICtrlListView_SetItemGroupID($hListView2, $x, 3);������Ŀ������

			$treeItemDrive = GUICtrlCreateTreeViewItem($Vars[$i], $hTreeView);����һ�� TreeView �ؼ���Ŀ
			GUICtrlSetImage($treeItemDrive, "shell32.dll", 10);����ָ���ؼ���λͼ��ͼ��

			$search = FileFindFirstFile($Vars[$i] & "\*.*");�������������ļ�
			If $search = -1 Then;��������Ƿ�ɹ�
			Else
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlCreateTreeViewItem($file, $treeItemDrive);����һ�� TreeView �ؼ���Ŀ
					GUICtrlSetImage(-1, "shell32.dll", 4);����ָ���ؼ���λͼ��ͼ��
				WEnd
			EndIf
			FileClose($search); �ر��������
		ElseIf $DriveType = "CDROM" Then;�ж��������Ƿ� CDROM ����
			$DriveTypeS = "����"
			;����һ�� ListView ��Ŀ�ؼ�
			GUICtrlCreateListViewItem($Vars[$i] & "|" & $DriveTypeS & "|" & $DriveFile & "|" & $DriveFreeGB & "|" & $DriveTotalGB, $hListView1)
			GUICtrlSetImage(-1, "shell32.dll", 12);����ָ���ؼ���λͼ��ͼ��

			GUICtrlCreateListViewItem("����  " & $Vars[$i] & @CRLF & "[���ÿռ䣺" & $DriveFreeGB & "][�ܴ�С��" & $DriveTotalGB & "]", $hListView2)
			GUICtrlSetImage(-1, "shell32.dll", 12);����ָ���ؼ���λͼ��ͼ��
			;����һ���÷�
;~ 				_GUICtrlListView_AddItem($hListView2, "������" & $Vars[$i] & "|���ͣ�" & $DriveTypeS & "|��ʽ��" & $DriveFile & @CRLF & "���ÿռ䣺" & $DriveFreeGB & "|�ܴ�С��" & $DriveTotalGB, 4)
;~ 				GUICtrlSetImage(-1, "shell32.dll", 12);����ָ���ؼ���λͼ��ͼ��
			; ��������4
			$x = _GUICtrlListView_GetCounterPage($hListView2) - 1;�����ڿ��������пɴ�ֱ��ʾ����Ŀ����
			_GUICtrlListView_EnableGroupView($hListView2);���ÿؼ��е���Ŀ������ʾ
			_GUICtrlListView_InsertGroup($hListView2, -1, 4, "CDROM");�������
			_GUICtrlListView_SetItemGroupID($hListView2, $x, 4);������Ŀ������

			$treeItemDrive = GUICtrlCreateTreeViewItem($Vars[$i], $hTreeView);����һ�� TreeView �ؼ���Ŀ
			GUICtrlSetImage($treeItemDrive, "shell32.dll", 12);����ָ���ؼ���λͼ��ͼ��

			$search = FileFindFirstFile($Vars[$i] & "\*.*");�������������ļ�
			If $search = -1 Then;��������Ƿ�ɹ�
			Else
				While 1
					$file = FileFindNextFile($search)
					If @error Then ExitLoop
					GUICtrlCreateTreeViewItem($file, $treeItemDrive);����һ�� TreeView �ؼ���Ŀ
					GUICtrlSetImage(-1, "shell32.dll", 4);����ָ���ؼ���λͼ��ͼ��
				WEnd
			EndIf
			FileClose($search); �ر��������
		ElseIf $DriveType = "RAMDiskk" Then;�ж��������Ƿ� RAMDiskk ����
			$DriveTypeS = "�ڴ���"
			;����һ�� ListView ��Ŀ�ؼ�
			GUICtrlCreateListViewItem($Vars[$i] & "|" & $DriveTypeS & "|" & $DriveFile & "|" & $DriveFreeGB & "|" & $DriveTotalGB, $hListView1)
			GUICtrlSetImage(-1, "shell32.dll", 8);����ָ���ؼ���λͼ��ͼ��

			GUICtrlCreateListViewItem("����  " & $Vars[$i] & @CRLF & "[���ÿռ䣺" & $DriveFreeGB & "][�ܴ�С��" & $DriveTotalGB & "]", $hListView2)
			GUICtrlSetImage(-1, "shell32.dll", 8);����ָ���ؼ���λͼ��ͼ��
			; ��������5
			$x = _GUICtrlListView_GetCounterPage($hListView2) - 1;�����ڿ��������пɴ�ֱ��ʾ����Ŀ����
			_GUICtrlListView_EnableGroupView($hListView2);���ÿؼ��е���Ŀ������ʾ
			_GUICtrlListView_InsertGroup($hListView2, -1, 5, "RAMDiskk");�������
			_GUICtrlListView_SetItemGroupID($hListView2, $x, 5);������Ŀ������
		EndIf
	Next
EndIf

;-----------------------------------------------------------------------------------------------
;״̬��
$StatusBar1 = _GUICtrlStatusBar_Create($Form1, $aParts)
_GUICtrlStatusBar_SetText($StatusBar1, today() & "  " & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC))
_GUICtrlStatusBar_SetText($StatusBar1, @TAB & "ϵͳ��" & @OSVersion, 1)
_GUICtrlStatusBar_SetText($StatusBar1, @TAB & "���������" & @ComputerName, 2)
_GUICtrlStatusBar_SetIcon($StatusBar1, 0, _WinAPI_LoadShell32Icon(1));����״̬��ͼ��
_GUICtrlStatusBar_SetIcon($StatusBar1, 1, _WinAPI_LoadShell32Icon(2));����״̬��ͼ��
_Timer_SetTimer($Form1, 1000, "_UpdateStatusBarClock") ; ������ʱ��
GUIRegisterMsg($WM_SIZE, "WM_SIZE");����״̬��λ��

Sleep(500)
SplashOff();�ر�����ͼƬ
GUISetState(@SW_SHOW)

While 1
	$msg = GUIGetMsg()
	Switch $msg
		Case $GUI_EVENT_CLOSE
			ExitLoop
		Case $Label_B6;���������ҳ
			GUICtrlSetColor($Label_B6, 0xEE7621);�ı�������ɫ
			ShellExecute("http://www.autoit.net.cn");��ACN��ҳ
		Case $menu_A1
			MsgBox(266304, "����", "��ʾ������kodin")
		Case $contextMenu1
			MsgBox(266304, "����", "��ʾ������kodin")
		Case $menu_B1;��ȡ(1)
			$TEXT = StringReplace(_GUICtrlTreeView_GetTree($hTreeView), _GUICtrlTreeView_GetText($hTreeView), "");��ȡ��ʽ1
			$location = StringInStr($TEXT, "|", 0, 2);���ĳ���ַ����Ƿ��и������Ӵ�
			If $location = 0 Then
				$item = GUICtrlRead($hTreeView);��ȡ�ؼ�
				If $item = 0 Then
					MsgBox(262160, "����", "û��ѡ��")
				Else
					$TEXT = GUICtrlRead($item, 1)
					If $TEXT = "" Then
					Else
						MsgBox(266304, "��ʾ", $TEXT)
					EndIf
				EndIf
			Else
				;����1
				$array = StringRegExp($TEXT, '\|(.+)\|(.+)', 3);����ִ��Ƿ���ϸ�����������ʽ
				For $i = 1 To UBound($array) - 1
					MsgBox(266304, "����1", $array[0] & "\" & $array[1])
				Next
			EndIf
		Case $menu_B2;��ȡ(2)
			$TEXT = _GUICtrlTreeView_GetTree($hTreeView);��ȡ��ʽ1
			$location = StringInStr($TEXT, "|", 0, 2);���ĳ���ַ����Ƿ��и������Ӵ�
			If $location = 0 Then
				$item = GUICtrlRead($hTreeView);��ȡ�ؼ�
				If $item = 0 Then
					MsgBox(262160, "����", "û��ѡ��")
				Else
					$TEXT = GUICtrlRead($item, 1)
					If $TEXT = "" Then
					Else
						MsgBox(266304, "��ʾ", $TEXT)
					EndIf
				EndIf
			Else
				;����2
				$array = StringRegExp($TEXT, '\|(.+)', 3);����ִ��Ƿ���ϸ�����������ʽ
				For $i = 0 To UBound($array) - 1
					$text_out = StringRegExpReplace($array[$i], '\|', '\\')	;����������ʽ���ı��滻
					MsgBox(266304, "����2", $text_out)
				Next
			EndIf
		Case $menu_B3;��ȡ(3)
			$item = GUICtrlRead($hTreeView);��ȡ�ؼ�
			If $item = 0 Then
				MsgBox(262160, "����", "û��ѡ��")
			Else
				$TEXT = GUICtrlRead($item, 1)
				If $TEXT = "" Then
				Else
					MsgBox(266304, "��ʾ", $TEXT)
				EndIf
			EndIf
		Case $menu_C1;��ȡ(1)
			$ListTxt0 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 0)
			If $ListTxt0 = "" Then
				MsgBox(262160, "����", "δѡ��")
			Else
				MsgBox(266304, "��ʾ", $ListTxt0)
			EndIf
		Case $menu_C2;��ȡ(2)
			$ListTxt0 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 1)
			If $ListTxt0 = "" Then
				MsgBox(262160, "����", "δѡ��")
			Else
				MsgBox(266304, "��ʾ", $ListTxt0)
			EndIf
		Case $ButtonA_1
			$Folder = FileSelectFolder("��ѡ��·��", "", 4);��ʾһ���ļ���ѡ��Ի���
			If @error Then
				MsgBox(266304, "��ʾ", "û��ѡ��")
			Else
				MsgBox(266304, "��ʾ", $Folder)
			EndIf
		Case $ButtonA_2
			MsgBox(266304, "��ʾ", "ͼ�갴ť����")
		Case $ButtonB_1;����
			$ListTxt0 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 0)
			If $ListTxt0 = "" Then
				MsgBox(262160, "����", "δѡ�������")
			Else
				MsgBox(266304, "��ʾ", $ListTxt0)
			EndIf
		Case $ButtonB_2;����
			$ListTxt0 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 0)
			If $ListTxt0 = "" Then
				MsgBox(262160, "����", "δѡ�������")
			Else
				$ListTxt1 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 1)
				MsgBox(266304, "��ʾ " & $ListTxt0, $ListTxt1)
			EndIf
		Case $ButtonB_3;��ʽ
			$ListTxt0 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 0)
			If $ListTxt0 = "" Then
				MsgBox(262160, "����", "δѡ�������")
			Else
				$ListTxt2 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 2)
				If $ListTxt2 = "" Then
					MsgBox(266304, "��ʾ " & $ListTxt0, "δ֪��ʽ")
				Else
					MsgBox(266304, "��ʾ " & $ListTxt0, $ListTxt2)
				EndIf
			EndIf
		Case $ButtonB_4;���ÿռ�
			$ListTxt0 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 0)
			If $ListTxt0 = "" Then
				MsgBox(262160, "����", "δѡ�������")
			Else
				$ListTxt3 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 3)
				MsgBox(266304, "��ʾ " & $ListTxt0, $ListTxt3)
			EndIf
		Case $ButtonB_5;�ܴ�С
			$ListTxt0 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 0)
			If $ListTxt0 = "" Then
				MsgBox(262160, "����", "δѡ�������")
			Else
				$ListTxt4 = _GUICtrlListView_GetItemText($hListView1, _GUICtrlListView_GetNextItem($hListView1), 4)
				MsgBox(266304, "��ʾ " & $ListTxt0, $ListTxt4)
			EndIf
		Case $ButtonB_6;��ȡ
			$DriverRead = GUICtrlRead($Driver)
			MsgBox(266304, "��ʾ", $DriverRead)
		Case $ButtonC_1;��ȡ
			For $i = _GUICtrlListView_GetTopIndex($hListView2) To _GUICtrlListView_GetCounterPage($hListView2);�б���ͼ��߿ɼ�������� to �ɼ�������������
				$CI = $i + 1
				$Checked = _GUICtrlListView_GetItemChecked($hListView2, $i);�����б���ͼ�ؼ���Ŀ��ѡ��״̬
				If $Checked = True Then
					MsgBox(266304, "��ʾ", $var[$CI])
				EndIf
			Next
		Case $radio1
			_GUICtrlListView_SetBkColor($hListView2, $CLR_MONEYGREEN);���ÿؼ�����ɫ
			_GUICtrlListView_SetTextColor($hListView2, $CLR_BLACK);���ÿؼ��е��ı�ɫ
			_GUICtrlListView_SetTextBkColor($hListView2, $CLR_MONEYGREEN);���ÿؼ����ı��ı���ɫ
			_GUICtrlListView_SetOutlineColor($hListView2, 0x0000FF);���ñ߿�ɫ
			_GUICtrlListView_SetView($hListView2, 1);������ʽ����ѡ(1��2��3��4)
		Case $radio2
			_GUICtrlListView_SetBkColor($hListView2, $CLR_NONE);���ÿؼ�����ɫ
			_GUICtrlListView_SetTextColor($hListView2, $CLR_BLACK);���ÿؼ��е��ı�ɫ
			_GUICtrlListView_SetTextBkColor($hListView2, $CLR_NONE);���ÿؼ����ı��ı���ɫ
			_GUICtrlListView_SetView($hListView2, 2);������ʽ����ѡ(1��2��3��4)
		Case $radio3
			_GUICtrlListView_SetView($hListView2, 3);������ʽ����ѡ(1��2��3��4)
		Case $radio4
			_GUICtrlListView_SetView($hListView2, 4);������ʽ����ѡ(1��2��3��4)
	EndSwitch
WEnd

;��λת��
Func ByteConversion($lBytes)
	If $lBytes < 1024 Then
		Return Round($lBytes, 2) & "MB"
	ElseIf $lBytes < 1048576 Then
		Return Round($lBytes / 1024, 2) & "GB"
	EndIf
EndFunc   ;==>ByteConversion

;��ťͼ����(Сͼ��)
Func _set_button_image($icon_index)
	Local $hImage_Temp = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage_Temp, "Shell32.dll", $icon_index)
	Return $hImage_Temp
EndFunc   ;==>_set_button_image

;��ťͼ����(��ͼ��)
Func _set_button_image_max($icon_index)
	Local $hImage_Temp = _GUIImageList_Create(32, 32, 5, 3, 6)
	_GUIImageList_AddIcon($hImage_Temp, "Shell32.dll", $icon_index, True)
	Return $hImage_Temp
EndFunc   ;==>_set_button_image_max

;���ص�ǰʱ��
Func _UpdateStatusBarClock($hWnd, $msg, $iIDTimer, $dwTime)
	_GUICtrlStatusBar_SetText($StatusBar1, today() & "  " & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC))
EndFunc   ;==>_UpdateStatusBarClock

;���ص�ǰ����
Func today()
	Return (@YEAR & "��" & @MON & "��" & @MDAY & "��")
EndFunc   ;==>today

;����״̬��λ��
Func WM_SIZE($hWnd, $msg, $wParam, $lParam)
	_GUICtrlStatusBar_Resize($StatusBar1)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE

Func _DisksType();��ȡӲ���Լ�����
	Dim $a[1]
	Local $x = 0
	$strComputer = "localhost"
	$objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
	$colDiskDrives = $objWMIService.ExecQuery("SELECT * FROM Win32_DiskDrive")
	For $objDrive In $colDiskDrives
		ReDim $a[UBound($a) + 1]
		$a[$x] = GUICtrlCreateTreeViewItem($objDrive.Caption, $hTreeView);����һ�� TreeView �ؼ���Ŀ
		GUICtrlSetImage($a[$x], "shell32.dll", 9);����ͼ��
		GUICtrlSetColor($a[$x], 0x0000ff);����������ɫ
		GUICtrlSetState($a[$x], BitOR($GUI_EXPAND, $GUI_DEFBUTTON));��������Ч��
		$strDeviceID = StringReplace($objDrive.DeviceID, "\", "\\");�滻�ַ����е�ָ���Ӵ�
		$colPartitions = $objWMIService.ExecQuery _
				("ASSOCIATORS OF {Win32_DiskDrive.DeviceID=""" & _
				$strDeviceID & """} WHERE AssocClass = " & _
				"Win32_DiskDriveToDiskPartition")

		For $objPartition In $colPartitions
			$colLogicalDisks = $objWMIService.ExecQuery _
					("ASSOCIATORS OF {Win32_DiskPartition.DeviceID=""" & _
					$objPartition.DeviceID & """} WHERE AssocClass = " & _
					"Win32_LogicalDiskToPartition")

			For $objLogicalDisk In $colLogicalDisks
				$DriveTreeView = GUICtrlCreateTreeViewItem($objLogicalDisk.DeviceID, $a[$x]);����һ�� TreeView �ؼ���Ŀ
				$search = FileFindFirstFile($objLogicalDisk.DeviceID & "\*.*");�������������ļ�
				If $search = -1 Then;��������Ƿ�ɹ�
				Else
					While 1
						$file = FileFindNextFile($search)
						If @error Then ExitLoop
						GUICtrlCreateTreeViewItem($file, $DriveTreeView);����һ�� TreeView �ؼ���Ŀ
						GUICtrlSetImage(-1, "shell32.dll", 4);����ָ���ؼ���λͼ��ͼ��
					WEnd
				EndIf
				FileClose($search); �ر��������
			Next
		Next
		$x += 1
	Next
EndFunc   ;==>_DisksType