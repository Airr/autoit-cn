GUICreate("һ���򵥵������Ĳ˵�!",300,200)

$trackmenu = GuiCtrlCreateContextMenu ()
$aboutitem = GuiCtrlCreateMenuitem ("����",$trackmenu)
; next one creates a menu separator (line)
GuiCtrlCreateMenuitem ("",$trackmenu)
$exititem = GuiCtrlCreateMenuitem ("�˳�",$trackmenu)

GuiSetState()

While 1
	$msg = GuiGetMsg()
	If $msg = $exititem Or $msg = -3 Or $msg = -1 Then ExitLoop
	If $msg = $aboutitem Then Msgbox(0,"����","һ���򵥵������Ĳ˵�!")
WEnd

GUIDelete()

Exit