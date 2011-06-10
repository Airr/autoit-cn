﻿#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain, $hFile, $tInfo

	; 打开记事本
	Run("Notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; 获取/设置打开子菜单的命令 ID
	$tInfo = _GUICtrlMenu_GetItemInfo($hFile, 1)
	Writeln("Open command ID: " & DllStructGetData($tInfo, "ID"))
	DllStructSetData($tInfo, "ID", 0)
	_GUICtrlMenu_SetItemInfo($hFile, 1, $tInfo)
	$tInfo = _GUICtrlMenu_GetItemInfo($hFile, 1)
	Writeln("Open command ID: " & DllStructGetData($tInfo, "ID"))

EndFunc   ;==>_Main

; 写入一行文本到记事本
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
