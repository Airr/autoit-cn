﻿#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $iI, $aInfo
	Local Const $sShareName = "AutoIt Share"

	; 创建 GUI
	GUICreate("NetShare", 400, 300)

	; 创建 memo 控件
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 查看是否存在共享
	If _Net_Share_ShareCheck(@ComputerName, $sShareName) = -1 Then
		; 在本地电脑上创建共享
		_Net_Share_ShareAdd(@ComputerName, $sShareName, 0, "C:\", "AutoIt Share Comment")
		If @error Then MsgBox(4096, "Information", "Share add error : " & @error)
		MemoWrite("Share added")
	Else
		MemoWrite("Share exists")
	EndIf

	; 显示所有本地共享的信息
	$aInfo = _Net_Share_ShareEnum(@ComputerName)
	MemoWrite("Entries read ............: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Share name ..............: " & $aInfo[$iI][0])
		MemoWrite("Share type...............: " & _Net_Share_ResourceStr($aInfo[$iI][1]))
		MemoWrite("Comment .................: " & $aInfo[$iI][2])
		MemoWrite("Permissions .............: " & _Net_Share_PermStr($aInfo[$iI][3]))
		MemoWrite("Maximum connections .....: " & $aInfo[$iI][4])
		MemoWrite("Current connections .....: " & $aInfo[$iI][5])
		MemoWrite("Local path ..............: " & $aInfo[$iI][6])
		MemoWrite("Password ................: " & $aInfo[$iI][7])
		MemoWrite()
	Next

	; 删除共享
	_Net_Share_ShareDel(@ComputerName, $sShareName)
	If @error Then MsgBox(4096, "Information", "Share delete error : " & @error)
	MemoWrite("Share deleted")

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; 写入消息到 memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
