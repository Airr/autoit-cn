#Region AutoIt3Wrapper Ԥ�������(���ò���)
#AutoIt3Wrapper_Icon=NSIS 										;ͼ��,֧��EXE,DLL,ICO
#AutoIt3Wrapper_OutFile=									;����ļ���
#AutoIt3Wrapper_OutFile_Type=exe							;�ļ�����
#AutoIt3Wrapper_Compression=4								;ѹ���ȼ�
#AutoIt3Wrapper_UseUpx=y 									;ʹ��ѹ��
#AutoIt3Wrapper_Res_Comment= 								;ע��
#AutoIt3Wrapper_Res_Description=							;��ϸ��Ϣ
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=p				;�Զ����°汾  
#AutoIt3Wrapper_Res_LegalCopyright= 						;��Ȩ
#AutoIt3Wrapper_Change2CUI=y                   				;�޸�����ĳ���ΪCUI(����̨����)
;#AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#AutoIt3Wrapper_Run_Tidy=                   				;�ű�����
;#AutoIt3Wrapper_Run_Obfuscator=      						;�����Ի�
;#AutoIt3Wrapper_Run_AU3Check= 								;�﷨���
;#AutoIt3Wrapper_Run_Before= 								;����ǰ
;#AutoIt3Wrapper_Run_After=									;���к�
#EndRegion AutoIt3Wrapper Ԥ��������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾:
 �ű�����: 
	Email: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
FileChangeDir(@ScriptDir)
;~ DirRemove("")
ConsoleWrite("Copying examples" & @CRLF)
;~ FileCopy('examples\*.*','AnsiExamples\',9)
;~ FileCopy('libExamples\*.*','AnsiLibExamples\',9)
FileCopy('examples\*.*','UnicodeExamples\',9)
FileCopy('libExamples\*.*','UnicodeLibExamples\',9)
;~ FindAllFile(@ScriptDir & '\AnsiExamples',0)
;~ FindAllFile(@ScriptDir & '\AnsiLibExamples',0)
FindAllFile(@ScriptDir & '\UnicodeExamples',128)
FindAllFile(@ScriptDir & '\UnicodeLibExamples',128)

Func FindAllFile($dir,$dstEnc)
	; Shows the filenames of all files in the current directory.
	$search = FileFindFirstFile($dir & "\*.*")
	; Check if the search was successful
	If $search = -1 Then Return

	While 1
		$file = FileFindNextFile($search)
		If @error Then ExitLoop
		If StringInStr(FileGetAttrib($dir & "\" & $file), "d") Then
			FindAllFile($dir & "\" & $file,$dstEnc)
		Else
			If StringInStr(FileGetAttrib($dir & "\" & $file), "h") Then ContinueLoop
			If StringRight($file, "4") = '.au3' Then Convfile($dir & "\" & $file,$dstEnc)
			If StringRight($file, "4") = '.txt' Then Convfile($dir & "\" & $file,$dstEnc)
			If StringRight($file, "4") = '.ini' Then Convfile($dir & "\" & $file,$dstEnc)
			If StringRight($file, "4") = '.log' Then Convfile($dir & "\" & $file,$dstEnc)
;~ 			If StringRight($file, "4") = '.htm' Then Convfile($dir & "\" & $file)
;~ 			If StringRight($file, "4") = 'ties' Then Convfile($dir & "\" & $file);for *.properties
		EndIf
	WEnd
	; Close the search handle
	FileClose($search)
EndFunc   ;==>FindAllFile

Func Convfile($file,$dstEnc)
	Local $enc=FileGetEncoding($file)
	If $enc <> $dstEnc Then
		ConsoleWrite($file & @CRLF)
		Local $hFile = FileOpen($file, $enc)
		Local $fileC = FileRead($hFile)
		FileClose($hFile)
		$hFile = FileOpen($file, $dstEnc+2)
		FileWrite($hFile, $fileC)
		FileClose($hFile)
	EndIf
EndFunc   ;==>Convfile