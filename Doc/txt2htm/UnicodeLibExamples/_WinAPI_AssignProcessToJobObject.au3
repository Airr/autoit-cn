﻿#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global Const $sTemp = @TempDir & '\Test.au3'

Global $hFile

; 创建临时 .au3 文件
$hFile = FileOpen($sTemp, 2)
For $i = 1 To 3
	FileWriteLine($hFile, 'Run(@SystemDir & "\calc.exe")')
Next
FileClose($hFile)

; 运行 "calc.exe" 3 次并等待您关闭所有的 3 个进程
_RunWaitEx(@AutoItExe & ' /AutoIt3ExecuteScript "' & $sTemp & '"')

; 删除临时 .au3 文件
FileDelete($sTemp)

Func _RunWaitEx($sCmd)

	; 根据 amel27 的设想

	Local $tProcess = DllStructCreate($tagPROCESS_INFORMATION)
	Local $tStartup = DllStructCreate($tagSTARTUPINFO)
	Local $tInfo = DllStructCreate($tagJOBOBJECT_BASIC_ACCOUNTING_INFORMATION)
	Local $hJob, $hProcess, $hThread

	$hJob = _WinAPI_CreateJobObject()
	If @error Then
		Return SetError(1, 0, 0)
	EndIf
	DllStructSetData($tStartup, 'Size', DllStructGetSize($tStartup))
	If Not _WinAPI_CreateProcess('', $sCmd, 0, 0, 0, 0x01000004, 0, 0, DllStructGetPtr($tStartup), DllStructGetPtr($tProcess)) Then
		Return SetError(1, _WinAPI_CloseHandle($hJob), 0)
	EndIf
	$hProcess = DllStructGetData($tProcess, 'hProcess')
	$hThread = DllStructGetData($tProcess, 'hThread')
	_WinAPI_AssignProcessToJobObject($hJob, $hProcess)
	_WinAPI_ResumeThread($hThread)
	_WinAPI_CloseHandle($hThread)
	Do
		If Not _WinAPI_QueryInformationJobObject($hJob, 1, $tInfo) Then
			ExitLoop
		EndIf
		Sleep(100)
	Until Not DllStructGetData($tInfo, 'ActiveProcesses')
	_WinAPI_CloseHandle($hProcess)
	_WinAPI_CloseHandle($hJob)
	Return 1
EndFunc   ;==>_RunWaitEx

Func _WinAPI_ResumeThread($hThread)

	Local $Ret = DllCall('kernel32.dll', 'dword', 'ResumeThread', 'ptr', $hThread)

	If (@error) Or (_WinAPI_DWordToInt($Ret[0]) = -1) Then
		Return SetError(1, 0, -1)
	EndIf
	Return $Ret[0]
EndFunc   ;==>_WinAPI_AssignProcessToJobObject
