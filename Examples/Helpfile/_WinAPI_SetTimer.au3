#Include <Misc.au3>
#Include <WinAPIEx.au3>
#Include <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

Global $hTimerFunc = DllCallbackRegister('_Timer ', 'none ', 'hwnd ; uint ; uint ; dword')
Global $Count = 0, $iMemo

_Main()

Func _Main()
	Local $hGUI, $Drive = DriveGetDrive('ALL')

	; ��������
	$hGUI = GUICreate(" Timer Example ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ���ü�ʱ��
	_WinAPI_SetTimer(0, 0, 1000, DllCallBackGetPtr($hTimerFunc))

	; ѭ�����û��˳�
	Do
	Until _IsPressed('1B') ; ��ESC���˳�

	DllCallbackFree($hTimerFunc)

endfunc   ;==>_Main

Func _Timer($hWnd, $iMsg, $iTimerId, $iTime)
	$Count += 1
	MemoWrite($Count & @CR)
endfunc   ;==>_Timer

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

