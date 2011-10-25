#include <GuiMenu.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hWnd, $hMenu, $iCount, $iI

	; �򿪼��±�
	Run("Notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMenu = _GUICtrlMenu_GetSystemMenu($hWnd)

	; ��ʾϵͳ�˵�
	_GUICtrlMenu_InsertMenuItem($hMenu, 5, "&AutoIt")

	; ��ʾϵͳ�˵�
	$iCount = _GUICtrlMenu_GetItemCount($hMenu)
	Writeln("System menu handle: 0x" & Hex($hMenu))
	Writeln("Item count .......:" & $iCount)
	For $iI = 0 To $iCount - 1
		Writeln("Item" & $iI & " text ......:" & _GUICtrlMenu_GetItemText($hMenu, $iI))
	Next

endfunc   ;==>_Main

; ����±�д���ı�
Func Writeln($sText)
	ControlSend("Untitled - Notepad", "", "Edit1", $sText & @CR)
endfunc   ;==>Writeln

