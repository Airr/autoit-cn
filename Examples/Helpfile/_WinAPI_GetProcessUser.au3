#RequireAdmin

#Include <Array.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $hToken, $Data, $aAdjust, $aList = 0

; ����SeDebugPrivilegeȨ���Ի�ȡ�������̵���ȫ����Ȩ��
$hToken = _WinAPI_OpenProcessToken( BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
_WinAPI_AdjustTokenPrivileges($hToken, $SE_DEBUG_NAME, $SE_PRIVILEGE_ENABLED, $aAdjust)

; ��ȡϵͳ���н��̵��û���
If Not(@error Or @extended) Then
	$aList = ProcessList()
	For $i = 1 To $aList[0][0]
		$Data = _WinAPI_GetProcessUser($aList[$i][1])
		If IsArray($Data) Then
			$aList[$i][1] = $Data[0]
		Else
			$aList[$i][1] = ''
		EndIf
	Next
EndIf

; Ĭ������SeDebugPrivilegeȨ��
_WinAPI_AdjustTokenPrivileges($hToken, $aAdjust, 0, $aAdjust)
_WinAPI_CloseHandle($hToken)

If IsArray($aList) Then
	_arraydisplay($aList, '_WinAPI_GetProcessUser')
EndIf

