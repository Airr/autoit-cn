#Include <APIConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global $tSHFCS, $tIcon, $aIcon, $sPath

; ѡ���ļ���
$sPath = FileSelectFolder('Select Folder', '', 0, @ScriptDir)
If Not $sPath Then
	Exit
EndIf

; ѡ��ͼ��
$aIcon = _WinAPI_PickIconDlg()
If Not IsArray($aIcon) Then
	Exit
EndIf

; ����ͼ�굽ѡ����ļ���
$tSHFCS = DllStructCreate($tagSHFOLDERCUSTOMSETTINGS)
DllStructSetData($tSHFCS, 'Size', DllStructGetSize($tSHFCS))
DllStructSetData($tSHFCS, 'Mask', $FCSM_ICONFILE)
DllStructSetData($tSHFCS, 'IconFile', _WinAPI_CreateString($aIcon[0], $tIcon))
DllStructSetData($tSHFCS, 'SizeIF', 260)
DllStructSetData($tSHFCS, 'IconIndex', $aIcon[1])

_WinAPI_ShellGetSetFolderCustomSettings($sPath, $FCS_FORCEWRITE, $tSHFCS)
