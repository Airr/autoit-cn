
#include  <GuiConstantsEx.au3>
#include  <NetShare.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $sServer, $aInfo

	; ��������
	$hGUI = GUICreate("NetShare", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡ��������������Ϣ
	$sServer = InputBox("NetWork Demo", "Enter Server Name:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; ö�ٷ������ϴ򿪵��ļ�
	$aInfo = _Net_Share_FileEnum($sServer)
	MemoWrite("Error ...................:" & @error)
	MemoWrite("Entries read ............:" & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Resource ID .............:" & $aInfo[$iI][0])
		MemoWrite("Resource permissions ....:" & _Net_Share_PermStr($aInfo[$iI][1]))
		MemoWrite("Resource locks ..........:" & $aInfo[$iI][2])
		MemoWrite("Resource path ...........:" & $aInfo[$iI][3])
		MemoWrite("Resource user ...........:" & $aInfo[$iI][4])
		MemoWrite()
	Next

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

