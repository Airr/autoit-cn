
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
	Local $hGUI, $hToolbar, $aRect, $iHit, $aStrings[4]
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

	; ����ַ���
	$aStrings[0] = _GUICtrlToolbar_AddString($hToolbar, "&New Button")
	$aStrings[1] = _GUICtrlToolbar_AddString($hToolbar, "&Open Button")
	$aStrings[2] = _GUICtrlToolbar_AddString($hToolbar, "&Save Button")
	$aStrings[3] = _GUICtrlToolbar_AddString($hToolbar, "&Help Button")

	;
	��Ӱ�ť
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW, $aStrings[0])
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN, $aStrings[1])
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE, $aStrings[2])
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP, $aStrings[3])

	; �ڱ��水ť�Ͻ��е������
	$aRect = _GUICtrlToolbar_GetButtonRect($hToolbar, $idSave)
	$iHit = _GUICtrlToolbar_HitTest($hToolbar, $aRect[0], $aRect[1])
	MemoWrite( StringFormat( "Hit test at
	%d, %d = %d" ,  $aRect [ 0 ],  $aRect [ 1 ],  $iHit ))

	; ѭ�����û��˳�
	Do

	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

