#include  <GuiConstantsEx.au3>
#include  <WinApiEx.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

Dim $OnOff[2] = [' OFF ', 'ON ']
Global $iMemo
Global Const $VK_NUMLOCK = 0x90

_Main()

Func _Main()
	Local $hGUI, $aDisk

	; ��������
	$hGUI = GUICreate("Key State", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡNUMLOCK��״̬, �۲����ָʾ��״̬
	MemoWrite('NumLock:' & $OnOff[BitAND( _WinAPI_GetKeyState($VK_NUMLOCK), 1)])
	Sleep(1500)
	Send('{NUMLOCK toggle}')
	MemoWrite('NumLock:' & $OnOff[BitAND( _WinAPI_GetKeyState($VK_NUMLOCK), 1)])
	Sleep(1500)
	Send('{NUMLOCK toggle}')
	MemoWrite('NumLock:' & $OnOff[BitAND( _WinAPI_GetKeyState($VK_NUMLOCK), 1)])

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

