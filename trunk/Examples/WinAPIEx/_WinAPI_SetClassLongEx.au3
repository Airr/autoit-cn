#NoTrayIcon

#Include <APIConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global $hForm, $hParent

$hParent = GUICreate('', 0, 0, 0, 0, 0, $WS_EX_TOOLWINDOW)
$hForm = GUICreate('MyGUI', 400, 400, -1, -1, BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU), BitOR($WS_EX_DLGMODALFRAME, $WS_EX_TOPMOST), $hParent)

; �Ƴ�����ͼ��
_WinAPI_DestroyIcon(_WinAPI_GetClassLongEx($hForm, $GCL_HICON))
_WinAPI_SetClassLongEx($hForm, $GCL_HICON, 0)
_WinAPI_SetClassLongEx($hForm, $GCL_HICONSM, 0)

GUISetState()

Do
Until GUIGetMsg() = -3
