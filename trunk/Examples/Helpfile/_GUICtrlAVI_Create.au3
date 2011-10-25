#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

$Debug_AVI = False ; ��鴫�ݸ�AVI����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���鿴��ι���

Global $hAVI, $iMemo

_Example1()
_Example2()

Func _Example1()
	Local $hGUI, $sFile = RegRead(" HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt ", "InstallDir ") & " \Examples\GUI\SampleAVI.avi "

	; ��������
	$hGUI = GUICreate(" (External 1) AVI Create ", 300, 240)
	$iMemo = GUICtrlCreateEdit("", 5, 80, 290, 150, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	$hAVI = _GUICtrlAVI_Create($hGUI, $sFile, -1, 10, 10)
	GUISetState()

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND ")

	; ����ʾ��AutoIt AVI
	_GUICtrlAVI_Play($hAVI)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	; �ر�AVIƬ��
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()

endfunc   ;==>_Example1

Func _Example2()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" (External 2) AVI Create ", 300, 240)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & " \Shell32.dll ", 150, 10, 10)
	$iMemo = GUICtrlCreateEdit("", 5, 80, 290, 150, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")

	GUISetState()

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND ")

	; ����ʾ��AutoIt AVI
	_GUICtrlAVI_Play($hAVI)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	; �ر�AVIƬ��
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()

endfunc   ;==>_Example2

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	Local $hWndFrom, $iIDFrom, $iCode
	$hWndFrom = $ilParam
	$iIDFrom = BitAND($iwParam, 0xFFFF) ; Low Word
	$iCode = BitShift($iwParam, 16) ; Hi Word
	Switch $hWndFrom
		Case $hAVI
			Switch $iCode
				Case $ACN_START ; ע�����AVI�����ѿ�ʼ���ŵĶ����ؼ���������
					MemoWrite(" $ACN_START ")
					MemoWrite(" --> hWndFrom:" & @TAB & $hWndFrom)
					MemoWrite(" -->IDFrom:" & @TAB & $iIDFrom)
					MemoWrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $ACN_STOP ; ע�����AVI������ֹͣ���ŵĶ����ؼ���������
					MemoWrite(" $ACN_STOP ")
					MemoWrite(" --> hWndFrom:" & @TAB & $hWndFrom)
					MemoWrite(" -->IDFrom:" & @TAB & $iIDFrom)
					MemoWrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
endfunc   ;==>WM_COMMAND

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

