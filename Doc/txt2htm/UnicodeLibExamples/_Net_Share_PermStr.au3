﻿#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $sServer, $aInfo

	; 创建 GUI
	GUICreate("NetShare", 400, 300)

	; 创建 memo 控件
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 获取服务器和共享信息
	$sServer = InputBox("NetWork Demo", "Enter Server Name:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; 枚举服务器上打开的文件
	$aInfo = _Net_Share_FileEnum($sServer)
	MemoWrite("Error ...................: " & @error)
	MemoWrite("Entries read ............: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Resource ID .............: " & $aInfo[$iI][0])
		MemoWrite("Resource permissions ....: " & _Net_Share_PermStr($aInfo[$iI][1]))
		MemoWrite("Resource locks ..........: " & $aInfo[$iI][2])
		MemoWrite("Resource path ...........: " & $aInfo[$iI][3])
		MemoWrite("Resource user ...........: " & $aInfo[$iI][4])
		MemoWrite()
	Next

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; 写入消息到 memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
