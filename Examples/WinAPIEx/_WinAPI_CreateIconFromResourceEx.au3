#Include <APIConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global Const $STM_SETIMAGE = 0x0172

Global $hInstance, $hResource, $hData, $pData, $hIcon, $iIcon, $iSize

; ���� Resources.dll ���ڴ�
$hInstance = _WinAPI_LoadLibraryEx(@ScriptDir & '\Extras\Resources.dll', $LOAD_LIBRARY_AS_DATAFILE)
If Not $hInstance Then
	MsgBox(16, 'Error', @ScriptDir & '\Extras\Resources.dll not found.')
	Exit
EndIf

; �� Resources.dll ���м��� RT_GROUP_ICON ��Դ
$hResource = _WinAPI_FindResource($hInstance, $RT_GROUP_ICON, 1)
$hData = _WinAPI_LoadResource($hInstance, $hResource)
$pData = _WinAPI_LockResource($hData)

; ������ӽ�ָ����С (48x48) ��ͼ���������Դ��
$iIcon = _WinAPI_LookupIconIdFromDirectoryEx($pData, 1, 48, 48)

; �� Resources.dll ����� RT_ICON ��Դ
$hResource = _WinAPI_FindResource($hInstance, $RT_ICON, $iIcon)
$iSize = _WinAPI_SizeOfResource($hInstance, $hResource)
$hData = _WinAPI_LoadResource($hInstance, $hResource)
$pData = _WinAPI_LockResource($hData)

; ����Դ�д���ͼ��
$hIcon = _WinAPI_CreateIconFromResourceEx($pData, $iSize)

; ���ڴ���ж�� Resources.dll
_WinAPI_FreeLibrary($hInstance)

; ���� GUI
GUICreate('MyGUI', 128, 128)
GUICtrlCreateIcon('', 0, 40, 40, 48, 48)
GUICtrlSendMsg(-1, $STM_SETIMAGE, 1, $hIcon)
GUISetState()

Do
Until GUIGetMsg() = -3
