
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
		; �������ػ��ϵĹ���
		_Net_Share_ShareAdd(@ComputerName, $sShareName, 0, "C:\", "AutoIt Share Comment")
		If @error Then MsgBox(4096, "Information", "Share add error :" & @error)
		MemoWrite("Share added")
	Else
		MemoWrite("Share exists")
	EndIf

	; ��ʾ�йر��ع����������Ϣ
	$aInfo = _Net_Share_ShareEnum(@ComputerName)
	MemoWrite("Entries read ............:" & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Share name ..............:" & $aInfo[$iI][0])
		MemoWrite("Share type...............:" & _Net_Share_ResourceStr($aInfo[$iI][1]))
		MemoWrite("Comment .................:" & $aInfo[$iI][2])
		MemoWrite("Permissions .............:" & _Net_Share_PermStr($aInfo[$iI][3]))
		MemoWrite("Maximum connections .....:" & $aInfo[$iI][4])
		MemoWrite("Current connections .....:" & $aInfo[$iI][5])
		MemoWrite("Local path ..............:" & $aInfo[$iI][6])
		MemoWrite("Password ................:" & $aInfo[$iI][7])
		MemoWrite()
	Next

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

