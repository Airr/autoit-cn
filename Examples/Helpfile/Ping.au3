Example()

Func Example()
	; Ping AutoIt ��վ,��ʱʱ��Ϊ 250 ����.
	Local $iPing = Ping("www.autoitscript.com", 250)

	If $iPing Then ; If a value greater than 0 was returned then display the following message.
		MsgBox(4096, "", "�շ�ʱ����: " & $iPing & "����.")
	Else
		MsgBox(4096, "", "������һ������, @error ֵΪ: " & @error)
	EndIf
EndFunc   ;==>Example
