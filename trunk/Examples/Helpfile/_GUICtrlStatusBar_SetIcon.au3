
#include  <GuiConstantsEx.au3>
#include  <GuiStatusBar.au3>
#include  <WinAPI.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_SB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $iMemo

ʾ��1()
ʾ��2()

Func ʾ��1()

	Local $hGUI, $hIcons[2], $hStatus
	Local $aParts[4] = [75, 150, 300, 400]

	; ��������
	$hGUI = GUICreate("(ʾ�� 1) StatusBar Icon", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ���ò���
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Part 1")
	_GUICtrlStatusBar_SetText($hStatus, "Part 2", 1)

	; ����ͼ��
	$hIcons[0] = _WinAPI_LoadShell32Icon(23)
	$hIcons[1] = _WinAPI_LoadShell32Icon(40)
	_GUICtrlStatusBar_SetIcon($hStatus, 0, $hIcons[0])
	_GUICtrlStatusBar_SetIcon($hStatus, 1, $hIcons[1])

	; ��ʾͼ����
	MemoWrite("Part 1 icon handle .: 0x" & Hex( _GUICtrlStatusBar_GetIcon($hStatus, 0)))
	MemoWrite("Part 2 icon handle .: 0x" & Hex( _GUICtrlStatusBar_GetIcon($hStatus, 1)))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	; �ͷ�ͼ��
	_WinAPI_DestroyIcon($hIcons[0])
	_WinAPI_DestroyIcon($hIcons[1])
	GUIDelete()
endfunc   ;==>ʾ��1

Func ʾ��2()

	Local $hGUI, $hStatus
	Local $aParts[4] = [75, 150, 300, 400]

	; ��������
	$hGUI = GUICreate("(ʾ�� 2) StatusBar Icon", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ���ò���
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Part 1")
	_GUICtrlStatusBar_SetText($hStatus, "Part 2", 1)

	; ����ͼ��
	_GUICtrlStatusBar_SetIcon($hStatus, 0, 23, "shell32.dll")
	_GUICtrlStatusBar_SetIcon($hStatus, 1, 40, "shell32.dll")

	; ��ʾͼ����
	MemoWrite("Part 1 icon handle .: 0x" & Hex( _GUICtrlStatusBar_GetIcon($hStatus, 0)))
	MemoWrite("Part 2 icon handle .: 0x" & Hex( _GUICtrlStatusBar_GetIcon($hStatus, 1)))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>ʾ��2

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite


