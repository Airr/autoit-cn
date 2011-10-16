#RequireAdmin

#Include <APIConstants.au3>
#Include <Array.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global $hToken, $aAdjust, $aList = 0

; Ϊ��ȡ���������̵���ȫ����Ȩ�޶����� "SeDebugPrivilege" ��Ȩ
$hToken = _WinAPI_OpenProcessToken(BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
_WinAPI_AdjustTokenPrivileges($hToken, $SE_DEBUG_NAME, $SE_PRIVILEGE_ENABLED, $aAdjust)

; Ϊϵͳ�����н��̻�ȡ�����в���
If Not (@error Or @extended) Then
	$aList = ProcessList()
	For $i = 1 To $aList[0][0]
		$aList[$i][1] = _WinAPI_GetProcessCommandLine($aList[$i][1])
	Next
EndIf

; Ĭ����������� SeDebugPrivilege ��Ȩ
_WinAPI_AdjustTokenPrivileges($hToken, $aAdjust, 0, $aAdjust)
_WinAPI_CloseHandle($hToken)

_ArrayDisplay($aList, '_WinAPI_GetProcessCommandLine')
