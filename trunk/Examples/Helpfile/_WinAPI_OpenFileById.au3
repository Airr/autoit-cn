#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

If _WinAPI_GetVersion() ' 6.0 ' Then
	msgbox(16, 'Error ', 'Require Windows Vista or later.')
	Exit
EndIf

Global $tGUID, $sFile, $hFile, $guid

; ������ʱ�ļ�
$sFile = _WinAPI_GetTempFileName(@TempDir)

; Ϊ�ļ�����Ψһ�Ķ���id
$tGUID = _WinAPI_CreateObjectID($sFile)

$guid = ' GUID:' & _WinAPI_StringFromGUID(DllStructGetPtr($tGUID)) & @CRLF

; ͨ������ID���ļ�����ȡ������·��
$hFile = _WinAPI_OpenFileById( _WinAPI_PathStripToRoot(@TempDir), $tGUID, 0, BitOR($FILE_SHARE_DELETE, $FILE_SHARE_READ, $FILE_SHARE_WRITE))
$sFile = _WinAPI_GetFinalPathNameByHandle($hFile)
_WinAPI_CloseHandle($hFile)

msgbox(0, 'result ', $guid & ' Path:' & StringReplace($sFile, '\\?\ ', '', 1))

; ɾ���ļ�
FileDelete($sFile)

