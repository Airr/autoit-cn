
#include  <GuiConstantsEx.au3>
#include  <GuiStatusBar.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_SB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $iMemo

_Main()

Func _Main()

	Local $hGUI, $aInfo, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; ��������
	$hGUI = GUICreate( "StatusBar Get
	Borders" ,  400 ,  300 )

	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	;
	��ȡ�߽�ߴ�
	$aInfo = _GUICtrlStatusBar_GetBorders($hStatus)
	MemoWrite("Horizontal border width .:" & $aInfo[0])
	MemoWrite("Vertical border width ...:" & $aInfo[1])
	MemoWrite("Width between rectangles :" & $aInfo[2])

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite


