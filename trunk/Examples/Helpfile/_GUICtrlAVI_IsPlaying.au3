#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

$Debug_AVI = False ; ��鴫�ݸ�AVI���������� , ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $hAVI, $iMemo

_Main()

Func _Main()
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt ", "InstallDir ") & " \Examples\GUI\SampleAVI.avi "
	Local $btn_StartStop

	; ��������
	$hGUI = GUICreate(" (External) AVI Open ", 300, 200)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	$btn_StartStop = GUICtrlCreateButton(" Start ", 50, 10, 75, 25)
	$iMemo = GUICtrlCreateEdit("", 10, 50, 276, 144, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ����ʾ��AutoItӰƬ
	_GUICtrlAVI_Open($hAVI, $sFile)

	; ѭ�����û��˳�
	While 1
		Switch GUIGetMsg()
			Case $btn_StartStop
				If GUICtrlRead($btn_StartStop) = " Start " Then
					_GUICtrlAVI_Play($hAVI)
					GUICtrlSetData($btn_StartStop, "Stop ")
				Else
					_GUICtrlAVI_Stop($hAVI)
					GUICtrlSetData($btn_StartStop, "Start ")
				EndIf
				MemoWrite(" Is Playing:" & _GUICtrlAVI_IsPlaying($hAVI))

			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; �ر�ӰƬ����
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
endfunc   ;==>_Main

; ��memo�ؼ�д��һ��
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

