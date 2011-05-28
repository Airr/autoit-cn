#Region AutoIt3Wrapper Ԥ�������(���ò���)
#AutoIt3Wrapper_Icon=NSIS 										;ͼ��,֧��EXE,DLL,ICO
#AutoIt3Wrapper_OutFile=									;����ļ���
#AutoIt3Wrapper_OutFile_Type=exe							;�ļ�����
#AutoIt3Wrapper_Compression=4								;ѹ���ȼ�
#AutoIt3Wrapper_UseUpx=y 									;ʹ��ѹ��
#AutoIt3Wrapper_Res_Comment= 								;ע��
#AutoIt3Wrapper_Res_Description=							;��ϸ��Ϣ
#AutoIt3Wrapper_Res_Fileversion=1.0.0.7
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=p				;�Զ����°汾  
#AutoIt3Wrapper_Res_LegalCopyright= 						;��Ȩ
#AutoIt3Wrapper_Change2CUI=y                   				;�޸�����ĳ���ΪCUI(����̨����)
#AutoIt3Wrapper_UseX64=n
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
#include <WinAPI.au3>
#include <Date.au3>

FileChangeDir(@ScriptDir)
DirCreate("UnicodeExamples")
DirCreate("UnicodeLibExamples")
Global $iDstEnc=128
Global $sDstDir
$sDstDir="UnicodeExamples"
FindFile(@ScriptDir & '\Examples')
$sDstDir="UnicodeLibExamples"
FindFile(@ScriptDir & '\LibExamples')

Func FindFile($dir)
	$search = FileFindFirstFile($dir & "\*.*")
	If $search = -1 Then Return

	While 1
		$file = FileFindNextFile($search)
		If @error Then ExitLoop
		If StringInStr(FileGetAttrib($dir & "\" & $file), "d") Then
;~ 			FindAllFile($dir & "\" & $file)
		Else
			If StringInStr(FileGetAttrib($dir & "\" & $file), "h") Then ContinueLoop
			If StringRight($file, "4") = '.au3' Then Convfile($dir,$file)
			If StringRight($file, "4") = '.txt' Then Convfile($dir,$file)
			If StringRight($file, "4") = '.ini' Then Convfile($dir,$file)
			If StringRight($file, "4") = '.log' Then Convfile($dir,$file)
;~ 			If StringRight($file, "4") = '.htm' Then Convfile($dir & "\" & $file)
;~ 			If StringRight($file, "4") = 'ties' Then Convfile($dir & "\" & $file);for *.properties
		EndIf
	WEnd
	; Close the search handle
	FileClose($search)
EndFunc   ;==>FindAllFile

Func Convfile($dir,$file)
	Local $sSrcFile=$dir & "\"& $file
	Local $sDstFile=@ScriptDir & "\" & $sDstDir & "\"& $file
	Local $enc=FileGetEncoding($sSrcFile)
	If Not isNeedConv($sSrcFile, $sDstFile) Then Return
	ConsoleWrite($file & @CRLF)
	Local $hFile = FileOpen($sSrcFile, $enc)
	Local $fileC = FileRead($hFile)
	FileClose($hFile)
	$hFile = FileOpen($sDstFile, $iDstEnc+2)
	FileWrite($hFile, $fileC)
	FileClose($hFile)
	CopyFileTime($sSrcFile, $sDstFile)
EndFunc   ;==>Convfile

Func isNeedConv($sSrcFile, $sDstFile)
	If Not FileExists($sDstFile) Then Return 1
	Local $t,$szInTime,$szOutTime
	$t1 = FileGetTime($sSrcFile,0,1)
	$t2 = FileGetTime($sDstFile,0,1)
	If $t1<>$t2 Then
		ConsoleWrite('SRC FILE:' & $sSrcFile & @CRLF & 'DST FILE:' & $sDstDir & 'FILE TIME:' & $t1 & '/' & $t2 & @CRLF & @CRLF)
		Return 1
	Else
		Return 0
	EndIf
EndFunc   ;==>isGreaterFileTime

Func CopyFileTime($sSrcFile, $sDstFile)
	If Not FileExists($sDstFile) Then Return 1
	Local $hFile,$aTime,$pFile
    ; Read file times
    $hFile = _WinAPI_CreateFile($sSrcFile, 2)
    if $hFile = 0 then Return 0
    $aTime = _Date_Time_GetFileTime($hFile)
    _WinAPI_CloseHandle($hFile)
    ; Set file times
    $hFile = _WinAPI_CreateFile($sDstFile, 2)
    if $hFile = 0 then Return 0
    $pFile = DllStructGetPtr($aTime[2])
    _Date_Time_SetFileTime($hFile, $pFile, $pFile, $pFile)
    _WinAPI_CloseHandle($hFile)
	Return 1
EndFunc   ;==>isGreaterFileTime
