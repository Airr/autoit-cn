;=============================
;����1:��ʾ��ǰĿ¼�������ļ����ļ���
;=============================
Local $hSearch = FileFindFirstFile("*.*")

; ��������Ƿ�ɹ�
If $hSearch = -1 Then
	MsgBox(4096, "����", "û���ļ�/Ŀ¼ ƥ������")
	Exit
EndIf

While 1
	Local $sFile = FileFindNextFile($hSearch)
	If @error Then ExitLoop

	MsgBox(4096, "�ҵ����ļ�:", $sFile)
WEnd

; �ر��������
FileClose($hSearch)

;=============================
;����2:�ݹ���ҵ�ǰĿ¼������Ŀ¼�µ������ļ�
;=============================
FindAllFile(@ScriptDir)
Func FindAllFile($sDir)
	Local $hSearch = FileFindFirstFile($sDir & "\*.*")
	; ��������Ƿ�ɹ�
	If $hSearch = -1 Then Return
	While 1
		Local $sFile = FileFindNextFile($hSearch)
		If @error Then ExitLoop
		
		If @extended Then 
			FindAllFile($sDir & "\" & $sFile)
			ContinueLoop
		EndIf
		FileWriteLine("�ҵ����ļ�.txt",$sDir & "\" & $sFile)
	WEnd
	; �ر��������
	FileClose($hSearch)
EndFunc