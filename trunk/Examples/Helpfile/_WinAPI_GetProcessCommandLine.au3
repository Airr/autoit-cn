#RequireAdmin

#Include <Array.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $hToken, $aAdjust, $aList = 0

; ������ȫ����Ȩ����ȡ���������̵�SeDebugPrivilegeȨ��
$hToken = _WinAPI_OpenProcessToken( BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
_WinAPI_AdjustTokenPrivileges($hToken, $SE_DEBUG_NAME, $SE_PRIVILEGE_ENABLED, $aAdjust)

; ��ȡϵͳ���н��̵������в���
If Not(@error Or @extended) Then
	$aList = ProcessList()
	For $i = 1 To $aList[0][0]
		$aList[$i][1] = _WinAPI_GetProcessCommandLine($aList[$i][1])
	Next
EndIf

; Ĭ������SeDebugPrivilegeȨ��
_WinAPI_AdjustTokenPrivileges($hToken, $SE_DEBUG_NAME, 0, $aAdjust)
_WinAPI_CloseHandle($hToken)

If IsArray($aList) Then
	_arraydisplay($aList, '_WinAPI_GetProcessCommandLine')
EndIf

