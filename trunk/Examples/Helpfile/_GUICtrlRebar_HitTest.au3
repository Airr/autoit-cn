
#include  <GuiConstantsEx.au3>
#include  <GuiReBar.au3>
#include  <GuiToolBar.au3>
#include  <WindowsConstants.au3>
#include  <Constants.au3>

Opt("MustDeclareVars", 1)

$Debug_RB = False

Global $iMemo

_Main()

Func _Main()
	Local $hgui, $btnExit, $hReBar, $hToolbar, $hInput, $aHitTest
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	$hgui = GUICreate("Rebar", 400, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; �����������ؼ�
	$hReBar = _GUICtrlReBar_Create($hgui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	$iMemo = GUICtrlCreateEdit("", 2, 100, 396, 250, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")


	; ���������������еĹ�����
	$hToolbar = _GUICtrlToolBar_Create($hgui, BitOR($TBSTYLE_FLAT, $CCS_NORESIZE, $CCS_NOPARENTALIGN))

	; ��ӱ�׼ϵͳλͼ
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; ��Ӱ�ť
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; ���������������е������
	$hInput = GUICtrlCreateInput("Input control", 0, 0, 120, 20)

	; ��Ӱ����ؼ�������
	_GUICtrlReBar_AddBand($hReBar, GUICtrlGetHandle($hInput), 120, 200, "Name:")

	; �������������Ӱ����ؼ�������
	_GUICtrlReBar_AddToolBarBand($hReBar, $hToolbar, "", 0)

	$btnExit = GUICtrlCreateButton("Exit", 150, 360, 100, 25)
	GUICtrlSetState($btnExit, $GUI_DEFBUTTON)
	GUICtrlSetState($btnExit, $GUI_FOCUS)

	GUISetState(@SW_SHOW)

	$aHitTest = _GUICtrlRebar_HitTest($hReBar, 150, 25)
	MemoWrite("iBand........:" & $aHitTest[0])
	MemoWrite("$RBHT_NOWHERE:" & $aHitTest[5])
	MemoWrite("$RBHT_CLIENT.:" & $aHitTest[3])
	MemoWrite("$RBHT_CAPTION:" & $aHitTest[1])
	MemoWrite("$RBHT_CHEVRON:" & $aHitTest[2])
	MemoWrite("$RBHT_GRABBER:" & $aHitTest[4])

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $btnExit
				Exit
		EndSwitch
	WEnd
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

