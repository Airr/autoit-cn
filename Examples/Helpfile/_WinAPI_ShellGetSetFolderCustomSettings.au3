#Include  <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $tSHFCS, $tIcon, $aIcon, $sPath

; ѡȡ�ļ���
$sPath = FileSelectFolder('Select Folder ', '', 0, @ScriptDir)
If Not $sPath Then
	Exit
EndIf

; ѡȡͼ��
$aIcon = _WinAPI_PickIconDlg()
If Not IsArray($aIcon) Then
	Exit
EndIf

; ��ͼ�����õ�ѡ���ļ���
$tIcon = DllStructCreate('wchar[260]')
DllStructSetData($tIcon, 1, $aIcon[0])

$tSHFCS = DllStructCreate($tagSHFOLDERCUSTOMSETTINGS)
DllStructSetData($tSHFCS, 'Size ', DllStructGetSize($tSHFCS))
DllStructSetData($tSHFCS, 'Mask ', $FCSM_ICONFILE)
DllStructSetData($tSHFCS, 'IconFile ', DllStructGetPtr($tIcon))
DllStructSetData($tSHFCS, 'SizeIF ', 260)
DllStructSetData($tSHFCS, 'IconIndex ', $aIcon[1])

_WinAPI_ShellGetSetFolderCustomSettings($sPath, $FCS_FORCEWRITE, $tSHFCS)
