Example()

Func Example()
	; Run Notepad
	Run("notepad.exe")

	; Wait 10 seconds for the Notepad window to appear.
	WinWait("[CLASS:Notepad]", "", 10)

	; Test if the window exists and display the results.
	If WinExists("[CLASS:Notepad]") Then
		MsgBox(4096, "", "���±����ڴ���")
	Else
		MsgBox(4096, "", "���±����ڲ�����")
	EndIf
EndFunc   ;==>Example
