Local $var = WinList()

For $i = 1 To $var[0][0]
  ; ֻ��ʾ���б���Ŀɼ�����
	If $var[$i][0] <> "" And IsVisible($var[$i][1]) Then
		MsgBox(0, "��ϸ��Ϣ", "����=" & $var[$i][0] & @LF & "���=" & $var[$i][1])
	EndIf
Next

Func IsVisible($handle)
	If BitAND(WinGetState($handle), 2) Then
		Return 1
	Else
		Return 0
	EndIf

EndFunc   ;==>IsVisible
