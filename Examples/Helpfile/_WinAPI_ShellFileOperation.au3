#Include <WinAPIEx.au3>
#Include <File.au3>

Opt('MustDeclareVars ', 1)

Global $hFile, $sTemp

; ������ʱ�ļ�
$sTemp = _TempFile()
$hFile = FileOpen($sTemp, 2)
FileClose($sTemp)

; ɾ��������վ
msgbox(64, 'Created & To be deleted ', StringRegExpReplace($sTemp, '^.*\\', ''))
If FileExists($sTemp) Then
	_WinAPI_ShellFileOperation($sTemp, '', $FO_DELETE, BitOR($FOF_ALLOWUNDO, $FOF_NO_UI)
	If FileExists($sTemp) Then
		msgbox(64, 'info ', 'file not been deleted!')
	Else
		msgbox(64, 'info ', 'file has been deleted!')
	EndIf
EndIf

