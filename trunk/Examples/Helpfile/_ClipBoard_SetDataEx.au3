#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <GUIEdit.au3>

Opt('MustDeclareVars', 1)

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $btn_SetData, $btn_GetData, $hMemory, $hLock, $tData, $sData, $iSize

	; ��������
	$hGUI = GUICreate("Clipboard", 400, 350)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_SetData = GUICtrlCreateButton("Set ClipBoard Data", 50, 310, 120, 30)
	$btn_GetData = GUICtrlCreateButton("Get ClipBoard Data", 210, 310, 120, 30)
	GUISetState()

	; ѭ�����û��˳�
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_SetData
				; �򿪼�����
				If Not _ClipBoard_Open(0) Then _WinAPI_ShowError("_ClipBoard_Open failed")

				; ��ռ�����
				If Not _ClipBoard_Empty() Then _WinAPI_ShowError("_ClipBoard_Empty failed")

				; ����ȫ���ڴ滺��(��ʾΪʲôʹ��_ClipBoard_SetData�൱��!)
				$sData = "Hello from AutoIt"
				$iSize = StringLen($sData) + 1
				$hMemory = _MemGlobalAlloc($iSize, $GHND)
				If $hMemory = 0 Then _WinAPI_ShowError("_Mem_GlobalAlloc failed")
				$hLock = _MemGlobalLock($hMemory)
				If $hLock = 0 Then _WinAPI_ShowError("_Mem_GlobalLock failed")
				$tData = DllStructCreate("char Text[" & $iSize & "]", $hLock)
				DllStructSetData($tData, "Text", $sData)
				_MemGlobalUnlock($hMemory)

				; д��������ı�
				If Not _ClipBoard_SetDataEx($hMemory, $CF_TEXT) Then _WinAPI_ShowError("_ClipBoard_SetDataEx failed")

				; �رռ�����
				_ClipBoard_Close()
			Case $btn_GetData
				MemoWrite( _ClipBoard_GetData())
		EndSwitch
	WEnd

endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

