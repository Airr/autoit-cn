#include <GUIConstantsEx.au3>
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

	; Get server and share information
	$sServer = InputBox("NetWork Demo", "Enter Server Name:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Get session information
	$aInfo = _Net_Share_SessionGetInfo($sServer, @ComputerName, "Administrator")
	MemoWrite("Error ..........: " & @error)
	MemoWrite("Computer name ..: " & $aInfo[0])
	MemoWrite("User name ......: " & $aInfo[1])
	MemoWrite("Resources open .: " & $aInfo[2])
	MemoWrite("Seconds active .: " & $aInfo[3])
	MemoWrite("Seconds idle ...: " & $aInfo[4])
	MemoWrite("Connection type : " & $aInfo[5])
	MemoWrite("Client type ....: " & $aInfo[6])

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; 写入消息到 memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
