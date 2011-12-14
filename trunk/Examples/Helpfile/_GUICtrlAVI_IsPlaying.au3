#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>
#include <WindowsConstants.au3>

$Debug_AVI = False ; ��鴫�ݸ� AVI ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

Global $hAVI, $iMemo

_Main()

Func _Main()
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"
	Local $btn_StartStop

	; ���� GUI
	$hGUI = GUICreate("(External) AVI Open", 300, 200)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	$btn_StartStop = GUICtrlCreateButton("Start", 50, 10, 75, 25)
	$iMemo = GUICtrlCreateEdit("", 10, 50, 276, 144, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ���� AutoIt AVI ʵ��
	_GUICtrlAVI_Open($hAVI, $sFile)

	; ѭ��ֱ���û��˳�
	While 1
		Switch GUIGetMsg()
			Case $btn_StartStop
				If GUICtrlRead($btn_StartStop) = "Start" Then
					_GUICtrlAVI_Play($hAVI)
					GUICtrlSetData($btn_StartStop, "Stop")
				Else
					_GUICtrlAVI_Stop($hAVI)
					GUICtrlSetData($btn_StartStop, "Start")
				EndIf
				MemoWrite("Is Playing: " & _GUICtrlAVI_IsPlaying($hAVI))

			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; �ر� AVI ����
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
