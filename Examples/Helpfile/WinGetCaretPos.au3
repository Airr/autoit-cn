Local $aCaretPos = WinGetCaretPos()
If Not @error Then
	ToolTip("��һ���ַ�ʽ", $aCaretPos[0], $aCaretPos[1])
EndIf
Sleep(2000)

$aCaretPos = _WinGetCaretPos()
If Not @error Then
	ToolTip("�ڶ��ַ�ʽ", $aCaretPos[0], $aCaretPos[1])
EndIf
Sleep(2000)

; �õ� MDI �ı��༭����һЩ�ɿ�����.
Func _WinGetCaretPos()
	Local $iXAdjust = 5
	Local $iYAdjust = 40

	Local $iOpt = Opt("CaretCoordMode", 0)         ;���ģʽ
	Local $aGetCaretPos = WinGetCaretPos()         ;��Բ��������
	Local $aGetPos = WinGetPos("[ACTIVE]")         ;��������
	Local $sControl = ControlGetFocus("[ACTIVE]")  ;�ı����� "���"
	Local $aControlPos = ControlGetPos("[ACTIVE]", "", $sControl)  ;�ı���������
	$iOpt = Opt("CaretCoordMode", $iOpt) ; Reset "CaretCoordMode" to the previous option.

	Local $aReturn[2] = [0, 0] ; Create an array to store the x, y position.
	If IsArray($aGetCaretPos) And IsArray($aGetPos) And IsArray($aControlPos) Then
		$aReturn[0] = $aGetCaretPos[0] + $aGetPos[0] + $aControlPos[0] + $iXAdjust
		$aReturn[1] = $aGetCaretPos[1] + $aGetPos[1] + $aControlPos[1] + $iYAdjust
		Return $aReturn ; Return the array.
	Else
		Return SetError(1, 0, $aReturn) ; Return the array and set @error to 1.
	EndIf
EndFunc   ;==>_WinGetCaretPos
