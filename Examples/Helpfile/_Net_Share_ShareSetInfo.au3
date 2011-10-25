
#include  <GuiConstantsEx.au3>
#include  <NetShare.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $iI, $aInfo
	Local Const $sShareName = "AutoIt Share"

	; ��������
	$hGUI = GUICreate("NetShare", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; �鿴�Ƿ���ڹ���
	If _Net_Share_ShareCheck(@ComputerName, $sShareName) = -1 Then
		; �ڱ��ػ��ϴ�������
		_Net_Share_ShareAdd(@ComputerName, $sShareName, 0, "C:\", "AutoIt Share Comment")
		If @error Then MsgBox(4096, "Information", "Share add error :" & @error)
		MemoWrite("Share added")
	Else
		MemoWrite("Share exists")
	EndIf

	; �ı乲����Ϣ
	_Net_Share_ShareSetInfo(@ComputerName, $sShareName, "New Comment", 4)

	; ��ʾ����ӵĹ�����ص���Ϣ
	$aInfo = _Net_Share_ShareGetInfo(@ComputerName, $sShareName)
	MemoWrite("Share name ..............:" & $aInfo[0])
	MemoWrite("Share type...............:" & _Net_Share_ResourceStr($aInfo[1]))
	MemoWrite("Comment .................:" & $aInfo[2])
	MemoWrite("Permissions .............:" & _Net_Share_PermStr($aInfo[3]))
	MemoWrite("Maximum connections .....:" & $aInfo[4])
	MemoWrite("Current connections .....:" & $aInfo[5])
	MemoWrite("Local path ..............:" & $aInfo[6])
	MemoWrite("Password ................:" & $aInfo[7])

	; ɾ������
	_Net_Share_ShareDel(@ComputerName, $sShareName)
	If @error Then MsgBox(4096, "Information", "Share delete error :" & @error)
	MemoWrite("Share deleted")

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

