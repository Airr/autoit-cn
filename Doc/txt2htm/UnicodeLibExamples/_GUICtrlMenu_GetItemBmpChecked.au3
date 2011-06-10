﻿#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>
#include <WinAPI.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hFile, $hEdit, $hHelp, $hMain, $hBmp1, $hBmp2
	Global Enum $idNew = 1000, $idOpen, $idSave, $idExit, $idCut, $idCopy, $idPaste, $idAbout

	; 创建 GUI
	$hGUI = GUICreate("Menu", 400, 300)

	; 创建文件菜单
	$hFile = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hFile, 0, "&New", $idNew)
	_GUICtrlMenu_InsertMenuItem($hFile, 1, "&Open", $idOpen)
	_GUICtrlMenu_InsertMenuItem($hFile, 2, "&Save", $idSave)
	_GUICtrlMenu_InsertMenuItem($hFile, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($hFile, 4, "E&xit", $idExit)

	; 创建编辑菜单
	$hEdit = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hEdit, 0, "&Cut", $idCut)
	_GUICtrlMenu_InsertMenuItem($hEdit, 1, "C&opy", $idCopy)
	_GUICtrlMenu_InsertMenuItem($hEdit, 2, "&Paste", $idPaste)

	; 创建帮助菜单
	$hHelp = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hHelp, 0, "&About", $idAbout)

	; 创建主菜单
	$hMain = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hMain, 0, "&File", 0, $hFile)
	_GUICtrlMenu_InsertMenuItem($hMain, 1, "&Edit", 0, $hEdit)
	_GUICtrlMenu_InsertMenuItem($hMain, 2, "&Help", 0, $hHelp)

	; 设置窗口菜单
	_GUICtrlMenu_SetMenu($hGUI, $hMain)

	; 创建 memo 控件
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 276, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 设置文件菜单的选中和未选中时的位图
	$hBmp1 = _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 11, 11)
	$hBmp2 = _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 11, 11)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 0, $hBmp1)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 1, $hBmp1)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 2, $hBmp1)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 0, $hBmp2)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 1, $hBmp2)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 2, $hBmp2)

	; 选中打开菜单项
	_GUICtrlMenu_CheckMenuItem($hFile, 1)

	; 显示匹配的位图句柄
	MemoWrite("Checked handle ......: 0x" & Hex($hBmp1))
	MemoWrite("Unchecked handle ....: 0x" & Hex($hBmp2))
	MemoWrite("Open checked handle .: 0x" & Hex(_GUICtrlMenu_GetItemBmpChecked($hFile, 0)))
	MemoWrite("Open unchecked handle: 0x" & Hex(_GUICtrlMenu_GetItemBmpUnchecked($hFile, 0)))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; 写入消息到 memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
