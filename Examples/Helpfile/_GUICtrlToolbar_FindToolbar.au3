#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>

$Debug_TB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hToolbar

	Run("explorer.exe /root, ,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}")
	WinWaitActive("[CLASS:CabinetWClass]")
	Sleep(1000)
	$hToolbar = _GUICtrlToolbar_FindToolbar("[CLASS:CabinetWClass]", "&File")
	MsgBox(4096, "Information", "File Toolbar handle: 0x" & Hex($hToolbar))

EndFunc   ;==>_Main
