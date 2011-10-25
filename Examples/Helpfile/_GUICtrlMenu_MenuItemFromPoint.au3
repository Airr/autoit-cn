#include <GuiMenu.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hWnd, $hMain, $hFile, $tRect, $tPoint, $iX, $iY, $iIndex

	; 打开记事本
	Run("Notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; 打开文件菜单
	Send("!f")
	Sleep(1000)

	; 将鼠标移动到打开的菜单项上
	$tRect = _GUICtrlMenu_GetItemRectEx($hWnd, $hFile, 1)
	$tPoint = _Lib_PointFromRect($tRect, True)
	_Lib_GetXYFromPoint($tPoint, $iX, $iY)
	MouseMove($iX, $iY, 1)
	Sleep(1000)

	; 从当前的鼠标位置获取菜单项
	$iIndex = _GUICtrlMenu_MenuItemFromPoint($hWnd, $hFile)
	Send(" {ESC 2} ")
	Writeln("Menu item under cursor was:" & $iIndex)

endfunc   ;==>_Main

; 向记事本写入一行
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
endfunc   ;==>Writeln

Func _Lib_PointFromRect(ByRef $tRect, $fCenter = True)
	Local $iX1, $iY1, $iX2, $iY2, $tPoint

	$iX1 = DllStructGetData($tRect, "Left")
	$iY1 = DllStructGetData($tRect, "Top")
	$iX2 = DllStructGetData($tRect, "Right")
	$iY2 = DllStructGetData($tRect, "Bottom")
	If $fCenter Then
		$iX1 = $iX1 + (($iX2 - $iX1) / 2)
		$iY1 = $iY1 + (($iY2 - $iY1) / 2)
	EndIf
	$tPoint = DllStructCreate($tagPOINT)
	DllStructSetData($tPoint, "X", $iX1)
	DllStructSetData($tPoint, "Y", $iY1)
	Return $tPoint
endfunc   ;==>_Lib_PointFromRect

Func _Lib_GetXYFromPoint(ByRef $tPoint, ByRef $iX, ByRef $iY)
	$iX = DllStructGetData($tPoint, "X")
	$iY = DllStructGetData($tPoint, "Y")
endfunc   ;==>_Lib_GetXYFromPoint

