Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")
ControlSetText("[CLASS:Notepad]","","[CLASSNN:Edit1]","this one")


AutoItSetOption("WinTitleMatchMode", 4)

; �õ����� "this one" ���ݵļ��±����ڵľ��
Local $handle = WinGetHandle("[CLASS:Notepad]", "this one")
If @error Then
	MsgBox(4096, "����", "�����ҵ�ָ������")
Else
	; ����һЩ�ı������±����ڱ༭�ؼ�.
	ControlSend($handle, "", "Edit1", "AbCdE")
EndIf
