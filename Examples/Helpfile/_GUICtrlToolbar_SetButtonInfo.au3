
#include  <GuiToolbar.au3>
#include  <GuiConstantsEx.au3>
#include  <WindowsConstants.au3>
#include  <Constants.au3>

Opt('MustDeclareVars', 1)

$Debug_TB = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��
Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hToolbar, $aButton
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	; ��������
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 36, 396, 262, $WS_VSCROLL)

	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")

	GUISetState()

	;
	��ӱ�׼ϵͳλͼ
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

	;
	���ñ��水ť��Ϣ
	_GUICtrlToolbar_SetButtonInfo($hToolbar, $idSave, $STD_PRINT, BitOR($TBSTATE_PRESSED, $TBSTATE_ENABLED), -1, 100, 1234)

	;
	��ʾ���水ť��Ϣ
	$aButton = _GUICtrlToolbar_GetButtonInfo($hToolbar, $idSave)
	MemoWrite("Image index ....:" & $aButton[0])
	MemoWrite("State flags ....:" & $aButton[1])
	MemoWrite("Style flags ....:" & $aButton[2])
	MemoWrite("Button width ...:" & $aButton[3])
	MemoWrite("Param ..........:" & $aButton[4])

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

