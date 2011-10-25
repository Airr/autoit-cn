#include  <WinApiEx.au3>
#include  <GuiConstantsEx.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

Global $Str, $iMemo, $Path = @ScriptFullPath

_Main()

Func _Main()
	Local $hGUI, $i = 0

	; ��������
	$hGUI = GUICreate(" Path Parsing ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	While $Path > ''
		$i += 1
		MemoWrite($i & ' -' & $Path)
		$Path = _WinAPI_PathFindNextComponent($Path)
	WEnd

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

